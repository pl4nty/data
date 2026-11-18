-- Threat: !InfrastructureShared
-- Name: 6b786c67c966
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 512000 then
  return mp.INFECTED
end
return mp.CLEAN
