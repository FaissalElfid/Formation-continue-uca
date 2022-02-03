<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @package : Ramom school management system
 * @version : 4.0
 * @developed by : Faissal EL FID
 * @support : faissal.elfid@gmail.com
 * @copyright : Reserved for an IRISI Student
 * @filename : Cron_api.php

 */

class Cron_api extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('fees_model');
        $this->load->model('sms_model');
        $this->load->model('sendsmsmail_model');
        $this->api_key = $this->data['global_config']['cron_secret_key'];
    }

    public function index()
    {
        if (!is_loggedin() || !get_permission('cron_job', 'is_view')) {
            access_denied();
        }

        if ($_POST) {
            if (!get_permission('cron_job', 'is_edit')) {
                access_denied();
            }
            $this->db->where('id', 1);
            $this->db->update('global_settings', array('cron_secret_key' => generate_encryption_key()));
            set_alert('success', "Successfully Created The New Secret Key.");
            redirect(current_url());
        }

        $this->data['title'] = translate('cron_job');
        $this->data['sub_page'] = 'cron_api/index';
        $this->data['main_menu'] = 'settings';
        $this->load->view('layout/index', $this->data);
    }

    public function send_smsemail_command($api_key = '')
    {
        if ($api_key != "" && $this->api_key != $api_key) {
            echo "API Key is required or API Key does not match.";
            exit();
        }

        $sql = "SELECT * FROM bulk_sms_email WHERE posting_status = 1 AND schedule_time < NOW() ORDER BY schedule_time ASC";
        $bulkArray = $this->db->query($sql)->result_array();
        foreach ($bulkArray as $key => $row) {
            $this->db->where('id', $row['id']);
            $this->db->update('bulk_sms_email', array('posting_status' => 0));
            $sCount = 0;
            $usersList = json_decode($row['additional'], true);
            foreach ($usersList as $key => $user) {
                if ($row['message_type'] == 1) {
                    $response = $this->sendsmsmail_model->sendSMS($user['mobileno'], $row['message'], $user['name'], $user['email'], $row['sms_gateway']);
                } else {
                    $response = $this->sendsmsmail_model->sendEmail($user['email'], $row['message'], $user['name'], $user['mobileno'], $row['email_subject']);
                }
                if ($response == true) {
                    $sCount++;
                }
            }
            $this->db->where('id', $row['id']);
            $this->db->update('bulk_sms_email', array('additional' => "", 'successfully_sent' => $sCount, 'posting_status' => 2));
        }
    }
}
