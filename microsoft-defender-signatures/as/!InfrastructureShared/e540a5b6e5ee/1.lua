-- Threat: !InfrastructureShared
-- Name: e540a5b6e5ee
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
