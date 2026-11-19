-- Threat: !InfrastructureShared
-- Name: 3478bbc9bfbe
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
