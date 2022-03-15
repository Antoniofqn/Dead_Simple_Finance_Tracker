module ApplicationHelper
  def extract_values(transactions)
    transactions.map { |x| x.type_transaction == "Expense" ? x.value * -1 : x.value }
  end

  def user_has_photo?(user)
    return cl_image_tag @user.photo.key, :width=>100, :gravity=>"faces", crop: :thumb, radius: "max", :aspect_ratio=>"1.0" if @user.photo.attached?

    image_tag "https://abs.twimg.com/sticky/default_profile_images/default_profile_400x400.png",
              width: 70, style: "border-radius:100%"
  end

  def navbar_avatar_has_photo?(user)
    if user.photo.attached?
      return cl_image_tag user.photo.key, height: 40, width: 40, crop: :fill, gravity: :face,
                                          class: "dropdown-toggle", id: "navbarDropdown",
                                          data: { bs_toggle: "dropdown" }, 'aria-haspopup': true,
                                          'aria-expanded': false, style: "border-radius:50%"
    end

    image_tag "https://abs.twimg.com/sticky/default_profile_images/default_profile_400x400.png",
              class: "avatar dropdown-toggle", id: "navbarDropdown",
              data: { bs_toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false
  end
end
