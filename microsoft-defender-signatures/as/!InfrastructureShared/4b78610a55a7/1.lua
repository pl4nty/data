-- Threat: !InfrastructureShared
-- Name: 4b78610a55a7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
