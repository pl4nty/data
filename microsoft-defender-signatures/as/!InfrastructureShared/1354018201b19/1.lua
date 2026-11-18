-- Threat: !InfrastructureShared
-- Name: 1354018201b19
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
