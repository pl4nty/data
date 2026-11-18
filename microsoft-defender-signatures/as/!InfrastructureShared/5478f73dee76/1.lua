-- Threat: !InfrastructureShared
-- Name: 5478f73dee76
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
