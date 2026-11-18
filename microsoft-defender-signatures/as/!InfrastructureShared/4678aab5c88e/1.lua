-- Threat: !InfrastructureShared
-- Name: 4678aab5c88e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
