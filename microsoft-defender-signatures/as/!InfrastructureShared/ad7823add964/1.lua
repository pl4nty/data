-- Threat: !InfrastructureShared
-- Name: ad7823add964
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
