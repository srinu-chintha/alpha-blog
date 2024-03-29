class UsersController<ApplicationController
    before_action :set_user,only: [:show,:edit,:update,:destroy]
    before_action :require_user,only: [:edit,:update]
    before_action :requre_same_user,only: [:edit,:update,:destroy]
    def new
        @user=User.new
    end
    def create
        @user=User.new(user_params)
        if @user.save
            session[:user_id]=@user.id
            flash[:notice]="Welcome #{@user.username} You have successfully signed in..!"
            redirect_to articles_path
        else
            render "new"
        end
    end
    def edit
    end
    def update
       
        if @user.update(user_params)
            flash[:notice]="Your Account details has been successfully updated..!"
            redirect_to user_path(@user.id)
        else
            render "edit"
        end
    end
    def show
        @articles=@user.articles.paginate(page: params[:page], per_page: 2)
    end
    def index
        @users=User.paginate(page: params[:page], per_page: 3)
    end
    def destroy
        @user.destroy
        session[:user_id]=nil if @user==curent_user
        flash[:notice]="account and associated articles are destroyed"
        redirect_to root_path
    end
    private
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end
    def set_user
        @user=User.find(params[:id])
    end
    def requre_same_user
        if curent_user != @user && !curent_user.admin?
            flash[:alert]="you only edit or delete your own articles"
            redirect_to user_path(@user.id)
        end
    end
end