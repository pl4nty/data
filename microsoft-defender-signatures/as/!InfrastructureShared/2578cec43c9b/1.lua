-- Threat: !InfrastructureShared
-- Name: 2578cec43c9b
-- Type: 21

if peattributes.x86_image and peattributes.no_exports then
  return mp.INFECTED
end
return mp.CLEAN
