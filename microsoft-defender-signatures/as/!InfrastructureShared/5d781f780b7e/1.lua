-- Threat: !InfrastructureShared
-- Name: 5d781f780b7e
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
