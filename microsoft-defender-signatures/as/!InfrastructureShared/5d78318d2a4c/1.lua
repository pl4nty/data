-- Threat: !InfrastructureShared
-- Name: 5d78318d2a4c
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true and mp.getfilesize() > 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
