using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLSach
{
    public partial class Sach : Form
    {
        SqlConnection connection;
        SqlCommand command;
        string str = @"Data Source=LAPTOP-9GO55CGG;Initial Catalog=QLSach;Integrated Security=True";
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataTable table = new DataTable();

        void loaddata()
        {
            command = connection.CreateCommand();
            command.CommandText = "select * from Sach";
            adapter.SelectCommand = command;
            table.Clear();
            adapter.Fill(table);
            dgv.DataSource = table;
        }
        public Sach()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            connection = new SqlConnection(str);
            connection.Open();
            loaddata();


        }

        private void dgv_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMasach.ReadOnly = true;
            int i;
            i = dgv.CurrentRow.Index;
            txtMasach.Text = dgv.Rows[i].Cells[0].Value.ToString();
            txtTensach.Text = dgv.Rows[i].Cells[1].Value.ToString();
            dtpNhap.Text = dgv.Rows[i].Cells[2].Value.ToString();
            txtGia.Text = dgv.Rows[i].Cells[3].Value.ToString();
            txtTrangthai.Text = dgv.Rows[i].Cells[4].Value.ToString();
            txtDanhgia.Text = dgv.Rows[i].Cells[5].Value.ToString();

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            command = connection.CreateCommand();
            command.CommandText = "insert into Sach values('" + txtMasach.Text + "', '" + txtTensach.Text + "','" + dtpNhap.Text + "','" + txtGia.Text + "','" + txtTrangthai.Text + "','" + txtDanhgia.Text + "')";
            command.ExecuteNonQuery();
            loaddata();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa mặt hàng này?", "Cảnh báo!", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                command = connection.CreateCommand();
                command.CommandText = "delete from Sach where MaSach='" + txtMasach.Text + "' ";
                command.ExecuteNonQuery();
                loaddata();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            command = connection.CreateCommand();
            command.CommandText = "update Sach set TenSach='" + txtTensach.Text + "',NgayNhap='" + dtpNhap.Text + "',Gia='" + txtGia.Text + "',TrangThai='" + txtTrangthai.Text + "',DanhGia='" + txtDanhgia.Text + "' where MaSach='" + txtMasach.Text + "' ";
            command.ExecuteNonQuery();
            loaddata();
        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void btnsearch_Click(object sender, EventArgs e)
        {
            command = connection.CreateCommand();
            command.CommandText = "select * from Sach where TenSach like '%" + txtKey.Text + "%'";
            command.ExecuteNonQuery();
            loaddata();
        }

        private void txtKey_TextChanged(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }


        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void txtMa_TextChanged(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void txtTen_TextChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void txtTrangthai_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtDanhgia_TextChanged(object sender, EventArgs e)
        {

        }

        private void QuanlyloaihangToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void thốngKêBáoCáoToolStripMenuItem_Click(object sender, EventArgs e)
        {
           
        }

        private void hóaĐơnToolStripMenuItem_Click(object sender, EventArgs e)
        {
          
        }

        private void quảnLýDanhSáchKháchHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void khoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Kho f = new Kho();
            f.ShowDialog();
        }

        private void hoáĐơnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form1 f = new Form1();
            f.ShowDialog();
        }

        private void kháchHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Khachhang f = new Khachhang();
            f.ShowDialog();
        }
    }
}
