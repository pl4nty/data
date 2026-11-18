-- Threat: !InfrastructureShared
-- Name: 2378f26340a4
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() > 100000 then
  return mp.INFECTED
end
return mp.CLEAN
