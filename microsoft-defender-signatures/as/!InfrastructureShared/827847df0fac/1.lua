-- Threat: !InfrastructureShared
-- Name: 827847df0fac
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
