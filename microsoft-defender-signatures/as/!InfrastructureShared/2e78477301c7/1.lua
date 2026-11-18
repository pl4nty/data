-- Threat: !InfrastructureShared
-- Name: 2e78477301c7
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 600000 then
  return mp.INFECTED
end
return mp.CLEAN
