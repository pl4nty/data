-- Threat: !InfrastructureShared
-- Name: c540f8146bea
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
