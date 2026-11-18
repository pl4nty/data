-- Threat: !InfrastructureShared
-- Name: 1e784218815b
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
