class Task < ApplicationRecord
  has_many :notebooks_by_tasks, class_name: 'IntNotebookTask'
  has_many :users_by_tasks, class_name: 'IntUserTask'
end
