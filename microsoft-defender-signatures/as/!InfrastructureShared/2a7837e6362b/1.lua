-- Threat: !InfrastructureShared
-- Name: 2a7837e6362b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
