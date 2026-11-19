-- Threat: !InfrastructureShared
-- Name: a07864c434d2
-- Type: 21

if mp.getfilesize() > 2693700 and mp.getfilesize() < 2693800 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
