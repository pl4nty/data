-- Threat: !InfrastructureShared
-- Name: 60781864d221
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
