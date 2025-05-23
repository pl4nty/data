-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6eb3af2b0e43\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil then
  l_0_0 = (string.lower)((MpCommon.PathToWin32Path)(l_0_0))
  if #StringSplit(l_0_0, "\\") < 7 or checkFileLastWriteTime(l_0_0, 120) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN

