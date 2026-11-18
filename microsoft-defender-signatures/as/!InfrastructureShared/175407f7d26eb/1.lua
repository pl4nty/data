-- Threat: !InfrastructureShared
-- Name: 175407f7d26eb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
