-- Threat: !InfrastructureShared
-- Name: 115407e7fc810
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
