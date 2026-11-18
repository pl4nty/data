-- Threat: !InfrastructureShared
-- Name: 2e61fdd48697
-- Type: 21

if mp.getfilesize() < 2000000 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
