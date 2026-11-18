-- Threat: !InfrastructureShared
-- Name: 63786ec48a22
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
