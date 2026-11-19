-- Threat: !InfrastructureShared
-- Name: 8378f5909538
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
