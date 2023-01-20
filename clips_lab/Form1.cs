using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Text.RegularExpressions;
using CLIPSNET;
using System.Speech.Synthesis;
using System.Globalization;

namespace clips_lab
{

    public partial class Form1 : Form
    {

        /// <summary>
        /// facts selected by user
        /// </summary>
        List<string> using_facts = new List<string>();
        /// <summary>
        /// [name, id]
        /// </summary>
        Dictionary<string, string> facts = new Dictionary<string, string>();
        /// <summary>
        /// [id, name]
        /// </summary>
        Dictionary<string, string> inverseDic_facts;

        /// <summary>
        /// rules[id] = [rule:THEN-part, IF-part]
        /// </summary>
        Dictionary<string, List<string>> rules = new Dictionary<string, List<string>>();



        private CLIPSNET.Environment clips = new CLIPSNET.Environment();
        private static SpeechSynthesizer synth;
        int volume;
        public Form1()
        {
            InitializeComponent();

            synth = new SpeechSynthesizer();
            synth.SetOutputToDefaultAudioDevice();
            var voices = synth.GetInstalledVoices();
            synth.SelectVoice("Microsoft Irina Desktop");
            synth.Rate = 5;
            volume = synth.Volume;

            synth.SpeakAsync("Добро пожаловать, юный алхимик! Выбери файл фактов и clips файл с набором правил.");
        }

        private async void CLIPSfileFacts()
        {
            string path = "facts.clp";
            using (StreamWriter writer = new StreamWriter(path, true))
            {
                foreach (var fact in facts)
                {
                    await writer.WriteLineAsync($"      (elem (name {fact.Key.Split('\'')[1]}))");
                }
            }
        }

        private async void CLIPSfileRules()
        {
            string path = "../Debug/rules.clp";
            using (StreamWriter writer = new StreamWriter(path, true))
            {
                int i = 0;
                foreach (var rule in rules)
                {
                    i++;
                    string f1 = inverseDic_facts[rule.Value[1]].Split('\'')[1];
                    string f2 = inverseDic_facts[rule.Value[2]].Split('\'')[1];
                    string f3 = inverseDic_facts[rule.Value[0]].Split('\'')[1];
                    await writer.WriteLineAsync($"(defrule Rule{i} \"\"\n" +
                                                    $"  (declare (salience 20))\n" +
                                                    $"  (elem (name {f1}) (CF ?c1))\n  (elem (name {f2}) (CF ?c2))\n" +
                                                    $"=>\n" +
                                                    $"  (assert (appendmessage \"{f1} + {f2} = {f3};  \"))\n" +
                                                    $"  (assert (elem (name {f3}) (CF (/ (+ ?c1 ?c2)(- 1 (min ?c1 ?c2))))))\n" +
                                                    $")\n");
                }
            }

        }

        private void Rules_completion()
        {
            string r_file_name = "RulesForProductions.txt";
            string lines = File.ReadAllText(r_file_name);

            Regex regex_if = new Regex(@"[A-Z]\d+,[A-Z]\d+");
            MatchCollection matches_if;

            Regex regex_then = new Regex(@"- [A-Z]\d+");
            MatchCollection matches_then;

            Regex regex_id = new Regex(@"[A-Z]\d+ :");
            MatchCollection matches_id;

            matches_if = regex_if.Matches(lines);
            matches_then = regex_then.Matches(lines);
            matches_id = regex_id.Matches(lines);

            int i = 0;
            foreach (Match match_if in matches_if)
            {
                List<string> if_facts = match_if.Value.Split(',').ToList();
                string then_fact = matches_then[i].Value.Substring(2);
                string id = matches_id[i].Value.Substring(0, matches_id[i].Value.Length - 2);

                List<string> rules_facts = new List<string>();
                rules_facts.Add(then_fact);
                for (int j = 0; j < if_facts.Count; j++)
                {
                    rules_facts.Add(if_facts[j]);
                }
                rules[id] = rules_facts;

                i++;
            }
        }

        private void Facts_completion(string file_name)
        {
            string lines = File.ReadAllText(file_name);

            Regex regex_names = new Regex(@"'.+'");
            MatchCollection matches_names;

            Regex regex_ids = new Regex(@"[A-Z]\d+");
            MatchCollection matches_ids;

            matches_names = regex_names.Matches(lines);
            matches_ids = regex_ids.Matches(lines);

            int i = 0;
            foreach (Match match_id in matches_ids)
            {
                string id = match_id.Value;
                string name = matches_names[i].Value;
                //заполняем словарь фактов
                facts[name] = id;
                i++;

                listBox1_facts.Items.Add(name.Split('\'')[1]);
            }

            inverseDic_facts = facts.ToDictionary(g => g.Value, g => g.Key);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            clips.Reset();
            foreach (var elem in listBox2_using_facts.Items)
            {
                List<string> list = elem.ToString().Split('(').ToList();
                string name = list[0];
                double certainty = Convert.ToDouble(list[1].TrimEnd(')'));
                clips.Eval($"(assert(appendmessage \"Новый элемент { name }\n\" ))");
                clips.Eval($"(assert(elem (name { name }) (CF { certainty.ToString(CultureInfo.InvariantCulture) })))");
            }

            clips.Run();
            PrintFacts();
            clips.Eval("(assert (clearmessage))");
        }

        private void PrintFacts()
        {

            this.listBox4_res.Items.Clear();
            this.listBox3_rules.Items.Clear();

            FactAddressValue fv = clips.FindFact("ioproxy");
            MultifieldValue damf = (MultifieldValue)fv["messages"];

            MultifieldValue vamf = (MultifieldValue)fv["answers"];


            var facts = clips.FindAllFacts("elem").Select(f => f["name"]).ToList();
            var certaints = clips.FindAllFacts("elem").Select(f => f["CF"]).ToList();


            List<string> result_list = new List<string>();
            
            for (int i = 0; i < damf.Count; i++)
            {
                LexemeValue da = (LexemeValue)damf[i];
                byte[] bytes = Encoding.Default.GetBytes(da.Value);
                string elem = Encoding.UTF8.GetString(bytes);
                this.listBox3_rules.Items.Add(elem + "\n");
            }

            string elems_to_say = "";//для озвучки
            //заполнение окна полученных фактов
            for (int i = 0; i < facts.Count; i++)
            {
                byte[] f_bytes = Encoding.Default.GetBytes(facts[i].ToString());
                byte[] c_bytes = Encoding.Default.GetBytes(certaints[i].ToString());
                string name = Encoding.UTF8.GetString(f_bytes);
                string certainty = Encoding.UTF8.GetString(c_bytes);
                this.listBox4_res.Items.Add($"{name.TrimStart('(').TrimEnd(')')} ({Math.Round(Convert.ToDouble(certainty), 2)})\n");
                elems_to_say += name;
            }
            synth.SpeakAsync("Получены элементы: " + elems_to_say);//озвучка


            List<string> elems = new List<string>();
            if (vamf.Count > 0 && facts.Count < 2)
            {
                LexemeValue va = (LexemeValue)vamf[0];
                byte[] bytes = Encoding.Default.GetBytes(va.Value);
                string label_answer = Encoding.UTF8.GetString(bytes);
                synth.SpeakAsync(label_answer);
                for(int i = 1; i < vamf.Count; i++)
                {
                    va = (LexemeValue)vamf[i];
                    bytes = Encoding.Default.GetBytes(va.Value);
                    string answer = Encoding.UTF8.GetString(bytes);
                    elems.Add(answer);
                    synth.SpeakAsync(answer);
                }
                var window = new DialogWindow(label_answer, elems);

                //вытаскиваем данные из диалогового окна через анонимный метод, возникающий перед закрытием
                window.FormClosing += (sender1, e1) =>
                {
                    //Обновляем текстбокс основной формы
                    foreach (string el in window.answer_elems)
                    {
                        if (!listBox2_using_facts.Items.Contains(el))
                            listBox2_using_facts.Items.Add(el);
                    }
                    synth.SpeakAsync("отлично, теперь нажмите вывести");
                };

                window.ShowDialog(this);
            }
            
        }

        private void listBox1_facts_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(!listBox2_using_facts.Items.Contains(listBox1_facts.SelectedItem))
            {
                var window = new DWCertainty();

                string c = "";

                //вытаскиваем данные из диалогового окна через анонимный метод, возникающий перед закрытием
                window.FormClosing += (sender1, e1) =>
                {
                    c = window.certainty.ToString();
                };

                window.ShowDialog(this);

                listBox2_using_facts.Items.Add(listBox1_facts.SelectedItem + " (" + c + ")");
            }

        }

        private void listBox2_using_facts_SelectedIndexChanged(object sender, EventArgs e)
        {
            listBox2_using_facts.Items.Remove(listBox2_using_facts.SelectedItem);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string facts_file_name;
            while (true)
            {
                if (openFileDialog1.ShowDialog() == DialogResult.Cancel)
                    return;

                facts_file_name = openFileDialog1.FileName;
                if (!facts_file_name.EndsWith(".txt"))
                    MessageBox.Show("Выберите файл формата .txt");
                else
                    break;
            }
            Facts_completion(facts_file_name);
            Rules_completion();
            CLIPSfileRules();

            synth.SpeakAsync("Факты выбраны, теперь правила");

            string clp_file_name;
            while (true)
            {
                if (openFileDialog1.ShowDialog() == DialogResult.Cancel)
                    return;
                clp_file_name = openFileDialog1.FileName;

                if (!clp_file_name.EndsWith(".clp"))
                    MessageBox.Show("Выберите файл формата .clp");
                else
                    break;
            }
                
            clips.LoadFromString(System.IO.File.ReadAllText(clp_file_name));

            synth.SpeakAsync("Молодец. Теперь выбери элементы, которые хочешь смешать и нажми кнопку вывести");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            listBox2_using_facts.Items.Clear();
            listBox3_rules.Items.Clear();
            listBox4_res.Items.Clear();
        }

        
        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            synth.Volume = (synth.Volume > 0) ? synth.Volume = 0 : synth.Volume = volume;
        }
    }
}
