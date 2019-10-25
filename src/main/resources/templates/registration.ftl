<#import "parts/commonNew.ftl" as c>

<@c.page>
<body xmlns="http://www.w3.org/1999/html">
<div class="limiter">
    <form action="registration" method="post">
        <div class="container-login100">
            <div class="row">
                <div class="col">
                  <#if message??>
    <div class="alert alert-danger" role="alert">
        ${message}
    </div>
                  </#if>
                    <div class="wrap-login100">

             <span class="login100-form-title">
				Registration
					</span>


                        <div class="wrap-input100">
                            <input class="input100" type="text" name="username" placeholder="Login" required>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
							<i class="fa fa-mask" aria-hidden="true"></i>
						</span>
                        </div>

                        <div class="wrap-input100">
                            <input class="input100" type="password" name="password" placeholder="Password" required>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
                        </div>

                        <div class="wrap-input100">
                            <input class="input100" type="text" name="fullname" placeholder="Full-name" required>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
                        </div>

                        <div class="wrap-input100">
                            <input class="input100" type="date" name="birthd" placeholder="birthd" required>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
							<i class="fa fa-birthday-cake" aria-hidden="true"></i>
						</span>
                        </div>


                        <div class="wrap-input100">
                            <input class="input100" type="text" name="preferences" placeholder="Preferences">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
							<i class="fa fa-chalkboard-teacher" aria-hidden="true"></i>
						</span>
                        </div>


                        <div class="wrap-input100">

                            <SELECT name="level" size="1" class="input100">
                                <OPTION value="1">Elementary</OPTION>
                                <OPTION value="2">Pre-Intermediate</OPTION>
                                <OPTION value="3">Intermediate</OPTION>
                                <OPTION value="4">Upper-Intermediate</OPTION>
                                <OPTION value="5">Advanced</OPTION>
                                <OPTION value="6">Proficiency</OPTION>
                            </SELECT>

                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
							<i class="fa fa-trophy" aria-hidden="true"></i>
						</span>
                        </div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" type="submit">
                                Register
                            </button>
                        </div>

                        <span class="login100-form-title mt-3">
             <small class="text-muted">By clicking the 'Register' button, you confirm that you accept our <br> Terms of use and Privacy Policy.</small>
             </span>

                    </div>

                </div>
            </div>
        </div>
    </form>
</div>
</div>
</body>

</@c.page>
