-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\153b3a43f86da\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.PathToWin32Path)((bm.get_imagepath)())
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if checkFileLastWriteTime(l_0_0, 120) ~= false then
  return mp.CLEAN
end
if (mp.IsKnownFriendlyFile)(l_0_0, true, false) == true then
  return mp.CLEAN
end
return mp.INFECTED

