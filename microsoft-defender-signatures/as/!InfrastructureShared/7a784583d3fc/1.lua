-- Threat: !InfrastructureShared
-- Name: 7a784583d3fc
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
