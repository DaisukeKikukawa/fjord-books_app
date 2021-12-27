# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    owner = User.create(email: 'me@example.com', password: 'password')
    other_user = User.create(email: 'she@example.com', password: 'password')
    report = Report.create!(user_id: owner.id, title: '初めまして', content: 'こんにちは')

    assert report.editable?(owner)
    assert_not report.editable?(other_user)
  end

  test '#created_on' do
    owner = User.create(email: 'me@example.com', password: 'password')
    report = Report.create!(user_id: owner.id, title: '初めまして', content: 'こんにちは')

  end
end
