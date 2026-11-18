-- Threat: !InfrastructureShared
-- Name: 52780fd97cf2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
