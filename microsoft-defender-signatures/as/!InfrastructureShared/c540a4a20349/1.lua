-- Threat: !InfrastructureShared
-- Name: c540a4a20349
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
