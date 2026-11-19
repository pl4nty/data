-- Threat: !InfrastructureShared
-- Name: 3e615040c40e
-- Type: 21

if mp.getfilesize() < 5000 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
