-- Threat: !InfrastructureShared
-- Name: 3f78d64c1716
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
