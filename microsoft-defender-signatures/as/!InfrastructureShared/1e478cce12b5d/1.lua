-- Threat: !InfrastructureShared
-- Name: 1e478cce12b5d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
