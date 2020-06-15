
# TIM -time is money-
  有料の質問サイトです。  


# Description
  早く問題を解決したいと思った時に思いついたアプリです。  
  質問者はお金を払って質問し、 一番早く問題を解決できた回答者はお金がもらえるというシステムです。  
  質問者はお金を払うことで調べる手間と時間を削減でき、 回答者は早く質問に回答することでお金を稼ぐことができます。
  
  
# DEMO
[![Image from Gyazo](https://i.gyazo.com/5cdffe08306d7b4fc1da854348cfb128.jpg)](https://gyazo.com/5cdffe08306d7b4fc1da854348cfb128)


# APP URL
https://tim-question-app.herokuapp.com/


# features
- ユーザーの登録/ログイン機能
- 質問の投稿、削除機能
- クレジットカードでの決済機能
- コメント機能
- お気に入り機能


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :questions
- has_many :answers 
- has_many :likes
- has_many :cards

## questionsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text||
|image|string||
|user_id|integer| false, foregin_key: true|

### Association
- has_many :answers
- belongs_to :user

## answersテーブル

|Column|Type|Options|
|------|----|-------|
|content|text||
|image|string||
|user_id|integer|null: false, foregin_key: true|
|question_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :like
- belongs_to :question

## likeテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foregin_key: true|
|answer_id|integer|null: false, foregin_key: true|

### Association
- belongs_to :user
- belongs_to :answer
