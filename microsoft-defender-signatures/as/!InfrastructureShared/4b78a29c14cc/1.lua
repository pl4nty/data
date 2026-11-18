-- Threat: !InfrastructureShared
-- Name: 4b78a29c14cc
-- Type: 21

if peattributes.isdll == false and peattributes.no_security == true and mp.getfilesize() < 1508416 then
  return mp.INFECTED
end
return mp.CLEAN
