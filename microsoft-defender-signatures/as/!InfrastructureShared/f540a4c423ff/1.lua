-- Threat: !InfrastructureShared
-- Name: f540a4c423ff
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
