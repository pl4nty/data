-- Threat: !InfrastructureShared
-- Name: 155408e11a291
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
