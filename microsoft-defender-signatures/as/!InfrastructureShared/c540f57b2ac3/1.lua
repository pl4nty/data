-- Threat: !InfrastructureShared
-- Name: c540f57b2ac3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
