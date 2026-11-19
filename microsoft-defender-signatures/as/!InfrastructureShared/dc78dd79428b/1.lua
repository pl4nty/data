-- Threat: !InfrastructureShared
-- Name: dc78dd79428b
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
