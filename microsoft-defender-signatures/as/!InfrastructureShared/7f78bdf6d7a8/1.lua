-- Threat: !InfrastructureShared
-- Name: 7f78bdf6d7a8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
