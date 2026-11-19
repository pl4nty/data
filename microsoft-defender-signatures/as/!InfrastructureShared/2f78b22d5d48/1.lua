-- Threat: !InfrastructureShared
-- Name: 2f78b22d5d48
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
