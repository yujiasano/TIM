<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
# README

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
|image|text||
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