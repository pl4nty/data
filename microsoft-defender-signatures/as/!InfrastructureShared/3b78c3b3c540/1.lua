-- Threat: !InfrastructureShared
-- Name: 3b78c3b3c540
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
