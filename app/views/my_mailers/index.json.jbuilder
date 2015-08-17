json.array!(@my_mailers) do |my_mailer|
  json.extract! my_mailer, :id, :schedule_time, :email, :subject, :body
  json.url my_mailer_url(my_mailer, format: :json)
end
