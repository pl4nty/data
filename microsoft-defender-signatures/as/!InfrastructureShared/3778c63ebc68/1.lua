-- Threat: !InfrastructureShared
-- Name: 3778c63ebc68
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
