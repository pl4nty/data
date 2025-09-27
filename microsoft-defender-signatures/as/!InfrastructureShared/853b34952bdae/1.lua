-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\853b34952bdae\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (versioning.GetMachineGuid)()
if l_0_1 and l_0_1:lower() == "136df845-438e-4214-ba56-aa31d0a2e1f4" then
  return mp.CLEAN
end
l_0_0 = (string.lower)((MpCommon.PathToWin32Path)(l_0_0))
if not (sysio.IsFileExists)(l_0_0) then
  return mp.CLEAN
end
local l_0_2 = (sysio.GetFileLastWriteTime)(l_0_0)
if not ((sysio.GetLastResult)()).Success or l_0_2 == 0 then
  return mp.CLEAN
end
l_0_2 = l_0_2 / 10000000 - 11644473600
local l_0_3 = (MpCommon.GetCurrentTimeT)()
if l_0_3 <= l_0_2 then
  return mp.CLEAN
end
local l_0_4 = (l_0_3 - (l_0_2)) / 60
if not l_0_4 <= 20160 then
  return mp.CLEAN
end
do
  local l_0_8 = nil
  ;
  (bm.request_SMS)(((bm.get_current_process_startup_info)()).ppid, "H")
  ;
  (bm.add_action)("SmsAsyncScanEvent", 1000)
  do return mp.INFECTED end
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

