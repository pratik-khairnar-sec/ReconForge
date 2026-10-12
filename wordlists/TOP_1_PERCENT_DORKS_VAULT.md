# ReconForge Top 1% Elite Dork Vault (1674+ Dorks)

Curated, battle-tested, high-impact Google Dorks for finding **P1/P2 vulnerabilities**, exposed cloud storage, credentials, internal debuggers, and independent bug bounty programs.

> **Note:** Replace `target.com` with your in-scope target domain.

## 1. Cloud Storage, Buckets & Public Asset Leaks

```text
site:s3.amazonaws.com inurl:target.com
site:s3.amazonaws.com "target.com"
site:storage.googleapis.com inurl:target.com
site:storage.googleapis.com "target.com"
site:*.blob.core.windows.net "target.com"
site:firebaseio.com "target.com"
site:digitaloceanspaces.com "target.com"
site:*.r2.cloudflarestorage.com "target.com"
site:s3.amazonaws.com ext:xls OR ext:xlsx "target.com"
site:s3.amazonaws.com ext:pdf "confidential" OR "internal"
site:s3.amazonaws.com ext:sql OR ext:bak "target.com"
site:s3.amazonaws.com ext:env OR ext:yml "target.com"
site:s3.amazonaws.com ext:csv "password" OR "email"
site:storage.googleapis.com ext:sql OR ext:dump
site:storage.googleapis.com ext:pem OR ext:key
site:*.blob.core.windows.net ext:bak OR ext:bacpac
site:*.blob.core.windows.net ext:json "apiKey" OR "client_secret"
"target.com" intext:"index of" "s3.amazonaws.com"
site:firebaseio.com inurl:.json -site:firebaseio.com/auth
site:*.firebaseapp.com "__/firebase/init.json"
inurl:"s3.amazonaws.com/target-"
inurl:"target-prod.s3.amazonaws.com"
inurl:"target-dev.s3.amazonaws.com"
inurl:"target-backup.s3.amazonaws.com"
inurl:"target-assets.s3.amazonaws.com"
inurl:"target-data.s3.amazonaws.com"
inurl:"target-media.s3.amazonaws.com"
inurl:"target-internal.s3.amazonaws.com"
inurl:"target-private.s3.amazonaws.com"
inurl:"target-stage.s3.amazonaws.com"
site:s3.amazonaws.com "aws_access_key_id" target.com
site:s3.amazonaws.com "AWS_SECRET_ACCESS_KEY" target.com
site:s3.amazonaws.com "client_secret" target.com
site:s3.amazonaws.com "id_rsa" target.com
site:s3.amazonaws.com "BEGIN RSA PRIVATE KEY"
site:s3.amazonaws.com ext:log "password" target.com
site:s3.amazonaws.com ext:xml "db_password" target.com
site:s3.amazonaws.com ext:tar.gz OR ext:zip "backup"
site:storage.googleapis.com "client_email" "private_key"
site:storage.googleapis.com ext:p12 OR ext:pfx
site:storage.googleapis.com "access_token" target.com
site:*.blob.core.windows.net "DefaultEndpointsProtocol=https"
site:*.blob.core.windows.net "AccountKey="
site:s3.amazonaws.com ext:conf OR ext:cfg "target"
site:s3.amazonaws.com ext:properties "db.password"
site:s3.amazonaws.com "database.yml" target.com
site:s3.amazonaws.com "settings.py" target.com
site:s3.amazonaws.com "wp-config.php" target.com
site:s3.amazonaws.com "credentials.ini"
site:s3.amazonaws.com "connectionString="
site:s3.amazonaws.com ext:txt "admin:password"
site:s3.amazonaws.com inurl:export OR inurl:dump
site:storage.googleapis.com inurl:backup OR inurl:db
site:*.blob.core.windows.net inurl:exports OR inurl:data
site:s3.amazonaws.com intext:"SecretKey="
site:s3.amazonaws.com intext:"api_secret="
site:s3.amazonaws.com "token=" "target.com"
site:s3.amazonaws.com "oauth_token=" target.com
site:s3.amazonaws.com inurl:invoices OR inurl:receipts
site:s3.amazonaws.com inurl:passports OR inurl:license
site:storage.googleapis.com inurl:reports OR inurl:audit
site:*.blob.core.windows.net inurl:finance OR inurl:payroll
site:s3.amazonaws.com ext:tsv "ssn" OR "salary"
site:s3.amazonaws.com ext:csv "credit_card" OR "cvv"
site:s3.amazonaws.com "authorization: Bearer"
```

## 2. Sensitive Environment & Configuration Files

```text
site:target.com ext:env OR ext:env.bak OR ext:env.prod
site:target.com inurl:/.env OR inurl:/.env.local
site:target.com inurl:/.env.production OR inurl:/.env.staging
site:target.com inurl:/.env.sample OR inurl:/.env.example
site:target.com inurl:/.env.backup OR inurl:/.env.old
site:target.com inurl:/.git/config
site:target.com inurl:/.git/HEAD
site:target.com inurl:/.git/index
site:target.com inurl:/.gitignore
site:target.com inurl:/.svn/entries
site:target.com inurl:/.svn/wc.db
site:target.com inurl:/.bzr/README
site:target.com inurl:/.hg/dirstate
site:target.com inurl:/docker-compose.yml
site:target.com inurl:/docker-compose.yaml
site:target.com inurl:/Dockerfile
site:target.com inurl:/.docker/config.json
site:target.com inurl:/k8s/ OR inurl:/kubernetes/
site:target.com inurl:/helm/values.yaml
site:target.com inurl:/terraform.tfstate
site:target.com inurl:/terraform.tfvars
site:target.com inurl:/.terraform/
site:target.com inurl:/id_rsa OR inurl:/id_dsa
site:target.com inurl:/id_ed25519
site:target.com inurl:/authorized_keys
site:target.com inurl:/known_hosts
site:target.com inurl:/.ssh/
site:target.com inurl:/wp-config.php.bak
site:target.com inurl:/wp-config.php.old
site:target.com inurl:/wp-config.php.save
site:target.com inurl:/wp-config.php.swp
site:target.com inurl:/wp-config.php.txt
site:target.com inurl:/wp-config.php~
site:target.com inurl:/configuration.php.bak
site:target.com inurl:/config.inc.php.bak
site:target.com inurl:/config.php.bak
site:target.com inurl:/database.yml
site:target.com inurl:/database.php
site:target.com inurl:/settings.py
site:target.com inurl:/local_settings.py
site:target.com inurl:/web.config.bak
site:target.com inurl:/appsettings.json
site:target.com inurl:/appsettings.Development.json
site:target.com inurl:/appsettings.Production.json
site:target.com inurl:/secrets.json
site:target.com inurl:/credentials.json
site:target.com inurl:/service-account.json
site:target.com inurl:/firebase.json
site:target.com inurl:/client_secret.json
site:target.com inurl:/parameters.yml
site:target.com inurl:/parameters.yml.dist
site:target.com inurl:/config/default.json
site:target.com inurl:/config/production.json
site:target.com inurl:/package.json intext:"dependencies"
site:target.com inurl:/composer.json intext:"require"
site:target.com inurl:/Pipfile OR inurl:/Pipfile.lock
site:target.com inurl:/requirements.txt
site:target.com inurl:/Gemfile OR inurl:/Gemfile.lock
site:target.com inurl:/pom.xml
site:target.com inurl:/build.gradle
site:target.com inurl:/.npmrc intext:"_authToken"
site:target.com inurl:/.pypirc
site:target.com inurl:/.aws/credentials
site:target.com inurl:/.aws/config
site:target.com inurl:/.gcloud/
site:target.com inurl:/.kube/config
site:target.com inurl:/htpasswd OR inurl:/.htpasswd
site:target.com inurl:/.htaccess.bak
site:target.com inurl:/nginx.conf.bak
site:target.com inurl:/httpd.conf.bak
site:target.com inurl:/server.xml.bak
```

## 3. Database Dumps, Backups & Log Exposures

```text
site:target.com ext:sql OR ext:dump OR ext:mysqldump
site:target.com inurl:dump.sql OR inurl:backup.sql
site:target.com inurl:data.sql OR inurl:db.sql
site:target.com inurl:users.sql OR inurl:accounts.sql
site:target.com inurl:database.sql OR inurl:prod.sql
site:target.com inurl:staging.sql OR inurl:test.sql
site:target.com inurl:schema.sql
site:target.com ext:sqlite OR ext:sqlite3 OR ext:db
site:target.com ext:mdb OR ext:accdb
site:target.com ext:bak OR ext:bacpac
site:target.com ext:tar.gz OR ext:tgz inurl:backup
site:target.com ext:zip inurl:backup OR inurl:dump
site:target.com ext:7z OR ext:rar inurl:backup
site:target.com ext:log inurl:error OR inurl:access
site:target.com ext:log inurl:debug OR inurl:audit
site:target.com ext:log inurl:laravel OR inurl:django
site:target.com ext:log inurl:production OR inurl:development
site:target.com inurl:catalina.out
site:target.com inurl:system.log OR inurl:exception.log
site:target.com ext:log "password" OR "passwd"
site:target.com ext:log "authorization: Basic"
site:target.com ext:log "token" OR "api_key"
site:target.com ext:log "connection error"
site:target.com inurl:/storage/logs/laravel.log
site:target.com inurl:/app/logs/prod.log
site:target.com inurl:/var/log/
site:target.com inurl:/logs/error.log
site:target.com inurl:phpinfo.php
site:target.com inurl:info.php "PHP Version"
site:target.com inurl:pi.php "PHP Version"
site:target.com inurl:test.php "PHP Version"
site:target.com inurl:check.php "PHP Version"
site:target.com inurl:version.php
site:target.com inurl:elmah.axd
site:target.com inurl:trace.axd
site:target.com inurl:glimpse.axd
site:target.com inurl:phpmyadmin inurl:export.php
site:target.com inurl:adminer.php
site:target.com inurl:dbadmin.php
site:target.com inurl:myadmin.php
site:target.com inurl:pma.php
site:target.com inurl:sqlmanager.php
site:target.com inurl:chive/
site:target.com inurl:mongo-express
site:target.com inurl:redis-commander
site:target.com inurl:pgadmin
```

## 4. Spring Boot Actuators, Java & Middleware Debuggers

```text
site:target.com inurl:/actuator
site:target.com inurl:/actuator/env
site:target.com inurl:/actuator/heapdump
site:target.com inurl:/actuator/mappings
site:target.com inurl:/actuator/beans
site:target.com inurl:/actuator/configprops
site:target.com inurl:/actuator/health
site:target.com inurl:/actuator/info
site:target.com inurl:/actuator/metrics
site:target.com inurl:/actuator/trace
site:target.com inurl:/actuator/httptrace
site:target.com inurl:/actuator/threaddump
site:target.com inurl:/actuator/loggers
site:target.com inurl:/actuator/auditevents
site:target.com inurl:/actuator/scheduledtasks
site:target.com inurl:/actuator/gateway/routes
site:target.com inurl:/actuator/flyway
site:target.com inurl:/actuator/liquibase
site:target.com inurl:/env intext:"spring.datasource.password"
site:target.com inurl:/heapdump
site:target.com inurl:/jolokia
site:target.com inurl:/jolokia/list
site:target.com inurl:/jolokia/read
site:target.com inurl:/druid/index.html
site:target.com inurl:/druid/login.html
site:target.com inurl:/druid/sql.html
site:target.com inurl:/druid/weburi.html
site:target.com inurl:/hystrix
site:target.com inurl:/turbine.stream
site:target.com inurl:/eureka/apps
site:target.com inurl:/eureka/status
site:target.com inurl:/consul/ui/
site:target.com inurl:/v1/agent/members
site:target.com inurl:/v1/catalog/services
site:target.com inurl:/v1/kv/
site:target.com inurl:/manager/html (Tomcat)
site:target.com inurl:/host-manager/html
site:target.com inurl:/jmx-console
site:target.com inurl:/web-console/ServerInfo.jsp
site:target.com inurl:/invoker/JMXInvokerServlet
site:target.com inurl:/axis2/axis2-admin/
site:target.com inurl:/axis2-web/
site:target.com inurl:/solr/#/
site:target.com inurl:/solr/admin/
site:target.com inurl:8983/solr
```

## 5. API Gateways, Swagger UI & GraphQL Consoles

```text
site:target.com inurl:/swagger-ui.html
site:target.com inurl:/swagger-ui/index.html
site:target.com inurl:/swagger/index.html
site:target.com inurl:/swagger/v1/swagger.json
site:target.com inurl:/swagger/v2/swagger.json
site:target.com inurl:/v1/swagger.json
site:target.com inurl:/v2/swagger.json
site:target.com inurl:/v3/swagger.json
site:target.com inurl:/api-docs
site:target.com inurl:/v1/api-docs
site:target.com inurl:/v2/api-docs
site:target.com inurl:/v3/api-docs
site:target.com inurl:/openapi.json
site:target.com inurl:/openapi.yaml
site:target.com inurl:/openapi.yml
site:target.com inurl:/api/v1/docs
site:target.com inurl:/api/v2/docs
site:target.com inurl:/api/v3/docs
site:target.com inurl:/apidocs
site:target.com inurl:/doc/api
site:target.com inurl:/redoc
site:target.com inurl:/rapidoc
site:target.com inurl:/graphql
site:target.com inurl:/graphiql
site:target.com inurl:/graphql/console
site:target.com inurl:/graphql-explorer
site:target.com inurl:/altair
site:target.com inurl:/playground (GraphQL)
site:target.com inurl:/v1/graphql
site:target.com inurl:/v2/graphql
site:target.com inurl:/postman.json
site:target.com inurl:/postman_collection.json
site:target.com ext:json inurl:postman
site:target.com inurl:/api/v1/users
site:target.com inurl:/api/v1/auth
site:target.com inurl:/api/v1/accounts
site:target.com inurl:/api/v1/payments
site:target.com inurl:/api/v1/orders
site:target.com inurl:/api/v1/invoices
site:target.com inurl:/api/v1/customers
site:target.com inurl:/api/v1/internal
site:target.com inurl:/api/v1/admin
site:target.com inurl:/api/v1/private
site:target.com inurl:/api/v1/test
site:target.com inurl:/api/v1/debug
site:target.com inurl:/api/v1/export
site:target.com inurl:/api/v1/download
site:target.com inurl:/api/v1/upload
site:target.com inurl:/api/v1/token
site:target.com inurl:/api/v1/session
site:target.com inurl:/api/v1/reset-password
```

## 6. Admin Portals, Control Panels & Dashboards

```text
site:target.com inurl:/admin/login
site:target.com inurl:/admin/dashboard
site:target.com inurl:/admin/home
site:target.com inurl:/administrator/index.php
site:target.com inurl:/adminpanel
site:target.com inurl:/controlpanel
site:target.com inurl:/cpanel
site:target.com inurl:/whm
site:target.com inurl:/webadmin
site:target.com inurl:/manage/
site:target.com inurl:/manager/
site:target.com inurl:/moderator/
site:target.com inurl:/superuser/
site:target.com inurl:/root/
site:target.com inurl:/portal/login
site:target.com inurl:/dashboard/login
site:target.com inurl:/auth/login
site:target.com inurl:/sso/login
site:target.com inurl:/oauth/login
site:target.com inurl:/staff/login
site:target.com inurl:/employee/login
site:target.com inurl:/internal/login
site:target.com inurl:/intranet/login
site:target.com inurl:/backend/login
site:target.com inurl:/ops/login
site:target.com inurl:/backoffice/login
site:target.com inurl:/support/login
site:target.com inurl:/partner/login
site:target.com inurl:/vendor/login
site:target.com inurl:/reseller/login
site:target.com inurl:/client/login
site:target.com inurl:/member/login
site:target.com inurl:/secure/login
site:target.com inurl:/signin
site:target.com inurl:/sign-in
site:target.com inurl:/login.php
site:target.com inurl:/login.aspx
site:target.com inurl:/login.jsp
site:target.com inurl:/login.do
site:target.com inurl:/login.action
site:target.com inurl:/login.html
site:target.com inurl:/login.json
```

## 7. DevOps, CI/CD, Monitoring & Infrastructure Dashboards

```text
site:target.com inurl:3000/login (Grafana)
site:target.com inurl:/grafana/login
site:target.com inurl:5601/app/kibana
site:target.com inurl:/kibana/app
site:target.com inurl:9090/graph (Prometheus)
site:target.com inurl:/prometheus/graph
site:target.com inurl:9093/#/alerts (Alertmanager)
site:target.com inurl:8080/job/ (Jenkins)
site:target.com inurl:/jenkins/login
site:target.com inurl:/jenkins/script
site:target.com inurl:9000/dashboard (SonarQube)
site:target.com inurl:/sonar/dashboard
site:target.com inurl:8081/#browse/welcome (Nexus)
site:target.com inurl:/nexus/#browse
site:target.com inurl:8082/artifactory
site:target.com inurl:/artifactory/webapp
site:target.com inurl:15672/#/ (RabbitMQ)
site:target.com inurl:/rabbitmq/
site:target.com inurl:9200/_cat/indices (Elasticsearch)
site:target.com inurl:9200/_nodes
site:target.com inurl:9200/_cluster/health
site:target.com inurl:8080/#/home (Airflow)
site:target.com inurl:/airflow/admin/
site:target.com inurl:9000/home (Portainer)
site:target.com inurl:/portainer/#/
site:target.com inurl:/api/v1/namespaces (Kubernetes)
site:target.com inurl:/k8s-dashboard
site:target.com inurl:/argocd/login
site:target.com inurl:8080/applications (ArgoCD)
site:target.com inurl:/gitlab/explore
site:target.com inurl:/gitlab/users/sign_in
site:target.com inurl:/gitea/explore
site:target.com inurl:/bitbucket/login
```

## 8. Enterprise CMS, AEM & Salesforce Target Dorks

```text
site:target.com inurl:/bin/querybuilder.json (AEM)
site:target.com inurl:/bin/querybuilder.feed.json
site:target.com inurl:.query.json (AEM)
site:target.com inurl:/system/console (AEM Web Console)
site:target.com inurl:/system/console/configMgr
site:target.com inurl:/system/console/bundles
site:target.com inurl:/system/console/depfinder
site:target.com inurl:/system/console/jmx
site:target.com inurl:/system/console/status-productinfo
site:target.com inurl:/crx/de/index.jsp (CRXDE Lite)
site:target.com inurl:/crx/explorer/index.jsp
site:target.com inurl:/crx/packmgr/index.jsp
site:target.com inurl:/libs/granite/core/content/login.html
site:target.com inurl:/bin/receive.servlet
site:target.com inurl:/content/dam.json
site:target.com inurl:/jcr:content.json
site:target.com inurl:/jcr:content.tidy.json
site:target.com inurl:.infinity.json
site:target.com inurl:.1.json OR inurl:.2.json
site:target.com inurl:/etc/designs.json
site:target.com inurl:/etc/clientlibs.json
site:target.com "wcmmode=disabled"
site:target.com inurl:/s/sfsites/aura (Salesforce)
site:target.com inurl:/sfsites/c/
site:target.com inurl:/s/sfsites/l/
site:target.com inurl:/s/sfsites/record/
site:target.com inurl:/s/sfsites/case/
site:target.com inurl:/s/sfsites/contact/
site:target.com inurl:/s/sfsites/account/
site:target.com inurl:/s/sfsites/user/
site:target.com inurl:/s/sfsites/attachment/
site:target.com inurl:/s/sfsites/contentdocument/
site:target.com inurl:/s/login/
site:target.com inurl:/s/register
site:target.com inurl:/s/forgotpassword
site:target.com inurl:/s/profile/
site:target.com inurl:/s/detail/
```

## 9. Remote Access, VPN & Network Gateways

```text
site:target.com inurl:/remote/login (Fortinet VPN)
site:target.com inurl:/remote/fgt_lang
site:target.com inurl:/+CSCOE+/logon.html (Cisco AnyConnect)
site:target.com inurl:/+CSCOCA+/logon.html
site:target.com inurl:/dana-na/auth/url_default/welcome.cgi (Pulse Secure)
site:target.com inurl:/dana-na/auth/url_admin/welcome.cgi
site:target.com inurl:/global-protect/login.esp (Palo Alto)
site:target.com inurl:/global-protect/portal/fallback.esp
site:target.com inurl:/vpn/index.html (Citrix Gateway)
site:target.com inurl:/vpn/tmindex.html
site:target.com inurl:/logon/LogonPoint/tmindex.html
site:target.com inurl:/sslvpn/login.html
site:target.com inurl:/webvpn.html
site:target.com inurl:/cgi-bin/welcome
site:target.com inurl:/auth/login (SonicWall)
site:target.com inurl:/cgi-bin/luci (OpenWrt)
site:target.com inurl:/manage/account/login (UniFi)
site:target.com inurl:/ui/login (VMware Horizon)
site:target.com inurl:/websso/ (F5 BIG-IP)
site:target.com inurl:/tmui/login.jsp (F5 BIG-IP)
site:target.com inurl:/my.policy (F5 APM)
site:target.com inurl:/Citrix/StoreWeb/
site:target.com inurl:/RDWeb/Pages/en-US/login.aspx
```

## 10. High-Yield Parameter Dorks (SQLi, IDOR, SSRF, LFI, Redirect)

```text
site:target.com inurl:?id=
site:target.com inurl:?user_id=
site:target.com inurl:?account_id=
site:target.com inurl:?customer_id=
site:target.com inurl:?profile_id=
site:target.com inurl:?order_id=
site:target.com inurl:?invoice_id=
site:target.com inurl:?bill_id=
site:target.com inurl:?transaction_id=
site:target.com inurl:?payment_id=
site:target.com inurl:?sub_id=
site:target.com inurl:?item_id=
site:target.com inurl:?cat_id=
site:target.com inurl:?category_id=
site:target.com inurl:?product_id=
site:target.com inurl:?service_id=
site:target.com inurl:?msg_id=
site:target.com inurl:?message_id=
site:target.com inurl:?doc_id=
site:target.com inurl:?document_id=
site:target.com inurl:?file_id=
site:target.com inurl:?attachment_id=
site:target.com inurl:?report_id=
site:target.com inurl:?ticket_id=
site:target.com inurl:?case_id=
site:target.com inurl:?contract_id=
site:target.com inurl:?project_id=
site:target.com inurl:?task_id=
site:target.com inurl:?lead_id=
site:target.com inurl:?group_id=
site:target.com inurl:?team_id=
site:target.com inurl:?org_id=
site:target.com inurl:?company_id=
site:target.com inurl:?role_id=
site:target.com inurl:?permission_id=
site:target.com inurl:?session_id=
site:target.com inurl:?token=
site:target.com inurl:?auth_token=
site:target.com inurl:?access_token=
site:target.com inurl:?api_key=
site:target.com inurl:?key=
site:target.com inurl:?secret=
site:target.com inurl:?redirect=
site:target.com inurl:?redirect_uri=
site:target.com inurl:?redirect_url=
site:target.com inurl:?return=
site:target.com inurl:?return_url=
site:target.com inurl:?next=
site:target.com inurl:?goto=
site:target.com inurl:?target=
site:target.com inurl:?dest=
site:target.com inurl:?destination=
site:target.com inurl:?forward=
site:target.com inurl:?forward_url=
site:target.com inurl:?callback=
site:target.com inurl:?callback_url=
site:target.com inurl:?success_url=
site:target.com inurl:?failure_url=
site:target.com inurl:?error_url=
site:target.com inurl:?cancel_url=
site:target.com inurl:?continue=
site:target.com inurl:?url=
site:target.com inurl:?uri=
site:target.com inurl:?link=
site:target.com inurl:?src=
site:target.com inurl:?source=
site:target.com inurl:?feed=
site:target.com inurl:?host=
site:target.com inurl:?domain=
site:target.com inurl:?proxy=
site:target.com inurl:?file=
site:target.com inurl:?file_name=
site:target.com inurl:?filename=
site:target.com inurl:?path=
site:target.com inurl:?filepath=
site:target.com inurl:?folder=
site:target.com inurl:?dir=
site:target.com inurl:?directory=
site:target.com inurl:?doc=
site:target.com inurl:?document=
site:target.com inurl:?page=
site:target.com inurl:?include=
site:target.com inurl:?require=
site:target.com inurl:?template=
site:target.com inurl:?theme=
site:target.com inurl:?layout=
site:target.com inurl:?view=
site:target.com inurl:?load=
site:target.com inurl:?action=
site:target.com inurl:?download=
site:target.com inurl:?export=
site:target.com inurl:?import=
site:target.com inurl:?upload=
site:target.com inurl:?read=
site:target.com inurl:?write=
site:target.com inurl:?cmd=
site:target.com inurl:?exec=
site:target.com inurl:?command=
site:target.com inurl:?query=
site:target.com inurl:?search=
site:target.com inurl:?q=
site:target.com inurl:?s=
site:target.com inurl:?keyword=
site:target.com inurl:?filter=
site:target.com inurl:?sort=
site:target.com inurl:?order=
site:target.com inurl:?by=
```

## 11. Systematic Subdomain & Staging Environment Discovery

```text
site:target.com inurl:staging
site:target.com inurl:dev
site:target.com inurl:test
site:target.com inurl:qa
site:target.com inurl:uat
site:target.com inurl:demo
site:target.com inurl:sandbox
site:target.com inurl:internal
site:target.com inurl:corp
site:target.com inurl:preview
site:target.com inurl:beta
site:target.com inurl:alpha
site:target.com inurl:canary
site:target.com inurl:preprod
site:target.com inurl:intranet
site:target.com inurl:auth
site:target.com inurl:sso
site:target.com inurl:login
site:target.com inurl:portal
site:target.com inurl:api
site:target.com inurl:gateway
site:target.com inurl:service
site:target.com inurl:microservice
site:target.com inurl:backend
site:target.com inurl:core
site:target.com inurl:infra
site:target.com inurl:admin
site:target.com inurl:manage
site:target.com inurl:dashboard
site:target.com inurl:control
site:target.com inurl:secure
site:target.com inurl:vpn
site:target.com inurl:remote
site:target.com inurl:mail
site:target.com inurl:webmail
site:target.com inurl:mx
site:target.com inurl:smtp
site:target.com inurl:pop
site:target.com inurl:imap
site:target.com inurl:ftp
site:target.com inurl:sftp
site:target.com inurl:ssh
site:target.com inurl:git
site:target.com inurl:gitlab
site:target.com inurl:github
site:target.com inurl:ci
site:target.com inurl:cd
site:target.com inurl:jenkins
site:target.com inurl:build
site:target.com inurl:sonar
site:target.com inurl:nexus
site:target.com inurl:artifactory
site:target.com inurl:monitor
site:target.com inurl:status
site:target.com inurl:health
site:target.com inurl:metrics
site:target.com inurl:grafana
site:target.com inurl:kibana
site:target.com inurl:elastic
site:target.com inurl:prometheus
site:target.com inurl:alert
site:target.com inurl:log
site:target.com inurl:logs
site:target.com inurl:logging
site:target.com inurl:db
site:target.com inurl:database
site:target.com inurl:sql
site:target.com inurl:mysql
site:target.com inurl:postgres
site:target.com inurl:oracle
site:target.com inurl:mongo
site:target.com inurl:redis
site:target.com inurl:kafka
site:target.com inurl:rabbit
site:target.com inurl:mq
site:target.com inurl:queue
site:target.com inurl:cache
site:target.com inurl:storage
site:target.com inurl:s3
site:target.com inurl:bucket
site:target.com inurl:blob
site:target.com inurl:media
site:target.com inurl:cdn
site:target.com inurl:static
site:target.com inurl:assets
site:target.com inurl:upload
site:target.com inurl:uploads
site:target.com inurl:download
site:target.com inurl:file
site:target.com inurl:files
site:target.com inurl:doc
site:target.com inurl:docs
site:target.com inurl:wiki
site:target.com inurl:confluence
site:target.com inurl:jira
site:target.com inurl:tickets
site:target.com inurl:support
site:target.com inurl:help
site:target.com inurl:desk
site:target.com inurl:crm
site:target.com inurl:erp
site:target.com inurl:hr
site:target.com inurl:payroll
site:target.com inurl:billing
site:target.com inurl:payment
site:target.com inurl:pay
site:target.com inurl:checkout
site:target.com inurl:cart
site:target.com inurl:shop
site:target.com inurl:store
site:target.com inurl:partner
site:target.com inurl:vendor
site:target.com inurl:affiliate
site:target.com inurl:client
site:target.com inurl:customer
site:target.com inurl:user
site:target.com inurl:member
site:target.com inurl:account
site:target.com inurl:profile
site:target.com inurl:id
site:target.com inurl:identity
site:target.com inurl:directory
site:target.com inurl:ldap
site:target.com inurl:ad
site:target.com inurl:adfs
site:target.com inurl:radius
site:target.com inurl:saml
site:target.com inurl:oidc
site:target.com inurl:oauth
site:target.com inurl:token
site:target.com inurl:cert
site:target.com inurl:pki
site:target.com inurl:vault
site:target.com inurl:secret
site:target.com inurl:kms
site:target.com inurl:key
site:target.com inurl:config
site:target.com inurl:setup
site:target.com inurl:install
site:target.com inurl:init
site:target.com inurl:cron
site:target.com inurl:worker
site:target.com inurl:job
site:target.com inurl:task
site:target.com inurl:batch
site:target.com inurl:feed
site:target.com inurl:sync
site:target.com inurl:stream
site:target.com inurl:webhook
site:target.com inurl:event
site:target.com inurl:audit
site:target.com inurl:report
site:target.com inurl:analytics
site:target.com inurl:bi
site:target.com inurl:dw
site:target.com inurl:etl
```

## 12. Sensitive Extensions & Configuration Leakage

```text
site:target.com ext:env
site:target.com ext:yml
site:target.com ext:yaml
site:target.com ext:json
site:target.com ext:xml
site:target.com ext:conf
site:target.com ext:cfg
site:target.com ext:ini
site:target.com ext:properties
site:target.com ext:sql
site:target.com ext:sqlite
site:target.com ext:sqlite3
site:target.com ext:db
site:target.com ext:dump
site:target.com ext:bak
site:target.com ext:backup
site:target.com ext:old
site:target.com ext:save
site:target.com ext:swp
site:target.com ext:tmp
site:target.com ext:temp
site:target.com ext:log
site:target.com ext:out
site:target.com ext:txt
site:target.com ext:csv
site:target.com ext:tsv
site:target.com ext:pdf
site:target.com ext:doc
site:target.com ext:docx
site:target.com ext:xls
site:target.com ext:xlsx
site:target.com ext:key
site:target.com ext:pem
site:target.com ext:crt
site:target.com ext:cer
site:target.com ext:p12
site:target.com ext:pfx
site:target.com ext:der
site:target.com ext:rsa
site:target.com ext:pub
site:target.com ext:ovpn
site:target.com ext:kdbx
site:target.com ext:tar
site:target.com ext:gz
site:target.com ext:tgz
site:target.com ext:zip
site:target.com ext:rar
site:target.com ext:7z
site:target.com ext:war
site:target.com ext:ear
site:target.com ext:jar
site:target.com ext:apk
site:target.com ext:ipa
site:target.com ext:exe
site:target.com ext:bin
site:target.com ext:sh
site:target.com ext:bat
site:target.com ext:ps1
```

## 13. High-Risk Action & IDOR/SQLi Parameter Combinations

```text
site:target.com inurl:/view inurl:?id=
site:target.com inurl:/view.php?id=
site:target.com inurl:/view.jsp?id=
site:target.com inurl:/view.aspx?id=
site:target.com inurl:/view inurl:?user=
site:target.com inurl:/view.php?user=
site:target.com inurl:/view.jsp?user=
site:target.com inurl:/view.aspx?user=
site:target.com inurl:/view inurl:?account=
site:target.com inurl:/view.php?account=
site:target.com inurl:/view.jsp?account=
site:target.com inurl:/view.aspx?account=
site:target.com inurl:/view inurl:?order=
site:target.com inurl:/view.php?order=
site:target.com inurl:/view.jsp?order=
site:target.com inurl:/view.aspx?order=
site:target.com inurl:/view inurl:?doc=
site:target.com inurl:/view.php?doc=
site:target.com inurl:/view.jsp?doc=
site:target.com inurl:/view.aspx?doc=
site:target.com inurl:/view inurl:?file=
site:target.com inurl:/view.php?file=
site:target.com inurl:/view.jsp?file=
site:target.com inurl:/view.aspx?file=
site:target.com inurl:/view inurl:?report=
site:target.com inurl:/view.php?report=
site:target.com inurl:/view.jsp?report=
site:target.com inurl:/view.aspx?report=
site:target.com inurl:/view inurl:?ticket=
site:target.com inurl:/view.php?ticket=
site:target.com inurl:/view.jsp?ticket=
site:target.com inurl:/view.aspx?ticket=
site:target.com inurl:/view inurl:?invoice=
site:target.com inurl:/view.php?invoice=
site:target.com inurl:/view.jsp?invoice=
site:target.com inurl:/view.aspx?invoice=
site:target.com inurl:/view inurl:?profile=
site:target.com inurl:/view.php?profile=
site:target.com inurl:/view.jsp?profile=
site:target.com inurl:/view.aspx?profile=
site:target.com inurl:/edit inurl:?id=
site:target.com inurl:/edit.php?id=
site:target.com inurl:/edit.jsp?id=
site:target.com inurl:/edit.aspx?id=
site:target.com inurl:/edit inurl:?user=
site:target.com inurl:/edit.php?user=
site:target.com inurl:/edit.jsp?user=
site:target.com inurl:/edit.aspx?user=
site:target.com inurl:/edit inurl:?account=
site:target.com inurl:/edit.php?account=
site:target.com inurl:/edit.jsp?account=
site:target.com inurl:/edit.aspx?account=
site:target.com inurl:/edit inurl:?order=
site:target.com inurl:/edit.php?order=
site:target.com inurl:/edit.jsp?order=
site:target.com inurl:/edit.aspx?order=
site:target.com inurl:/edit inurl:?doc=
site:target.com inurl:/edit.php?doc=
site:target.com inurl:/edit.jsp?doc=
site:target.com inurl:/edit.aspx?doc=
site:target.com inurl:/edit inurl:?file=
site:target.com inurl:/edit.php?file=
site:target.com inurl:/edit.jsp?file=
site:target.com inurl:/edit.aspx?file=
site:target.com inurl:/edit inurl:?report=
site:target.com inurl:/edit.php?report=
site:target.com inurl:/edit.jsp?report=
site:target.com inurl:/edit.aspx?report=
site:target.com inurl:/edit inurl:?ticket=
site:target.com inurl:/edit.php?ticket=
site:target.com inurl:/edit.jsp?ticket=
site:target.com inurl:/edit.aspx?ticket=
site:target.com inurl:/edit inurl:?invoice=
site:target.com inurl:/edit.php?invoice=
site:target.com inurl:/edit.jsp?invoice=
site:target.com inurl:/edit.aspx?invoice=
site:target.com inurl:/edit inurl:?profile=
site:target.com inurl:/edit.php?profile=
site:target.com inurl:/edit.jsp?profile=
site:target.com inurl:/edit.aspx?profile=
site:target.com inurl:/delete inurl:?id=
site:target.com inurl:/delete.php?id=
site:target.com inurl:/delete.jsp?id=
site:target.com inurl:/delete.aspx?id=
site:target.com inurl:/delete inurl:?user=
site:target.com inurl:/delete.php?user=
site:target.com inurl:/delete.jsp?user=
site:target.com inurl:/delete.aspx?user=
site:target.com inurl:/delete inurl:?account=
site:target.com inurl:/delete.php?account=
site:target.com inurl:/delete.jsp?account=
site:target.com inurl:/delete.aspx?account=
site:target.com inurl:/delete inurl:?order=
site:target.com inurl:/delete.php?order=
site:target.com inurl:/delete.jsp?order=
site:target.com inurl:/delete.aspx?order=
site:target.com inurl:/delete inurl:?doc=
site:target.com inurl:/delete.php?doc=
site:target.com inurl:/delete.jsp?doc=
site:target.com inurl:/delete.aspx?doc=
site:target.com inurl:/delete inurl:?file=
site:target.com inurl:/delete.php?file=
site:target.com inurl:/delete.jsp?file=
site:target.com inurl:/delete.aspx?file=
site:target.com inurl:/delete inurl:?report=
site:target.com inurl:/delete.php?report=
site:target.com inurl:/delete.jsp?report=
site:target.com inurl:/delete.aspx?report=
site:target.com inurl:/delete inurl:?ticket=
site:target.com inurl:/delete.php?ticket=
site:target.com inurl:/delete.jsp?ticket=
site:target.com inurl:/delete.aspx?ticket=
site:target.com inurl:/delete inurl:?invoice=
site:target.com inurl:/delete.php?invoice=
site:target.com inurl:/delete.jsp?invoice=
site:target.com inurl:/delete.aspx?invoice=
site:target.com inurl:/delete inurl:?profile=
site:target.com inurl:/delete.php?profile=
site:target.com inurl:/delete.jsp?profile=
site:target.com inurl:/delete.aspx?profile=
site:target.com inurl:/download inurl:?id=
site:target.com inurl:/download.php?id=
site:target.com inurl:/download.jsp?id=
site:target.com inurl:/download.aspx?id=
site:target.com inurl:/download inurl:?user=
site:target.com inurl:/download.php?user=
site:target.com inurl:/download.jsp?user=
site:target.com inurl:/download.aspx?user=
site:target.com inurl:/download inurl:?account=
site:target.com inurl:/download.php?account=
site:target.com inurl:/download.jsp?account=
site:target.com inurl:/download.aspx?account=
site:target.com inurl:/download inurl:?order=
site:target.com inurl:/download.php?order=
site:target.com inurl:/download.jsp?order=
site:target.com inurl:/download.aspx?order=
site:target.com inurl:/download inurl:?doc=
site:target.com inurl:/download.php?doc=
site:target.com inurl:/download.jsp?doc=
site:target.com inurl:/download.aspx?doc=
site:target.com inurl:/download inurl:?file=
site:target.com inurl:/download.php?file=
site:target.com inurl:/download.jsp?file=
site:target.com inurl:/download.aspx?file=
site:target.com inurl:/download inurl:?report=
site:target.com inurl:/download.php?report=
site:target.com inurl:/download.jsp?report=
site:target.com inurl:/download.aspx?report=
site:target.com inurl:/download inurl:?ticket=
site:target.com inurl:/download.php?ticket=
```

