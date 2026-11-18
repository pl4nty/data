-- Threat: !InfrastructureShared
-- Name: 617814f19937
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
