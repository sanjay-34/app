class ExpensesController < ApplicationController
    before_action :set_expense, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    before_action :correct_user, only: [:edit, :update, :destroy]
    
    def index 
        @expenses = Expense.all
    end

    def show
        @expense = Expense.find(params[:id])
    end

    def new
        #@expense = Expense.new
        @expense = current_user.expenses.build
     end

    def create
        #@expense = Expense.new(expense_params)
        @expense = current_user.expenses.build(expense_params)
        if(@expense.save)
            redirect_to @expense
        else 
            render 'new'
        end
    end


    def edit
        @expense = Expense.find(params[:id])
    end

    def update
        @expense = Expense.find(params[:id])
        if @expense.update(expense_params)
            redirect_to expense_path
        else
            render :edit
        end
    end

    def destroy
        @expense = Expense.find(params[:id])
        @expense.destroy
        redirect_to expenses_path, notice: "Entry deleted.....!"
    end

    def correct_user
        @expense = current_user.expenses.find_by(id: params[:id])
        redirect_to expenses_path, notice: "Not authorized to Edit this" if @expense.nil?
    end
    
    private
        def set_expense
        @expense = Expense.find(params[:id])
    end

    private 
    def expense_params
            params.require(:expense).permit(:title, :body, :date, :user_id)
    end

end
