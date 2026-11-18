-- Threat: !InfrastructureShared
-- Name: 4d782074cb28
-- Type: 21

if peattributes.no_security and peattributes.isdll and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
