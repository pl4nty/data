-- Threat: !InfrastructureShared
-- Name: 57785b792ae0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
