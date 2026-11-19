-- Threat: !InfrastructureShared
-- Name: 16278d8e49e3f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 3140000 then
  return mp.INFECTED
end
return mp.CLEAN
