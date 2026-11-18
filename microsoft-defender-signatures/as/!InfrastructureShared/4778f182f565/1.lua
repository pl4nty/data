-- Threat: !InfrastructureShared
-- Name: 4778f182f565
-- Type: 21

if peattributes.amd64_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
