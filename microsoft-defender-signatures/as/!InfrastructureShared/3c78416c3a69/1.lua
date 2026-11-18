-- Threat: !InfrastructureShared
-- Name: 3c78416c3a69
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
