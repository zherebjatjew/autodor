# encoding: UTF-8

require File.dirname(File.dirname(__FILE__)) + '/helpers/users_helper'

class AuthorAssigner
  def before_save(record)
    begin
      record.author_id = current_user if record.new_record?
    rescue
      puts "Skipping author assignment: current_user is not defined yet"
    end
  end
end

