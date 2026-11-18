-- Threat: !InfrastructureShared
-- Name: 6e7836713bfd
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() > 236000 and mp.getfilesize() < 250000 then
  return mp.INFECTED
end
return mp.CLEAN
