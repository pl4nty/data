-- Threat: !InfrastructureShared
-- Name: 61783c7f63ad
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
