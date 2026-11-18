-- Threat: !InfrastructureShared
-- Name: ac78876b11f0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
