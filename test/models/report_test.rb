# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    me = User.create(email: 'me@example.com', password: 'password')
    she = User.create(email: 'she@example.com', password: 'password')
    report = Report.create(user_id: me.id, title: '初めまして', content: 'こんにちは')

    assert report
    assert report.editable?(me)
    assert_not report.editable?(she)
  end

  test '#created_on' do
    me = User.create(email: 'me@example.com', password: 'password')
    report = Report.create(user_id: me.id, title: '初めまして', content: 'こんにちは')

    assert report
    assert_not_equal Date, report.created_at.class
  end
end
