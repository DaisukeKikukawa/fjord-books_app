# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:cherry_book)
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: '人間失格'
    fill_in 'メモ', with: '非常に面白い'
    fill_in '著者', with: '太宰治'
    click_button '登録する'

    assert_text '本が作成されました。'
    click_on '編集'
  end

  test 'updating a Book' do
    visit books_url
    click_on '編集'

    fill_in 'タイトル', with: '金閣寺'
    fill_in 'メモ', with: 'とても素晴らしい'
    fill_in '著者', with: '三島由紀夫'
    click_button '更新する'

    assert_text '本が更新されました'
    click_on '戻る'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除'
    end
    assert_text '本が削除されました。'
  end
end
