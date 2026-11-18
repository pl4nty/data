-- Threat: !InfrastructureShared
-- Name: 8b788b8c8e24
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
