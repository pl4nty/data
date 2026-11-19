-- Threat: !InfrastructureShared
-- Name: 80788d4bd50f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
