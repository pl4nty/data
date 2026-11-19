-- Threat: !InfrastructureShared
-- Name: 597804cdc031
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
