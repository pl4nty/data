-- Threat: !InfrastructureShared
-- Name: 28782d517148
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
