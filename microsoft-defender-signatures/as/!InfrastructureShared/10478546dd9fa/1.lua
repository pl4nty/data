-- Threat: !InfrastructureShared
-- Name: 10478546dd9fa
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
