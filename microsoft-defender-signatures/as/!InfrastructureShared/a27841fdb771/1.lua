-- Threat: !InfrastructureShared
-- Name: a27841fdb771
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
