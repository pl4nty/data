-- Threat: !InfrastructureShared
-- Name: 5b78f12e4ccb
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
