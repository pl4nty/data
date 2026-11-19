-- Threat: !InfrastructureShared
-- Name: 4f782a90fe7b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
