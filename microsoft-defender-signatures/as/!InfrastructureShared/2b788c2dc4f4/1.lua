-- Threat: !InfrastructureShared
-- Name: 2b788c2dc4f4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
