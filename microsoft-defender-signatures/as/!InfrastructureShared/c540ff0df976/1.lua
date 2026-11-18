-- Threat: !InfrastructureShared
-- Name: c540ff0df976
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 512000 then
  return mp.INFECTED
end
return mp.CLEAN
