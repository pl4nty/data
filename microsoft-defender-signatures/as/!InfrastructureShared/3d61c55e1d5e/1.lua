-- Threat: !InfrastructureShared
-- Name: 3d61c55e1d5e
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
