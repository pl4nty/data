-- Threat: !InfrastructureShared
-- Name: 64781eec3889
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
