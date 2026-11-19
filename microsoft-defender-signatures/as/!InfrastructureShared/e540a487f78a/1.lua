-- Threat: !InfrastructureShared
-- Name: e540a487f78a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
