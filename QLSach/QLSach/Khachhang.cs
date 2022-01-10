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
    public partial class Khachhang : Form
    {
        SqlConnection connection;
    SqlCommand command;
    string str = @"Data Source=LAPTOP-9GO55CGG;Initial Catalog=QLSach;Integrated Security=True";
    SqlDataAdapter adapter = new SqlDataAdapter();
    DataTable table = new DataTable();

    void loaddata()
    {
        command = connection.CreateCommand();
        command.CommandText = "select * from Khachhang";
        adapter.SelectCommand = command;
        table.Clear();
        adapter.Fill(table);
        dataGridView1.DataSource = table;
    }
        public Khachhang()
        {
            InitializeComponent();
        }

        private void txtTon_TextChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMakhachhang.ReadOnly = true;
            int i;
            i = dataGridView1.CurrentRow.Index;
            txtMakhachhang.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            txtTenkhachhang.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
            txtGioitinh.Text = dataGridView1.Rows[i].Cells[2].Value.ToString();
            txtSoDT.Text = dataGridView1.Rows[i].Cells[3].Value.ToString();
            txtDC.Text = dataGridView1.Rows[i].Cells[4].Value.ToString();
            txtEmail.Text = dataGridView1.Rows[i].Cells[5].Value.ToString();
        }

        private void Khachhang_Load(object sender, EventArgs e)
        {
            connection = new SqlConnection(str);
            connection.Open();
            loaddata();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
