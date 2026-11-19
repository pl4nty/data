-- Threat: !InfrastructureShared
-- Name: 7b786a297a0e
-- Type: 21

if peattributes.ismsil and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
