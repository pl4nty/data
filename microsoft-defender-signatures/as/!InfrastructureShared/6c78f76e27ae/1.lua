-- Threat: !InfrastructureShared
-- Name: 6c78f76e27ae
-- Type: 21

if peattributes.no_security == true and peattributes.isdll and mp.getfilesize() > 640000 and mp.getfilesize() < 645000 then
  return mp.INFECTED
end
return mp.CLEAN
