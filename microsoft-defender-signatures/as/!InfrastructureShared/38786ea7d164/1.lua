-- Threat: !InfrastructureShared
-- Name: 38786ea7d164
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
