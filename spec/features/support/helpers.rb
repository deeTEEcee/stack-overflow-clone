module FormHelper
  # rspec's I18n.t
  # def rt(label)
  #   t("simple_form.labels.defaults.#{label}")
  # end
end

module Helper
  def login(user)
    visit '/'
    click_link t('login')
    fill_form(:user, {
      'session_username' => user.username,
      'session_password' => 'admin'
    })
    within('form') do
      click_on t('login')
    end
  end
end
