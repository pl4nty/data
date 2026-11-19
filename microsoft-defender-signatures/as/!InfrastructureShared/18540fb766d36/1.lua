-- Threat: !InfrastructureShared
-- Name: 18540fb766d36
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
