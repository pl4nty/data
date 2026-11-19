-- Threat: !InfrastructureShared
-- Name: 4a78d507371f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
