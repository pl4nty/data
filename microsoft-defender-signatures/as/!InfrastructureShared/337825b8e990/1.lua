-- Threat: !InfrastructureShared
-- Name: 337825b8e990
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
