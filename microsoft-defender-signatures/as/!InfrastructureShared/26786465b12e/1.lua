-- Threat: !InfrastructureShared
-- Name: 26786465b12e
-- Type: 21

if peattributes.x86_image and peattributes.no_exports then
  return mp.INFECTED
end
return mp.CLEAN
