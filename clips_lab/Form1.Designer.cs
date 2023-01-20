namespace clips_lab
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.listBox1_facts = new System.Windows.Forms.ListBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.listBox2_using_facts = new System.Windows.Forms.ListBox();
            this.label3 = new System.Windows.Forms.Label();
            this.listBox3_rules = new System.Windows.Forms.ListBox();
            this.label4 = new System.Windows.Forms.Label();
            this.listBox4_res = new System.Windows.Forms.ListBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.button3 = new System.Windows.Forms.Button();
            this.checkBox1 = new System.Windows.Forms.CheckBox();
            this.SuspendLayout();
            // 
            // listBox1_facts
            // 
            this.listBox1_facts.FormattingEnabled = true;
            this.listBox1_facts.ItemHeight = 16;
            this.listBox1_facts.Location = new System.Drawing.Point(13, 63);
            this.listBox1_facts.Name = "listBox1_facts";
            this.listBox1_facts.Size = new System.Drawing.Size(268, 452);
            this.listBox1_facts.TabIndex = 0;
            this.listBox1_facts.SelectedIndexChanged += new System.EventHandler(this.listBox1_facts_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label1.Location = new System.Drawing.Point(12, 19);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(115, 25);
            this.label1.TabIndex = 1;
            this.label1.Text = "Все факты";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label2.Location = new System.Drawing.Point(316, 19);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(187, 25);
            this.label2.TabIndex = 3;
            this.label2.Text = "Выбранные факты";
            // 
            // listBox2_using_facts
            // 
            this.listBox2_using_facts.FormattingEnabled = true;
            this.listBox2_using_facts.ItemHeight = 16;
            this.listBox2_using_facts.Location = new System.Drawing.Point(317, 63);
            this.listBox2_using_facts.Name = "listBox2_using_facts";
            this.listBox2_using_facts.Size = new System.Drawing.Size(268, 212);
            this.listBox2_using_facts.TabIndex = 2;
            this.listBox2_using_facts.SelectedIndexChanged += new System.EventHandler(this.listBox2_using_facts_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label3.Location = new System.Drawing.Point(624, 19);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(249, 25);
            this.label3.TabIndex = 5;
            this.label3.Text = "Использованные правила";
            // 
            // listBox3_rules
            // 
            this.listBox3_rules.FormattingEnabled = true;
            this.listBox3_rules.ItemHeight = 16;
            this.listBox3_rules.Location = new System.Drawing.Point(625, 63);
            this.listBox3_rules.Name = "listBox3_rules";
            this.listBox3_rules.Size = new System.Drawing.Size(268, 212);
            this.listBox3_rules.TabIndex = 4;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label4.Location = new System.Drawing.Point(628, 304);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(111, 25);
            this.label4.TabIndex = 7;
            this.label4.Text = "Результат";
            // 
            // listBox4_res
            // 
            this.listBox4_res.FormattingEnabled = true;
            this.listBox4_res.ItemHeight = 16;
            this.listBox4_res.Location = new System.Drawing.Point(629, 348);
            this.listBox4_res.Name = "listBox4_res";
            this.listBox4_res.Size = new System.Drawing.Size(268, 212);
            this.listBox4_res.TabIndex = 6;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.button1.Location = new System.Drawing.Point(321, 305);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(264, 66);
            this.button1.TabIndex = 8;
            this.button1.Text = "Вывести";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.button2.Location = new System.Drawing.Point(12, 525);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(264, 41);
            this.button2.TabIndex = 9;
            this.button2.Text = "Выбрать";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // button3
            // 
            this.button3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.button3.Location = new System.Drawing.Point(321, 394);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(264, 66);
            this.button3.TabIndex = 10;
            this.button3.Text = "Очистить";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // checkBox1
            // 
            this.checkBox1.AutoSize = true;
            this.checkBox1.Location = new System.Drawing.Point(321, 476);
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(136, 20);
            this.checkBox1.TabIndex = 11;
            this.checkBox1.Text = "Выключить звук";
            this.checkBox1.UseVisualStyleBackColor = true;
            this.checkBox1.CheckedChanged += new System.EventHandler(this.checkBox1_CheckedChanged);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(931, 578);
            this.Controls.Add(this.checkBox1);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.listBox4_res);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.listBox3_rules);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.listBox2_using_facts);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.listBox1_facts);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox listBox1_facts;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ListBox listBox2_using_facts;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ListBox listBox3_rules;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ListBox listBox4_res;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.CheckBox checkBox1;
    }
}

