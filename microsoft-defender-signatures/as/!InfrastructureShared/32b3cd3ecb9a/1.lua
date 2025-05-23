-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3cd3ecb9a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = (MpCommon.PathToWin32Path)(l_0_0)
local l_0_1 = (sysio.GetPEVersionInfo)(l_0_0)
if not l_0_1 or not l_0_1.OriginalFilename then
  return mp.CLEAN
end
if (string.lower)(l_0_1.OriginalFilename) ~= "werfaultsecure.exe" then
  return mp.CLEAN
end
local l_0_2 = (sysio.GetPEFixedVersionInfo)(l_0_0)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = (crypto.shr64)(l_0_2.FileVersion, 48)
if l_0_3 >= 10 then
  return mp.CLEAN
end
;
(bm.add_related_string)("OriginalFileName_PeParser", Version_to_str(l_0_2.FileVersion), bm.RelatedStringBMReport)
return mp.INFECTED

