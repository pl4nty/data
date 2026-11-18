-- Threat: !InfrastructureShared
-- Name: 10e78f602d3fe
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
