-- Threat: !InfrastructureShared
-- Name: 114781fbf1b35
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
