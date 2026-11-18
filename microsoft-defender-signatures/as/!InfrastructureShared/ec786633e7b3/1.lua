-- Threat: !InfrastructureShared
-- Name: ec786633e7b3
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 13400 then
  return mp.INFECTED
end
return mp.CLEAN
