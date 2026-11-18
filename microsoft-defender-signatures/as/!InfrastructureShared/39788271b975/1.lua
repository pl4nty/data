-- Threat: !InfrastructureShared
-- Name: 39788271b975
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
