-- Threat: !InfrastructureShared
-- Name: 2e7828f048d6
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
