-- Threat: !InfrastructureShared
-- Name: 9b78afb1a9ea
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
