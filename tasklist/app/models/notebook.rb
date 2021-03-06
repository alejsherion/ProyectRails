class Notebook < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :notebooks_by_tasks, class_name: 'IntNotebookTask'
end
