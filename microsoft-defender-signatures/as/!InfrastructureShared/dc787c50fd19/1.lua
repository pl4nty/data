-- Threat: !InfrastructureShared
-- Name: dc787c50fd19
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
