-- Threat: !InfrastructureShared
-- Name: 3e78231dd68a
-- Type: 21

if peattributes.no_security and peattributes.isdll and mp.getfilesize() < 107000 and mp.getfilesize() > 101000 then
  return mp.INFECTED
end
return mp.CLEAN
