-- Threat: !InfrastructureShared
-- Name: 6f78737a5a5e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
