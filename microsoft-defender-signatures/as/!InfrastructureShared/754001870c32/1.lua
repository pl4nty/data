-- Threat: !InfrastructureShared
-- Name: 754001870c32
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
