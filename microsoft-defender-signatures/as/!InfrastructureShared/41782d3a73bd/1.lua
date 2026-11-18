-- Threat: !InfrastructureShared
-- Name: 41782d3a73bd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
