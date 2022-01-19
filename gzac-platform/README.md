# GZAC

## Setup Den Haag e-mail service for development

### Setup valtimo-backend-libraries
1. In `/app/gzac/build.gradle` replace `:mail:local-mail` with `:mail:den-haag-mailer`
2. Add connector `DenHaagMailer` with url: `http://localhost:8012`

### Setup Wordpress
1. Go to http://localhost:8012/wp-admin/ (Wordpress)
2. Create Admin account
3. Login with new Admin account
4. -> Plugins -> Add New -> Upload Plugin -> (dh-wordpress-email-template-plugin-1.2.1.zip) -> Install Now -> Activate Plugin
5. -> Plugins -> Add New -> Search `WP Mail SMTP by WPForms` -> Install Now -> Activate -> Go back to the Dashboard
6. -> Plugins -> Add New -> Search `Advanced Custom Fields` -> Install Now -> Activate
7. -> Plugins -> Add New -> Search `Mailhog for WordPress` -> Install Now -> Activate
8. -> E-mail template -> Add New -> Titel: `base-template-name`, Inhoud: `{{ CONTENT }}` -> publish
9. -> E-mail -> Add New -> `template-name`, `base-template-name`, `{{ SUBJECT }}`, `{{ BODY_TEXT }}` -> publish
10. -> Settings -> Permalinks -> select option `Post name` -> Save Changes
11. -> WP Mail SMTP -> Settings -> Mailer: `Other SMTP`, SMTP Host: `mail-mailhog` Encryption: `none` SMTP Port: `1025` -> Save Setting

## Test Wordpress & Mailhog e-mail setup
1. -> WP Mail SMTP -> Tools -> Press 'Send Email'
2. See all e-mails in: `http://localhost:8025/`
