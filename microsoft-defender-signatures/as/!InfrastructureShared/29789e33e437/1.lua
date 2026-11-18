-- Threat: !InfrastructureShared
-- Name: 29789e33e437
-- Type: 21

if peattributes.x86_image and peattributes.no_exports then
  return mp.INFECTED
end
return mp.CLEAN
