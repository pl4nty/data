-- Threat: !InfrastructureShared
-- Name: b978e2d77cdc
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
