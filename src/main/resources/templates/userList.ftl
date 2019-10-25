<#import "parts/common.ftl" as c>


<@c.page>
    <#if userEdit??>
  <div class="collapse show" id="collapseExample">
      <div class="form-group mt-3">
          <form action="/user" method="post">
              <div class="container">
                  <div class="row m-y-2">

                      <div class="col-lg-8 push-lg-4 personal-info">
                          <form role="form">
                              <div class="form-group row">
                                  <label class="col-lg-3 col-form-label form-control-label">Login</label>
                                  <div class="col-lg-9">
                                      <input type = "text" name="username" class="form-control" value="${user.username}">
                                  </div>
                              </div>
                              <div class="form-group row">
                                  <label class="col-lg-3 col-form-label form-control-label">Active</label>
                                  <div class="col-lg-9">
                                      <input type="checkbox" name="active" ${user.active?string("checked","")}>
                                  </div>
                              </div>

                              <div class="form-group row">
                                  <label class="col-lg-3 col-form-label form-control-label">Role</label>
                                  <div class="col-lg-9">
                              <#list roles as role>

                                  <label><input type="radio" name="newrole" value="${role}" ${user.roles?seq_contains(role)?string("checked", "")}> ${role}</label>

                              </#list>

                                  </div>
                              </div>
                              <input type="hidden" value="${user.id}" name="userID">
                              <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                              <div class="form-group row">
                                  <label class="col-lg-3 col-form-label form-control-label"></label>
                                  <div class="col-lg-9">
                                      <input type="reset" class="btn btn-secondary" value="Cancel" />
                                      <input type="submit" class="btn btn-primary" value="Save Changes" />
                                  </div>
                              </div>
                          </form>
                      </div>
                  </div>
              </div>

          </form>
      </div>
  </div>
    </#if>

<table class="table table-hover">
    <thead>
    <tr>
        <th>Login</th>
        <th>Role</th>
        <th>Active</th>
        <th></th>
        <th></th>

    </tr>
    </thead>
    <tbody>
<#list users as user>
<#if user.active><tr><#else><tr class="table-danger"></#if>

    <td>${user.username}</td>
    <td><#list user.roles as role>${role}<#sep>, </#list></td>
    <td>${user.active?string('yes','no')}</td>
    <td><a class="btn btn-default" href="/user/${user.id}"><span class="fas fa-cog" aria-hidden="true"></span></a></td>
    <td><a class="btn btn-default" href="/user/delete/${user.id}"><span class="fas fa-trash"></span></a>


    </td>

</tr>

</#list>
    </tbody>
</table>
</@c.page>