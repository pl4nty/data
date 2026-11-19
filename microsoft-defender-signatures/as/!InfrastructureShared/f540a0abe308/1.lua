-- Threat: !InfrastructureShared
-- Name: f540a0abe308
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
