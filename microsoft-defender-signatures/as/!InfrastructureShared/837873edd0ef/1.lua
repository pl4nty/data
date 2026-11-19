-- Threat: !InfrastructureShared
-- Name: 837873edd0ef
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
