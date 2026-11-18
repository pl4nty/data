-- Threat: !InfrastructureShared
-- Name: e540f08c28b7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
