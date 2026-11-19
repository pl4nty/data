-- Threat: !InfrastructureShared
-- Name: bc784f5ef5f3
-- Type: 21

if peattributes.x86_image and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
