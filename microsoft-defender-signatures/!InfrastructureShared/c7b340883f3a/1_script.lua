-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c7b340883f3a\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil then
  l_0_0 = (string.lower)((MpCommon.PathToWin32Path)(l_0_0))
  local l_0_1 = StringSplit(l_0_0, "\\")
  if #l_0_1 < 7 or checkFileLastWriteTime(l_0_0, 120) then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM("BM", "T1562.001", "mptamper_amsi")
  return mp.INFECTED
end
do
  return mp.CLEAN
end

