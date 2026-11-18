-- Threat: !InfrastructureShared
-- Name: 1e7866a08ac7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
