<#import "parts/common.ftl" as c>
<@c.page>
  <form action="/user/registration" method="post">

      <div class="container">

          <div class="row justify-content-center">

              <div class="col-md-6">
                  <#if message??>
    <div class="alert alert-danger" role="alert">
        ${message}
    </div>
                  </#if>


                  <div class="card">

                      <article class="card-body">
                          <form>
                              <div class="form-group">
                                  <label>Login </label>
                                  <input class="form-control" type="text" name="username" required>
                              </div>
                              <div class="form-group">
                                  <label>Password </label>
                                  <input class="form-control" type="password" name="password" required>
                              </div>
                              <div class="form-group">
                                  <label>Full-name </label>
                                  <input class="form-control" type="text" name="fullname" required>
                              </div>
                              <div class="form-group">
                                  <label>Birth date </label>
                                  <input class="form-control" type="date" name="birthd" required>
                              </div>
                              <div class="form-group">
                                  <label>Preferences </label>
                                  <input class="form-control" type="text" name="preferences">
                              </div>
                              <div class="form-group">
                                  <label>Level </label>
                                  <SELECT name="level" size="1" class="form-control">
                                      <OPTION value="1">Elementary</OPTION>
                                      <OPTION value="2">Pre-Intermediate</OPTION>
                                      <OPTION value="3">Intermediate</OPTION>
                                      <OPTION value="4">Upper-Intermediate</OPTION>
                                      <OPTION value="5">Advanced</OPTION>
                                      <OPTION value="6">Proficiency</OPTION>
                                  </SELECT>
                              </div>

                              <div class="form-group">

                                      <#list roles as role>
                                          <label class="form-check form-check-inline">
                                              <input class="form-check-input" type="radio" name="roles" value="${role}" required>
                                              <span class="form-check-label"> ${role} </span>
                                          </label>
                                      </#list>

                              </div>

                              <div class="form-group">
                                  <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                  <button type="submit" class="btn btn-primary btn-block"> Add new user  </button>
                              </div>

                          </form>
                      </article>

                  </div>
              </div>

          </div>

      </div>

  </form>

</@c.page>
