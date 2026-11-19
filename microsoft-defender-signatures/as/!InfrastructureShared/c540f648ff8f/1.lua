-- Threat: !InfrastructureShared
-- Name: c540f648ff8f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
