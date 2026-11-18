-- Threat: !InfrastructureShared
-- Name: e778651e085c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
