-- Threat: !InfrastructureShared
-- Name: 152786dbb2233
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
