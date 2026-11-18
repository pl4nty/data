-- Threat: !InfrastructureShared
-- Name: 5c787b436968
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
