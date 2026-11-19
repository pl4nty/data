-- Threat: !InfrastructureShared
-- Name: ad787049da0c
-- Type: 21

if peattributes.isexe and peattributes.x86_image and mp.getfilesize() > 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
