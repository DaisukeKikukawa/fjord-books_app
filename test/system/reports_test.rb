# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '登録する'

    assert_text '日報の作成に成功しました'
    assert_text '日報のタイトル'
    assert_text '日報の内容'
  end

  test 'updating a report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: '本日の活動'
    fill_in '内容', with: '本日の活動報告です！'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '本日の活動'
    assert_text '本日の活動報告です！'
  end

  test 'destroying a report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
  end
end
