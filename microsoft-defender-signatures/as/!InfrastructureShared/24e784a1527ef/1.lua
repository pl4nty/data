-- Threat: !InfrastructureShared
-- Name: 24e784a1527ef
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
