-- Threat: !InfrastructureShared
-- Name: 15402e90b294
-- Type: 21

if peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
