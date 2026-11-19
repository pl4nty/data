-- Threat: !InfrastructureShared
-- Name: 2e78eed6da3d
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
