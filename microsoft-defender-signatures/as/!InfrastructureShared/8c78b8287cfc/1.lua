-- Threat: !InfrastructureShared
-- Name: 8c78b8287cfc
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
