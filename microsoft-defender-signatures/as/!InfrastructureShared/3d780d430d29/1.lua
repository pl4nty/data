-- Threat: !InfrastructureShared
-- Name: 3d780d430d29
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
