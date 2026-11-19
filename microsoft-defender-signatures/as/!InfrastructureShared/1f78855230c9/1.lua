-- Threat: !InfrastructureShared
-- Name: 1f78855230c9
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
