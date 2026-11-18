-- Threat: !InfrastructureShared
-- Name: 8e785b726b6d
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
