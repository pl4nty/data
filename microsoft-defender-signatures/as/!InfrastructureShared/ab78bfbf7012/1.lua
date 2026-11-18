-- Threat: !InfrastructureShared
-- Name: ab78bfbf7012
-- Type: 21

if peattributes.ismsil and peattributes.x86_image and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
