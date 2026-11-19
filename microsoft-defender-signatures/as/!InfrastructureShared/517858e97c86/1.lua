-- Threat: !InfrastructureShared
-- Name: 517858e97c86
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
