-- Threat: !InfrastructureShared
-- Name: 72782374fe4a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
