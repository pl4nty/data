-- Threat: !InfrastructureShared
-- Name: 2f789b80dcc3
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
