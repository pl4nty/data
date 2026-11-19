-- Threat: !InfrastructureShared
-- Name: 5978f88aea75
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
