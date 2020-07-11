# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  after_action :set_default_avatar, only: [:create]

  AVATARS = [
    'bee.svg',
    'bulldog.svg',
    'cow.svg',
    'dog.svg',
    'fish.svg',
    'fish-2.svg',
    'fox.svg',
    'insect.svg',
    'bear.svg',
    'cat.svg',
    'deer.svg',
    'elephant.svg',
    'fly.svg',
    'lion.svg',
    'panda-bear.svg',
    'pig.svg',
    'tiger.svg',
    'wolf.svg'
  ]

  protected

  def set_default_avatar
    resource.avatar = AVATARS.sample
    resource.save
  end
end
