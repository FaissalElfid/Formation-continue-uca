<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Accounting_model extends MY_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    // get transitions repots
    public function getTransitionsRepots($branchID, $start = '', $end = '')
    {
        $sql = "SELECT transactions.*, accounts.name as ac_name, voucher_head.name as v_head, payment_types.name as via_name FROM transactions LEFT JOIN
        accounts ON accounts.id = transactions.account_id LEFT JOIN voucher_head ON voucher_head.id = transactions.voucher_head_id LEFT JOIN
        payment_types ON payment_types.id = transactions.pay_via WHERE transactions.date >= " . $this->db->escape($start) . " AND
        transactions.date <= " . $this->db->escape($end) . " AND transactions.branch_id = " . $this->db->escape($branchID) . " ORDER BY transactions.id ASC";
        return $this->db->query($sql)->result_array();
    }

    // duplicate voucher head check in db
    public function unique_voucher_head($name)
    {
        $branchID = $this->application_model->get_branch_id();
        $voucher_head_id = $this->input->post('voucher_head_id');
        if (!empty($voucher_head_id)) {
            $this->db->where_not_in('id', $voucher_head_id);
        }

        $this->db->where(array('name' => $name, 'branch_id' => $branchID));
        $query = $this->db->get('voucher_head');
        if ($query->num_rows() > 0) {
            $this->form_validation->set_message("unique_voucher_head", translate('already_taken'));
            return false;
        } else {
            return true;
        }
    }

    // duplicate account name check in db
    public function unique_account_name($name)
    {
        $account_id = $this->input->post('account_id');
        if (!empty($account_id)) {
            $this->db->where_not_in('id', $account_id);
        }

        $this->db->where('name', $name);
        $query = $this->db->get('accounts');
        if ($query->num_rows() > 0) {
            $this->form_validation->set_message("unique_account_name", translate('already_taken'));
            return false;
        } else {
            return true;
        }
    }
}
