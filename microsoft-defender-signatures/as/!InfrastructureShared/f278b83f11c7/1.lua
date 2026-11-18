-- Threat: !InfrastructureShared
-- Name: f278b83f11c7
-- Type: 21

if (hstrlog[1].matched or hstrlog[2].matched) and (hstrlog[3].matched or hstrlog[4].matched) and pevars.epsec == 1 and pesecs[pevars.epsec].Name == ".text" and pesecs[2].Name == ".data" and pesecs[3].Name == ".rsrc" and peattributes.no_decription and peattributes.suspicious_image_version then
  return mp.INFECTED
end
return mp.CLEAN
