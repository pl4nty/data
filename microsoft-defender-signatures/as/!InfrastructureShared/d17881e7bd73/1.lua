-- Threat: !InfrastructureShared
-- Name: d17881e7bd73
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.hasexports == true and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
