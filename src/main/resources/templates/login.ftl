<#import "parts/commonNew.ftl" as c>

<@c.page>
 <body>
 <div class="limiter">

     <div class="container-login100">
         <div class="row">
             <div class="col">
 <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
    <div class="alert alert-danger" role="alert">
        ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
    </div>
 </#if>


                 <div class="wrap-login100">

                     <div class="login100-pic js-tilt" data-tilt>
                         <img src="/static/img-01.png" alt="IMG">
                     </div>

                     <form class="login100-form validate-form" method="post">
					<span class="login100-form-title">
						Member Login
					</span>

                         <div class="wrap-input100">
                             <input class="input100" type="text" name="username" placeholder="Login" required>
                             <span class="focus-input100"></span>
                             <span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
                         </div>

                         <div class="wrap-input100">
                             <input class="input100" type="password" name="password" placeholder="Password" required>
                             <span class="focus-input100"></span>
                             <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
                         </div>
                         <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                         <div class="container-login100-form-btn">
                             <button class="login100-form-btn" type="submit">
                                 Login
                             </button>

                         </div>


                         <div class="text-center p-t-136">
                             <a class="txt2" href="/registration">
                                 Create your Account
                                 <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                             </a>
                         </div>

                     </form>


                 </div>


             </div>

         </div>
     </div>
 </div>
 <script >
     $('.js-tilt').tilt({
         scale: 1.1
     })
 </script>

 </body>
</@c.page>