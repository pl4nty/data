-- Threat: !InfrastructureShared
-- Name: 85782f9858e0
-- Type: 21

if peattributes.isexe and peattributes.x86_image and pesecs[1].Name == "   " then
  return mp.INFECTED
end
return mp.CLEAN
