-- Threat: !InfrastructureShared
-- Name: db78eb345417
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
