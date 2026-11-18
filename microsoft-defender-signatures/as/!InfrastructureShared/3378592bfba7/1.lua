-- Threat: !InfrastructureShared
-- Name: 3378592bfba7
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
