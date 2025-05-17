-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\106b3e9ebf321\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[6]).matched then
  l_0_3 = (this_sigattrlog[6]).utf8p1
end
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = nil
if (this_sigattrlog[7]).matched then
  l_0_4 = (this_sigattrlog[7]).utf8p2
end
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
if not (string.find)(l_0_4, l_0_3, 1, true) then
  return mp.CLEAN
end
local l_0_5 = (MpCommon.GetCurrentTimeT)()
local l_0_6 = (sysio.GetFileLastWriteTime)(l_0_3)
if ((sysio.GetLastResult)()).Success and l_0_6 and l_0_6 ~= 0 then
  l_0_6 = l_0_6 / 10000000 - 11644473600
end
local l_0_7 = l_0_5 - (l_0_6)
if l_0_7 <= 0 then
  return mp.CLEAN
end
local l_0_8 = l_0_7 / 3600
if l_0_8 > 4 then
  TrackPidAndTechniqueBM("BM", "T1070", "DefenseEvasion_IndicatorRemoval_GetFileLastWriteTime")
  return mp.INFECTED
end
return mp.CLEAN

