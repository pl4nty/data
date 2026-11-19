-- Threat: !InfrastructureShared
-- Name: 7678c1c55ecc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
