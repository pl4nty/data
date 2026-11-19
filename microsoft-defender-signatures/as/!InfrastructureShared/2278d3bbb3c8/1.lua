-- Threat: !InfrastructureShared
-- Name: 2278d3bbb3c8
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
