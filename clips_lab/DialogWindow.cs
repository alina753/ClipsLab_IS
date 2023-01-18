using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace clips_lab
{
    public partial class DialogWindow : Form
    {
        /// <summary>
        /// для доступа из основной формы
        /// </summary>
        public List<string> answer_elems = new List<string>();
        public DialogWindow(string answer, List <string> elems)
        {
            InitializeComponent();
            labelDescription.Text = answer;
            for(int i = 0; i < elems.Count; i++)
            {
                listBox1.Items.Add(elems[i]);
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            answer_elems.Add(listBox1.SelectedItem.ToString());
        }
    }
}
