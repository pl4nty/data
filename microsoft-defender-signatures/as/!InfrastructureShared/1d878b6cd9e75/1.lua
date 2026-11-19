-- Threat: !InfrastructureShared
-- Name: 1d878b6cd9e75
-- Type: 21

if pevars.epsec == 1 and pesecs[pevars.epsec].Name == ".text" and pesecs[2].Name == ".data" and pesecs[3].Name == ".rsrc" and peattributes.no_decription and peattributes.suspicious_image_version then
  return mp.INFECTED
end
return mp.CLEAN
