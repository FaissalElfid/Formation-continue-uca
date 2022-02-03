<?php $widget = (is_superadmin_loggedin() ? '4' : '6'); ?>
<div class="row">
	<div class="col-md-12">
		<section class="panel">
				<div class="panel-heading">
                    <div class="panel-btn">
						<a href="javascript:void(0);" onclick="mfp_modal('#multipleImport')" class="btn btn-circle btn-default mb-sm">
							<i class="fas fa-plus-circle"></i> <?=translate('multiple_import')?>
						</a>
                    </div>
					<h4 class="panel-title">
						<i class="far fa-user-circle"></i> <?=translate('add_employee')?>
					</h4>
				</div>
			<?php echo form_open_multipart($this->uri->uri_string()); ?>
				<div class="panel-body">
					<!-- academic details-->
					<div class="headers-line mt-md">
						<i class="fas fa-school"></i> <?=translate('academic_details')?>
					</div>
					<div class="row">
						<div class="col-md-6 mb-sm">
							<div class="form-group">
								<label class="control-label"><?=translate('role')?> <span class="required">*</span></label>
								<?php
									$role_list = $this->app_lib->getRoles();
									echo form_dropdown("user_role", $role_list, set_value('user_role'), "name=\"user_role\" class='form-control'
									data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity' ");
								?>
								<span class="error"><?php echo form_error('user_role'); ?></span>
							</div>
						</div>
					</div>

					<div class="row">
<!--						<div class="col-md-6 mb-sm">-->
<!--							<div class="form-group">-->
<!--								<label class="control-label">--><?//=translate('department')?><!-- <span class="required">*</span></label>-->
<!--								--><?php
//									$department_list = $this->app_lib->getDepartment($branch_id);
//									echo form_dropdown("department_id", $department_list, set_value('department_id'), "class='form-control' id='department_id'
//									data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity'");
//								?>
<!--								<span class="error">--><?php //echo form_error('department_id'); ?><!--</span>-->
<!--							</div>-->
<!--						</div>-->
                        <div class="col-md-6 mb-sm">
                            <div class="form-group">
                                <label class="control-label"><?=translate('class')?></label>
                                <?php
                                $arrayClass = $this->app_lib->getClass(1);
                                echo form_dropdown("class_id", $arrayClass, set_value('class_id'), "name='class_id' class='form-control' data-plugin-selectTwo onchange='getSectionByClass(this.value)'");
                                ?>
                                <span class="error"></span>
                            </div>
                        </div>
                        <div class="col-md-6 mb-sm">
                            <div class="form-group">
                                <label class="control-label"><?=translate('section')?> <span class="required">*</span></label>
                                <?php
                                $arraySection = $this->app_lib->getSections(set_value('class_id'), false);
                                echo form_dropdown("section_id", $arraySection, set_value('section_id'), " name='department_id' class='form-control' data-plugin-selectTwo id='section_id' ");
                                ?>
                                <span class="error"></span>
                            </div>
                        </div>
					</div>

					<!-- employee details -->
					<div class="headers-line mt-md">
						<i class="fas fa-user-check"></i> <?=translate('employee_details')?>
					</div>
					<div class="row">
						<div class="col-md-6 mb-sm">
							<div class="form-group">
								<label class="control-label"><?=translate('name')?> <span class="required">*</span></label>
								<div class="input-group">
									<span class="input-group-addon"><i class="far fa-user"></i></span>
									<input type="text" class="form-control" name="name" value="<?=set_value('name')?>" autocomplete="off" />
								</div>
								<span class="error"><?php echo form_error('name'); ?></span>
							</div>
						</div>
						<div class="col-md-6 mb-sm">
							<div class="form-group">
								<label class="control-label"><?=translate('gender')?></label>
								<?php
									$array = array(
										"" => translate('select'),
										"male" => translate('male'),
										"female" => translate('female')
									);
									echo form_dropdown("sex", $array, set_value('sex'), "name=\"sex\" class='form-control' data-plugin-selectTwo data-width='100%'
									data-minimum-results-for-search='Infinity'");
								?>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-sm">
							<div class="form-group">
								<label class="control-label"><?=translate('mobile_no')?> <span class="required">*</span></label>
								<div class="input-group">
									<span class="input-group-addon"><i class="fas fa-phone-volume"></i></span>
									<input class="form-control" name="mobile_no" type="text" value="<?=set_value('mobile_no')?>" autocomplete="off" />
								</div>
								<span class="error"><?php echo form_error('mobile_no'); ?></span>
							</div>
						</div>
						<div class="col-md-6 mb-sm">
							<div class="form-group">
								<label class="control-label"><?=translate('email')?> <span class="required">*</span></label>
								<div class="input-group">
									<span class="input-group-addon"><i class="far fa-envelope-open"></i></span>
									<input type="text" class="form-control" name="email" id="email" value="<?=set_value('email')?>" autocomplete="off" />
								</div>
								<span class="error"><?php echo form_error('email'); ?></span>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-sm">
							<div class="form-group">
								<label class="control-label"><?=translate('present_address')?> <span class="required">*</span></label>
								<textarea class="form-control" rows="2" name="present_address" placeholder="<?=translate('present_address')?>" ><?=set_value('present_address')?></textarea>
							</div>
							<span class="error"><?php echo form_error('present_address'); ?></span>
						</div>
					</div>

					<!--custom fields details-->
					<div class="row" id="customFields">
						<?php echo render_custom_Fields('employee'); ?>
					</div>

					<div class="row mb-md">
						<div class="col-md-12">
							<div class="form-group">
								<label for="input-file-now"><?=translate('profile_picture')?></label>
								<input type="file" name="user_photo" class="dropify" />
								<span class="error"><?php echo form_error('user_photo'); ?></span>
							</div>
						</div>
					</div>

					<!-- login details -->
					<div class="headers-line">
						<i class="fas fa-user-lock"></i> <?=translate('login_details')?>
					</div>

					<div class="row mb-lg">
						<div class="col-md-6 mb-sm">
							<div class="form-group">
								<label class="control-label"><?=translate('username')?> <span class="required">*</span></label>
								<div class="input-group">
									<span class="input-group-addon"><i class="far fa-user"></i></span>
									<input type="text" class="form-control" name="username" value="<?=set_value('username')?>" autocomplete="off" />
								</div>
								<span class="error"><?php echo form_error('username'); ?></span>
							</div>
						</div>
						<div class="col-md-3 mb-sm">
							<div class="form-group">
								<label class="control-label"><?=translate('password')?> <span class="required">*</span></label>
								<div class="input-group">
									<span class="input-group-addon"><i class="fas fa-unlock-alt"></i></span>
									<input type="password" class="form-control" name="password" value="<?=set_value('password')?>" />
								</div>
								<span class="error"><?php echo form_error('password'); ?></span>
							</div>
						</div>
						<div class="col-md-3 mb-sm">
							<div class="form-group">
								<label class="control-label"><?=translate('retype_password')?> <span class="required">*</span></label>
								<div class="input-group">
									<span class="input-group-addon"><i class="fas fa-unlock-alt"></i></span>
									<input type="password" class="form-control" name="retype_password" value="<?=set_value('retype_password')?>" />
								</div>
								<span class="error"><?php echo form_error('retype_password'); ?></span>
							</div>
						</div>
					</div>
				</div>
				<footer class="panel-footer">
					<div class="row">
						<div class="col-md-offset-10 col-md-2">
							<button type="submit" name="submit" value="save" class="btn btn btn-default btn-block"> <i class="fas fa-plus-circle"></i> <?=translate('save')?></button>
						</div>
					</div>
				</footer>
			<?php echo form_close();?>
		</section>
	</div>
</div>

<!-- multiple import modal -->
<div id="multipleImport" class="zoom-anim-dialog modal-block modal-block-lg mfp-hide">
    <section class="panel">
        <div class="panel-heading">
            <h4 class="panel-title"><i class="fas fa-plus-circle"></i> <?php echo translate('multiple_import'); ?></h4>
        </div>
        <?php echo form_open_multipart('employee/csv_import', array('class' => 'form-horizontal', 'id' => 'importCSV')); ?>
            <div class="panel-body">
            	<div class="alert-danger" id="errorList" style="display: none; padding: 8px;">rthtrhtr</div>
				<div class="form-group mt-md">
					<div class="col-md-12 mb-md">
						<a class="btn btn-default pull-right" href="<?=base_url('employee/csv_Sampledownloader')?>">
							<i class='fas fa-file-download'></i> Download Sample Import File
						</a>
					</div>
					<div class="col-md-12">
						<div class="alert alert-subl">
							<strong>Instructions :</strong><br/>
							1. Download the first sample file.<br/>
							2. Open the downloaded "CSV" file and carefully fill in the employee details.<br/>
							3. The date you are trying to enter the "Date Of Birth" and "Joining Date" column make sure the date format is Y-m-d (<?=date('Y-m-d')?>).<br/>
						</div>
					</div>
				</div>
<?php if (is_superadmin_loggedin()) { ?>
				<div class="form-group">
					<label class="col-md-3 control-label"><?=translate('branch')?> <span class="required">*</span></label>
					<div class="col-md-9">
						<?php
							$arrayBranch = $this->app_lib->getSelectList('branch');
							echo form_dropdown("branch_id", $arrayBranch, set_value('branch_id'), "class='form-control' id='branchID_mod'
							data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity'");
						?>
						<span class="error"></span>
					</div>
				</div>
<?php } ?>
				<div class="form-group">
					<label class="col-md-3 control-label"><?=translate('role')?> <span class="required">*</span></label>
					<div class="col-md-9">
						<?php
							$role_list = $this->app_lib->getRoles();
							echo form_dropdown("user_role", $role_list, set_value('user_role'), " class='form-control'
							data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity' ");
						?>
						<span class="error"></span>
					</div>
				</div>
				<div class="form-group mb-xs">
					<label class="control-label col-md-3">Select CSV File <span class="required">*</span></label>
					<div class="col-md-9">
						<input type="file" name="userfile" class="dropify" data-height="70" data-allowed-file-extensions="csv" />
						<span class="error"></span>
					</div>
				</div>
            </div>
            <footer class="panel-footer">
                <div class="row">
                    <div class="col-md-12 text-right">
                        <button type="submit" class="btn btn-default mr-xs" id="bankaddbtn" data-loading-text="<i class='fas fa-spinner fa-spin'></i> Processing">
                            <i class="fas fa-plus-circle"></i> <?php echo translate('import'); ?>
                        </button>
                        <button class="btn btn-default modal-dismiss"><?php echo translate('close'); ?></button>
                    </div>
                </div>
            </footer>
        <?php echo form_close(); ?>
    </section>
</div>
