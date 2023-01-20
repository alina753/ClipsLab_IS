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
    public partial class DWCertainty : Form
    {
        public double certainty;
        public DWCertainty()
        {
            InitializeComponent();
        }


        private void button1_Click(object sender, EventArgs e)
        {
            certainty = Convert.ToDouble(Convert.ToDouble(trackBar1.Value)*0.1);
            
            Close();
        }
    }
}
