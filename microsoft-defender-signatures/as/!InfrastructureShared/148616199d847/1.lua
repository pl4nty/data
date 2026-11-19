-- Threat: !InfrastructureShared
-- Name: 148616199d847
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
