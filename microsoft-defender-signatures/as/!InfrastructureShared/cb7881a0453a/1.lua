-- Threat: !InfrastructureShared
-- Name: cb7881a0453a
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
