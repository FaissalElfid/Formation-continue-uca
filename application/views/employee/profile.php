<?php $widget = (is_superadmin_loggedin() ? '4' : '6'); ?>
<div class="row appear-animation" data-appear-animation="<?=$global_config['animations'] ?>">
	<div class="col-md-12 mb-lg">
		<div class="profile-head social">
			<div class="col-md-12 col-lg-4 col-xl-3">
				<div class="image-content-center user-pro">
					<div class="preview">
						<ul class="social-icon-one">
							<li><a href="<?=empty($staff['facebook_url']) ? '#' : $staff['facebook_url']?>"><span class="fab fa-facebook-f"></span></a></li>
							<li><a href="<?=empty($staff['twitter_url']) ? '#' : $staff['twitter_url']?>"><span class="fab fa-twitter"></span></a></li>
							<li><a href="<?=empty($staff['linkedin_url']) ? '#' : $staff['linkedin_url']?>"><span class="fab fa-linkedin-in"></span></a></li>
						</ul>
						<img src="<?=get_image_url('staff', $staff['photo'])?>">
					</div>
				</div>
			</div>
			<div class="col-md-12 col-lg-5 col-xl-5">
				<h5><?php echo $staff['name']; ?></h5>
				<p><?php echo ucfirst($staff['role'])?></p>
				<ul>
					<li><div class="icon-holder" data-toggle="tooltip" data-original-title="<?=translate('department')?>"><i class="fas fa-user-tie"></i></div> <?=(!empty($staff['department_name']) ? $staff['department_name'] : 'N/A'); ?></li>
					<li><div class="icon-holder" data-toggle="tooltip" data-original-title="<?=translate('mobile_no')?>"><i class="fas fa-phone"></i></div> <?=(!empty($staff['mobileno']) ? $staff['mobileno'] : 'N/A'); ?></li>
					<li><div class="icon-holder" data-toggle="tooltip" data-original-title="<?=translate('email')?>"><i class="far fa-envelope"></i></div> <?=$staff['email']?></li>
					<li><div class="icon-holder" data-toggle="tooltip" data-original-title="<?=translate('present_address')?>"><i class="fas fa-home"></i></div> <?=(!empty($staff['present_address']) ? $staff['present_address'] : 'N/A'); ?></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="col-md-12">
		<div class="panel-group" id="accordion">
			<div class="panel panel-accordion">
				<div class="panel-heading">
					<h4 class="panel-title">
                        <div class="auth-pan">
                            <button class="btn btn-default btn-circle" id="authentication_btn">
                                <i class="fas fa-unlock-alt"></i> <?=translate('authentication')?>
                            </button>
                        </div>
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#profile">
							<i class="fas fa-user-edit"></i> <?=translate('basic_details')?>
						</a>
					</h4>
				</div>
				<div id="profile" class="accordion-body collapse <?=($this->session->flashdata('profile_tab') ? 'in' : ''); ?>">
					<?php echo form_open_multipart($this->uri->uri_string()); ?>
						<div class="panel-body">
							<fieldset>
								<input type="hidden" name="staff_id" id="staff_id" value="<?php echo $staff['id']; ?>">
								<!-- academic details-->
								<div class="headers-line">
									<i class="fas fa-school"></i> <?=translate('academic_details')?>
								</div>
								<div class="row">
                                <?php if (is_superadmin_loggedin()) { ?>
									<div class="col-md-4 mb-sm">
										<div class="form-group">
											<label class="control-label"><?=translate('branch')?> <span class="required">*</span></label>
											<?php
												$arrayBranch = $this->app_lib->getSelectList('branch');
												echo form_dropdown("branch_id", $arrayBranch, set_value('branch_id', $staff['branch_id']), "class='form-control' id='branch_id'
												data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity'");
											?>
											<span class="error"><?php echo form_error('branch_id'); ?></span>
										</div>
									</div>
                                <?php } ?>
									<div class="col-md-<?=$widget?> mb-sm">
										<div class="form-group">
											<label class="control-label"><?=translate('role')?> <span class="required">*</span></label>
											<?php
												$role_list = $this->app_lib->getRoles();
												echo form_dropdown("user_role", $role_list, set_value('user_role', $staff['role_id']), "class='form-control'
												data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity' ");
											?>
											<span class="error"><?php echo form_error('user_role'); ?></span>
										</div>
									</div>
								</div>
								<!-- employee details -->
								<div class="headers-line mt-md">
									<i class="fas fa-user-check"></i> <?=translate('employee_details')?>
								</div>
								<div class="row">
									<div class="col-md-4 mb-sm">
										<div class="form-group">
											<label class="control-label"><?=translate('staff_id')?> <span class="required">*</span></label>
											<input class="form-control" name="staff_id_no" type="text" value="<?=set_value('staff_id_no', $staff['staff_id'])?>" />
											<span class="error"><?php echo form_error('staff_id_no'); ?></span>
										</div>
									</div>
									<div class="col-md-4 mb-sm">
										<div class="form-group">
											<label class="control-label"><?=translate('name')?> <span class="required">*</span></label>
											<div class="input-group">
												<span class="input-group-addon"><i class="far fa-user"></i></span>
												<input class="form-control" name="name" type="text" value="<?=set_value('name', $staff['name'])?>" />
											</div>
											<span class="error"><?php echo form_error('name'); ?></span>
										</div>
									</div>
									<div class="col-md-4 mb-sm">
										<div class="form-group">
											<label class="control-label"><?=translate('gender')?></label>
											<?php
												$array = array(
													"" => translate('select'),
													"male" => translate('male'),
													"female" => translate('female')
												);
												echo form_dropdown("sex", $array, set_value('sex', $staff['sex']), "class='form-control' data-plugin-selectTwo
												data-width='100%' data-minimum-results-for-search='Infinity'");
											?>
										</div>
									</div>
								</div>
<!---->
									<div class="col-md-4 mb-sm">
										<div class="form-group">
											<label class="control-label"><?=translate('birthday')?> </label>
											<div class="input-group">
												<span class="input-group-addon"><i class="fas fa-birthday-cake"></i></span>
												<input class="form-control" name="birthday" value="<?=set_value('birthday', $staff['birthday'])?>" data-plugin-datepicker data-plugin-options='{ "startView": 2 }' autocomplete="off" type="text">
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-sm">
										<div class="form-group">
											<label class="control-label"><?=translate('mobile_no')?> <span class="required">*</span></label>
											<div class="input-group">
												<span class="input-group-addon"><i class="fas fa-phone-volume"></i></span>
												<input class="form-control" name="mobile_no" type="text" value="<?=set_value('mobile_no', $staff['mobileno'])?>" />
											</div>
											<span class="error"><?php echo form_error('mobile_no'); ?></span>
										</div>
									</div>
									<div class="col-md-6 mb-sm">
										<div class="form-group">
											<label class="control-label"><?=translate('email')?> <span class="required">*</span></label>
											<div class="input-group">
												<span class="input-group-addon"><i class="far fa-envelope-open"></i></span>
												<input type="text" class="form-control" name="email" id="email" value="<?=set_value('email', $staff['email'])?>" />
											</div>
											<span class="error"><?php echo form_error('email'); ?></span>
										</div>
									</div>
								</div>

								<!--custom fields details-->
								<div class="row" id="customFields">
									<?php echo render_custom_Fields('employee', $staff['branch_id'], $staff['id']); ?>
								</div>

								<div class="row mb-md">
									<div class="col-md-12">
										<div class="form-group">
											<label for="input-file-now"><?=translate('profile_picture')?></label>
											<input type="file" name="user_photo" class="dropify" data-default-file="<?=get_image_url('staff', $staff['photo'])?>"/>
											<span class="error"><?php echo form_error('user_photo'); ?></span>
										</div>
									</div>
									<input type="hidden" name="old_user_photo" value="<?=$staff['photo']?>">
								</div>

								<!-- login details -->
								<div class="headers-line">
									<i class="fas fa-user-lock"></i> <?=translate('login_details')?>
								</div>

								<div class="row mb-lg">
									<div class="col-md-12 mb-sm">
										<div class="form-group">
											<label class="control-label"><?=translate('username')?> <span class="required">*</span></label>
											<div class="input-group">
												<span class="input-group-addon"><i class="far fa-user"></i></span>
												<input type="text" class="form-control" name="username" value="<?=set_value('username', $staff['username'])?>" />
											</div>
											<span class="error"><?php echo form_error('username'); ?></span>
										</div>
									</div>
								</div>
							</fieldset>
						</div>
						<div class="panel-footer">
							<div class="row">
								<div class="col-md-offset-9 col-md-3">
									<button type="submit" name="submit" value="update" class="btn btn-default btn-block"><?=translate('update')?></button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			</div>
			</div>
		</div>
	</div>
</div>

<!-- login authentication and account inactive modal -->
<div id="authentication_modal" class="zoom-anim-dialog modal-block modal-block-primary mfp-hide">
	<section class="panel">
		<header class="panel-heading">
			<h4 class="panel-title">
				<i class="fas fa-unlock-alt"></i> <?=translate('authentication')?>
			</h4>
		</header>
		<?php echo form_open('employee/change_password', array('class' => 'frm-submit')); ?>
        <div class="panel-body">
        	<input type="hidden" name="staff_id" value="<?=$staff['id']?>">
            <div class="form-group">
	            <label for="password" class="control-label"><?=translate('password')?> <span class="required">*</span></label>
	            <div class="input-group">
	                <input type="password" class="form-control password" name="password" autocomplete="off" />
	                <span class="input-group-addon">
	                    <a href="javascript:void(0);" id="showPassword" ><i class="fas fa-eye"></i></a>
	                </span>
	            </div>
	            <span class="error"></span>
                <div class="checkbox-replace mt-lg">
                    <label class="i-checks">
                        <input type="checkbox" name="authentication" id="cb_authentication">
                        <i></i> <?=translate('login_authentication_deactivate')?>
                    </label>
                </div>
            </div>
        </div>
        <footer class="panel-footer">
            <div class="text-right">
                <button type="submit" class="btn btn-default mr-xs" data-loading-text="<i class='fas fa-spinner fa-spin'></i> Processing"><?=translate('update')?></button>
                <button class="btn btn-default modal-dismiss"><?=translate('close')?></button>
            </div>
        </footer>
        <?php echo form_close(); ?>
	</section>
</div>

<script type="text/javascript">
	var authenStatus = "<?=$staff['active']?>";
</script>
