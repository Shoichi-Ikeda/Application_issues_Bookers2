class SearchController < ApplicationController
  def search
		if params[:word].present? && params[:model] === "Book" && params[:search] === "perfect"
			@books = Book.where('title LIKE ?', "#{params[:word]}")
			# 完全一致(book)
		elsif params[:word].present? && params[:model] === "Book" && params[:search] === "front"
			@books = Book.where('title LIKE ?', "#{params[:word]}%")
			# 前方一致(book)
		elsif params[:word].present? && params[:model] === "Book" && params[:search] === "back"
			@books = Book.where('title LIKE ?', "%#{params[:word]}")
			# 後方一致(book)
		elsif params[:word].present? && params[:model] === "Book" && params[:search] === "part"
			@books = Book.where('title LIKE ?', "%#{params[:word]}%")
			# 部分一致(book)
		end

		if params[:word].present? && params[:model] === "User" && params[:search] === "perfect"
			@users = User.where('name LIKE ?', "#{params[:word]}")
			# 完全一致(user)
		elsif params[:word].present? && params[:model] === "User" && params[:search] === "front"
			@users = User.where('name LIKE ?', "#{params[:word]}%")
			# 前方一致(user)
		elsif params[:word].present? && params[:model] === "User" && params[:search] === "back"
			@users = User.where('name LIKE ?', "%#{params[:word]}")
			# 後方一致(user)
		elsif params[:word].present? && params[:model] === "User" && params[:search] === "part"
			@users = User.where('name LIKE ?', "%#{params[:word]}%")
			# 部分一致(user)
    end
	end
end