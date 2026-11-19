-- Threat: !InfrastructureShared
-- Name: 6678c87a35af
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
