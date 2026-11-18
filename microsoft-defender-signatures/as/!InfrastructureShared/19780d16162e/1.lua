-- Threat: !InfrastructureShared
-- Name: 19780d16162e
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
