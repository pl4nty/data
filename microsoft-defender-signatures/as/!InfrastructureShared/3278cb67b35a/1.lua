-- Threat: !InfrastructureShared
-- Name: 3278cb67b35a
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true and mp.getfilesize() > 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
