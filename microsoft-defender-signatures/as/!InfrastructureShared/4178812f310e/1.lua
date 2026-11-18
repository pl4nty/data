-- Threat: !InfrastructureShared
-- Name: 4178812f310e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
