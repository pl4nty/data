-- Threat: !InfrastructureShared
-- Name: 227803ede9df
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
