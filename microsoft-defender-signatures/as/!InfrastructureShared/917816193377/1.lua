-- Threat: !InfrastructureShared
-- Name: 917816193377
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
