class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]

    # Replace sender@example.com with your "From" address.
    # This address must be verified with Amazon SES.
    sender = "hello@shiftmarket.com.au"

    # Replace recipient@example.com with a "To" address. If your account 
    # is still in the sandbox, this address must be verified.
    recipient = @user.email

    # Specify a configuration set. If you do not want to use a configuration
    # set, comment the following variable and the 
    # configuration_set_name: configsetname argument below. 
    # configsetname = "ConfigSet"
      
    # Replace us-west-2 with the AWS Region you're using for Amazon SES.
    awsregion = "ap-southeast-2"

    # The subject line for the email.
    subject = "Accept my email!"

    # The HTML body of the email.
    htmlbody =
      '<h1>Amazon SES test (AWS SDK for Ruby)</h1>'\
      '<p>This email was sent with <a href="https://aws.amazon.com/ses/">'\
      'Amazon SES</a> using the <a href="https://aws.amazon.com/sdk-for-ruby/">'\
      'AWS SDK for Ruby</a>.'

    # The email body for recipients with non-HTML email clients.  
    textbody = "This email was sent with Amazon SES using the AWS SDK for Ruby."

    # Specify the text encoding scheme.
    encoding = "UTF-8"

    # Create a new SES resource and specify a region
    ses = Aws::SES::Client.new(
      region: awsregion,
      credentials: Aws::Credentials.new(Rails.application.credentials.aws[:AWS_ACCESS_KEY_ID], Rails.application.credentials.aws[:AWS_SECRET_ACCESS_KEY])
    )

    # Try to send the email.
    begin

      # Provide the contents of the email.
      resp = ses.send_email({
        destination: {
          to_addresses: [
            recipient,
          ],
        },
        message: {
          body: {
            html: {
              charset: encoding,
              data: htmlbody,
            },
            text: {
              charset: encoding,
              data: textbody,
            },
          },
          subject: {
            charset: encoding,
            data: subject,
          },
        },
      source: sender,
      # Comment or remove the following line if you are not using 
      # a configuration set
      # configuration_set_name: configsetname,
      })
      puts "Email sent BOI!"

    # If something goes wrong, display an error message.
    rescue Aws::SES::Errors::ServiceError => error
      puts "Email not sent. Error message: #{error}"
    end
  end
end
