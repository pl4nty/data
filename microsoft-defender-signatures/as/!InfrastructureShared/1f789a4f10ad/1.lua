-- Threat: !InfrastructureShared
-- Name: 1f789a4f10ad
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
