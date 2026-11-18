-- Threat: !InfrastructureShared
-- Name: 1f9783b2c4626
-- Type: 21

if peattributes.isexe and peattributes.x86_image and pesecs[1].Name == "   " then
  return mp.INFECTED
end
return mp.CLEAN
