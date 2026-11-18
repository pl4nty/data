-- Threat: !InfrastructureShared
-- Name: 197838af8e89
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
