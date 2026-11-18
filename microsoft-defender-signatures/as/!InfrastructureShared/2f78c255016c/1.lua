-- Threat: !InfrastructureShared
-- Name: 2f78c255016c
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true and mp.getfilesize() < 10240 then
  return mp.INFECTED
end
return mp.CLEAN
