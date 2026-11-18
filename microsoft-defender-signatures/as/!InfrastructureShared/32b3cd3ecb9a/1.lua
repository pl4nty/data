-- Threat: !InfrastructureShared
-- Name: 32b3cd3ecb9a
-- Type: 21
-- Includes: PeParser

local l_0_0 = bm.get_imagepath()
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
local l_0_1 = sysio.GetPEVersionInfo(l_0_0)
if not l_0_1 or not l_0_1.OriginalFilename then
  return mp.CLEAN
end
if string.lower(l_0_1.OriginalFilename) ~= "werfaultsecure.exe" then
  return mp.CLEAN
end
local l_0_2 = sysio.GetPEFixedVersionInfo(l_0_0)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = crypto.shr64(l_0_2.FileVersion, 48)
if 10 <= l_0_3 then
  return mp.CLEAN
end
bm.add_related_string("OriginalFileName_PeParser", Version_to_str(l_0_2.FileVersion), bm.RelatedStringBMReport)
return mp.INFECTED
