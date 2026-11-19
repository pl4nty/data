-- Threat: !InfrastructureShared
-- Name: 5378edf08fd8
-- Type: 21

if mp.getfilesize() < 500000 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
