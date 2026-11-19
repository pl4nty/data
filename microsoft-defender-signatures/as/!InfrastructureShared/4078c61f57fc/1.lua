-- Threat: !InfrastructureShared
-- Name: 4078c61f57fc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
