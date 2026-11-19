-- Threat: !InfrastructureShared
-- Name: c540500f5c52
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
