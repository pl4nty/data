-- Threat: !InfrastructureShared
-- Name: 6378093e5eaf
-- Type: 21

if peattributes.ismsil and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
