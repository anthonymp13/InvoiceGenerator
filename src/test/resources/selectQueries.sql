# select
#     comp.id as CompId
#      , cus.id as CusId
#      , inv.id as InvId
#      , itm.id as ItmId
#      , prd.id as PrdId
#      , usr.id as UsrId
#      , role.id as RoleId
# from
#     company as comp
#         inner join customer as cus on cus.companyId = comp.id
#         inner join invoice as inv on inv.customerId = cus.id
#         inner join item as itm on itm.invoiceId = inv.id
#         inner join product as prd on itm.productId = prd.id
#         inner join user as usr on usr.companyId = comp.id
#         inner join user_role as role on role.userId = usr.id
# ;
#


# 25
# select * from company;

# 100
# select * from customer;

# 150
# select * from invoice;

# 150
# select * from item;

# 100
# select * from product;

# 25
# select * from user;

# 25
# select * from user_role;