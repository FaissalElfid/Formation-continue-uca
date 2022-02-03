<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @package : Ramom school management system
 * @version : 4.0
 * @developed by : Faissal EL FID
 * @support : faissal.elfid@gmail.com
 * @copyright : Reserved for an IRISI Student
 * @filename : Dashboard.php

 */

class Dashboard extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('dashboard_model');
    }

    public function index()
    {
            if (is_superadmin_loggedin()) {
                if ($this->input->get('school_id')) {
                    $schoolID = $this->input->get('school_id');
                    $this->data['title'] = get_type_name_by_id('branch', $schoolID) . " " . translate('branch_dashboard');
                } else {
                    $this->data['title'] = translate('all_branch_dashboard');
                    $schoolID = "";
                }
            }
            $this->data['school_id'] = 1;
            $this->data['get_staff_count'] = $this->dashboard_model->getStaffCounter($schoolID);
            $this->data['get_monthly_admission'] = $this->dashboard_model->getMonthlyAdmission($schoolID);
            $this->data['sub_page'] = 'dashboard/index';

        $this->data['headerelements'] = array(
            'css' => array(
                'vendor/fullcalendar/fullcalendar.css',
            ),
            'js' => array(
                'vendor/chartjs/chart.min.js',
                'vendor/echarts/echarts.common.min.js',
                'vendor/moment/moment.js',
                'vendor/fullcalendar/fullcalendar.js',
            ),
        );
        $this->data['main_menu'] = 'dashboard';
        $this->load->view('layout/index', $this->data);
    }
}
