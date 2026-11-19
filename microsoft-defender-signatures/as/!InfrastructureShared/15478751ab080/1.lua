-- Threat: !InfrastructureShared
-- Name: 15478751ab080
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
