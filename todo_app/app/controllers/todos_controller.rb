class TodosController < ApplicationController
  before_action :find_todo, only: [:show, :edit, :update, :destroy, :complete]
  before_action :find_all, only: [:index, :list]
  def index
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    redirect_to todos_path
  end

  def show
    @completed = @todo.completed ? "Si" : "No"
  end

  def edit
  end

  def update
    @todo.update(todo_params)
    redirect_to todos_path
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  def complete
    @todo.completed = true
    @todo.save
    redirect_to todos_path
  end

  def list
    @completos = []
    @incompletos = []
    @todos.each do |todo|
      if todo.completed
        @completos << todo.description
      else
        @incompletos << todo.description
      end
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:description, :completed)
  end

  def find_todo
    @todo = Todo.find(params[:id])
  end
  def find_all
    @todos = Todo.all
  end
end
