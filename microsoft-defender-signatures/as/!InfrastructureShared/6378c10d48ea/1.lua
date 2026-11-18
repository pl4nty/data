-- Threat: !InfrastructureShared
-- Name: 6378c10d48ea
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
