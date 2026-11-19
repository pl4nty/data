-- Threat: !InfrastructureShared
-- Name: 13178d5d51d23
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
