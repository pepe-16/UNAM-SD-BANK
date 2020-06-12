defmodule DistWeb.UserView do
   use DistWeb, :view
   alias Dist.Accounts
   alias Dist.Accounts.User
 
   def first_name(%Accounts.User{name: name}) do
      name
   end
end
