-- Threat: !InfrastructureShared
-- Name: 6678d51b2b07
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
