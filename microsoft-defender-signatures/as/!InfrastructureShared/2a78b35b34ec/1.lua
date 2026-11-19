-- Threat: !InfrastructureShared
-- Name: 2a78b35b34ec
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
