-- Threat: !InfrastructureShared
-- Name: d078119f745f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
