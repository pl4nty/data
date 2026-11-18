-- Threat: !InfrastructureShared
-- Name: ae78ec929ff5
-- Type: 21

if peattributes.isexe and peattributes.x86_image and mp.getfilesize() > 1600000 then
  return mp.INFECTED
end
return mp.CLEAN
