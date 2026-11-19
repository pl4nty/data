-- Threat: !InfrastructureShared
-- Name: 757890a40c58
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
