-- Threat: !InfrastructureShared
-- Name: 34784b014c53
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
