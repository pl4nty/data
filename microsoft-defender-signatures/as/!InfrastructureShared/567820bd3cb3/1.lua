-- Threat: !InfrastructureShared
-- Name: 567820bd3cb3
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
