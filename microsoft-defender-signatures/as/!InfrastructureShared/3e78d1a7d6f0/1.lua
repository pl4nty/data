-- Threat: !InfrastructureShared
-- Name: 3e78d1a7d6f0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
