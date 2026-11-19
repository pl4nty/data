-- Threat: !InfrastructureShared
-- Name: 1978110a7bbc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
