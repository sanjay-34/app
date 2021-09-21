class ExpensesController < ApplicationController
    
    def index 
        @expenses = Expense.all
    end

    def show
        @expense = Expense.find(params[:id])
    end

    def new
        @expense = Expense.new
    end

    def create
        #render plain: params[:expense].inspect
        @expense = Expense.new(expense_params)

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
        redirect_to expenses_path
    end

    private 
    def expense_params
            params.require(:expense).permit(:title, :body, :date)
    end

end
