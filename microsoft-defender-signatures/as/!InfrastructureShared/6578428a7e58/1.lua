-- Threat: !InfrastructureShared
-- Name: 6578428a7e58
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
