-- Threat: !InfrastructureShared
-- Name: b878790f2820
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
