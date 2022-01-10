using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QLSach
{
    public partial class Kho : Form
    {
        SqlConnection connection;
        SqlCommand command;
        string str = @"Data Source=LAPTOP-9GO55CGG;Initial Catalog=QLSach;Integrated Security=True";
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataTable table = new DataTable();

        void loaddata()
        {
            command = connection.CreateCommand();
            command.CommandText = "select * from Kho";
            adapter.SelectCommand = command;
            table.Clear();
            adapter.Fill(table);
            dgv1.DataSource = table;
        }
        public Kho()
        {
            InitializeComponent();
        }
      
        


        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMasach.ReadOnly = true;
            int j;
            j = dgv1.CurrentRow.Index;
            txtMasach.Text = dgv1.Rows[j].Cells[0].Value.ToString();
            txtLoaisach.Text = dgv1.Rows[j].Cells[1].Value.ToString();
            txtDonvi.Text = dgv1.Rows[j].Cells[2].Value.ToString();
            txtTon.Text = dgv1.Rows[j].Cells[3].Value.ToString();
            txtGTT.Text = dgv1.Rows[j].Cells[4].Value.ToString();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void Kho_Load_1(object sender, EventArgs e)
        {
            connection = new SqlConnection(str);
            connection.Open();
            loaddata();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            command = connection.CreateCommand();
            command.CommandText = "insert into Kho values('" + txtMasach.Text + "', '" + txtLoaisach.Text + "','" + txtDonvi.Text + "','" + txtTon.Text + "','" + txtGTT.Text + "')";
            command.ExecuteNonQuery();
            loaddata();
        }
        private void button3_Click(object sender, EventArgs e)
        {
            command = connection.CreateCommand();
            command.CommandText = "update Kho set LoaiSach='" + txtLoaisach.Text + "',DonViTinh='" + txtDonvi.Text + "',TonKho='" + txtTon.Text + "',GiaTriTon='" + txtGTT.Text + "' where MaHang='" + txtMasach.Text + "' ";
            command.ExecuteNonQuery();
            loaddata();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa dữ liệu này?", "Cảnh báo!", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                command = connection.CreateCommand();
                command.CommandText = "delete from Kho where MaHang='" + txtMasach.Text + "' ";
                command.ExecuteNonQuery();
                loaddata();
            }
        }
    }
}
