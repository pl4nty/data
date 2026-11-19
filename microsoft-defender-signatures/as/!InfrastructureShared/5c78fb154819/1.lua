-- Threat: !InfrastructureShared
-- Name: 5c78fb154819
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
