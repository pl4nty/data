-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\aab39b967e1b\0x000006f5_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil then
  l_0_0 = (string.lower)((MpCommon.PathToWin32Path)(l_0_0))
  if #StringSplit(l_0_0, "\\") > 7 and checkFileLastWriteTime(l_0_0, 120) == false then
    return mp.INFECTED
  end
end
return mp.CLEAN

