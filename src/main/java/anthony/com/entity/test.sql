select
    user.userName
    , user_role.role_name
from
    user
join
    user_role
on
    user.id = user_role.userId
where
    user.companyId = 1
;