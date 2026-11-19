-- Threat: !InfrastructureShared
-- Name: a27855925151
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
