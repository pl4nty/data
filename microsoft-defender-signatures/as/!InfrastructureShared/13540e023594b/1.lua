-- Threat: !InfrastructureShared
-- Name: 13540e023594b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
