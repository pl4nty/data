-- Threat: !InfrastructureShared
-- Name: 4fd72e8fe451
-- Type: 21

local l_0_0, l_0_1 = pcall(mp.GetParentProcInfo)
if l_0_1 and string.find(l_0_1.image_path:lower(), "solarwinds.businesslayerhost.exe", 1, true) then
  return mp.LOWFI
end
return mp.CLEAN
