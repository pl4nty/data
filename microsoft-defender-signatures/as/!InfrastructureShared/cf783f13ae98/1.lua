-- Threat: !InfrastructureShared
-- Name: cf783f13ae98
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
