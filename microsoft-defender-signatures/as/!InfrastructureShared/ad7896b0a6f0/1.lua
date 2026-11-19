-- Threat: !InfrastructureShared
-- Name: ad7896b0a6f0
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
