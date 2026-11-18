-- Threat: !InfrastructureShared
-- Name: 47787b2066a8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
