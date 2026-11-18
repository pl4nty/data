-- Threat: !InfrastructureShared
-- Name: d478647932ea
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
