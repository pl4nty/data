-- Threat: !InfrastructureShared
-- Name: 3578d5f48a48
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
