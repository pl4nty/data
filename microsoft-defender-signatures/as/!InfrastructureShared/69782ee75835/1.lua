-- Threat: !InfrastructureShared
-- Name: 69782ee75835
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
