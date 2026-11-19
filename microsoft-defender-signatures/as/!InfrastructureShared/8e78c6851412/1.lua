-- Threat: !InfrastructureShared
-- Name: 8e78c6851412
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 353794 then
  return mp.INFECTED
end
return mp.CLEAN
