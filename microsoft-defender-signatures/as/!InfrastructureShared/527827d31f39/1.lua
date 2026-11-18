-- Threat: !InfrastructureShared
-- Name: 527827d31f39
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
