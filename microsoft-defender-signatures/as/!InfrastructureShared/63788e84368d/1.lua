-- Threat: !InfrastructureShared
-- Name: 63788e84368d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
