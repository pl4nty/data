-- Threat: !InfrastructureShared
-- Name: 15178ce4fb6de
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 10240 then
  return mp.INFECTED
end
return mp.CLEAN
