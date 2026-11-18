-- Threat: !InfrastructureShared
-- Name: 5540e405da58
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
