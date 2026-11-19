-- Threat: !InfrastructureShared
-- Name: c7612c224069
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
