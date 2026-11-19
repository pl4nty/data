-- Threat: !InfrastructureShared
-- Name: 3578797a52c3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
