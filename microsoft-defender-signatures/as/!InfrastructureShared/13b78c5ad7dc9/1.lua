-- Threat: !InfrastructureShared
-- Name: 13b78c5ad7dc9
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
