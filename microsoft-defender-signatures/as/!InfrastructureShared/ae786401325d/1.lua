-- Threat: !InfrastructureShared
-- Name: ae786401325d
-- Type: 21

if mp.getfilesize() > 20480 and mp.getfilesize() < 65536 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
