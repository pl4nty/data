-- Threat: !InfrastructureShared
-- Name: 8f785eecec60
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
