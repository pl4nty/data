-- Threat: !InfrastructureShared
-- Name: 7878c59536a2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
