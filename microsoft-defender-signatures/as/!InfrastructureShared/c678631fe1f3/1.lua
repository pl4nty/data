-- Threat: !InfrastructureShared
-- Name: c678631fe1f3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
