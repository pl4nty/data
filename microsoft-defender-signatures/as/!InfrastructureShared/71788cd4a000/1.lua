-- Threat: !InfrastructureShared
-- Name: 71788cd4a000
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
