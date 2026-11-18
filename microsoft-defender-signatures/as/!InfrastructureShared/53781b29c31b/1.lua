-- Threat: !InfrastructureShared
-- Name: 53781b29c31b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
