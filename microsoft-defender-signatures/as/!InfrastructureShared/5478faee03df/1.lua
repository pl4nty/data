-- Threat: !InfrastructureShared
-- Name: 5478faee03df
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
