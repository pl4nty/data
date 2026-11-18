-- Threat: !InfrastructureShared
-- Name: 447864335bdf
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
