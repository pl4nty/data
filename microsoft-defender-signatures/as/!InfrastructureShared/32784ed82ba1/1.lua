-- Threat: !InfrastructureShared
-- Name: 32784ed82ba1
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true and mp.getfilesize() > 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
