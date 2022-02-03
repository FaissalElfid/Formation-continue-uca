<?php
$div = 0;
if (get_permission('student_count_widget', 'is_view')) {
    $div++;
}

if ($div == 0) {
    $widget1 = 0;
}else{
    $widget1 = 12 / $div;
}

$div2 = 0;
if (get_permission('admission_count_widget', 'is_view')) {
    $div2++;
}
if ($div2 == 0) {
    $widget2 = 0;
}else{
    $widget2 = 12 / $div2;
}
?>
<div class="dashboard-page">
    <?php if ($widget1 > 0) { ?>
        <div class="row" style="justify-content: center; display: flex; align-items: center">
            <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="panel">
                    <div class="row widget-row-in">
                        <?php if (get_permission('student_count_widget', 'is_view')) { ?>
                            <div class="col-lg-<?php echo $widget1; ?> col-sm-6">
                                <div class="panel-body">
                                    <div class="widget-col-in row">
                                        <div class="col-md-6 col-sm-6 col-xs-6"> <i class="fas fa-user-graduate"></i>
                                            <h5 class="text-muted"><?php echo translate('students'); ?></h5> </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <h3 class="counter text-right mt-md text-primary"><?=$get_total_student?></h3>
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="box-top-line line-color-primary">
                                                <span class="text-muted text-uppercase"><?php echo translate('total_strength'); ?></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
                        <?php if (get_permission('admission_count_widget', 'is_view')) { ?>
                            <div class="col-lg-<?php echo $widget2; ?> col-sm-6 ">
                                <div class="panel-body">
                                    <div class="widget-col-in row">
                                        <div class="col-md-6 col-sm-6 col-xs-6"> <i class="far fa-address-card"></i>
                                            <h5 class="text-muted"><?php echo translate('admission'); ?></h5>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <h3 class="counter text-right mt-md text-primary"><?=$get_monthly_admission;?></h3>
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="box-top-line line-color-primary">
                                                <span class="text-muted text-uppercase"><?php echo translate('interval_month'); ?></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>

    <div class="zoom-anim-dialog modal-block modal-block-primary mfp-hide" id="modal">
        <section class="panel">
            <header class="panel-heading">
                <div class="panel-btn">
                    <button onclick="fn_printElem('printResult')" class="btn btn-default btn-circle icon" ><i class="fas fa-print"></i></button>
                </div>
                <h4 class="panel-title"><i class="fas fa-info-circle"></i> <?=translate('event_details')?></h4>
            </header>
            <div class="panel-body">
                <div id="printResult" class=" pt-sm pb-sm">
                    <div class="table-responsive">
                        <table class="table table-bordered table-condensed text-dark tbr-top" id="ev_table">

                        </table>
                    </div>
                </div>
            </div>
            <footer class="panel-footer">
                <div class="row">
                    <div class="col-md-12 text-right">
                        <button class="btn btn-default modal-dismiss">
                            <?=translate('close')?>
                        </button>
                    </div>
                </div>
            </footer>
        </section>
    </div>
