-- Threat: !InfrastructureShared
-- Name: 9378c3b3b910
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
