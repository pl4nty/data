-- Threat: !InfrastructureShared
-- Name: 5561b5042179
-- Type: 21

if mp.getfilesize() < 10000 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
