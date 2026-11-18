-- Threat: !InfrastructureShared
-- Name: 5878cd75457b
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true and mp.getfilesize() > 500000 then
  return mp.INFECTED
end
return mp.CLEAN
