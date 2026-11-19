-- Threat: !InfrastructureShared
-- Name: a6788a55622c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
