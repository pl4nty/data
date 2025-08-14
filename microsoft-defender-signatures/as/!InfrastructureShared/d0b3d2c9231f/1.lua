-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d0b3d2c9231f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "PrintProcessor"
local l_0_1 = (string.match)((this_sigattrlog[3]).utf8p1 or "", "%\\([^%\\]+)%\\%\\")
local l_0_2 = (this_sigattrlog[3]).utf8p2
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
do
  if not (string.find)(l_0_2, "\\", 1, true) or not l_0_2 then
    local l_0_4, l_0_5 = (string.format)("C:\\Windows\\System32\\spool\\prtprocs\\x64\\%s", l_0_2)
  end
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R3 in 'UnsetPending'

  local l_0_6 = nil
  if isnull(GetRollingQueueKeyValue("SuspiciousDLL.PrtProc.Exports", (string.lower)(l_0_4))) then
    return mp.CLEAN
  end
  local l_0_7 = nil
  local l_0_9 = (string.match)(l_0_7 or "", "Count=(%d+)_List=(.+)_MissingReq=(%d+)")
  if not l_0_9 or not l_0_7 or "" or not "Count=(%d+)_List=(.+)_MissingReq=(%d+)" or tonumber(l_0_9) == 0 then
    return mp.CLEAN
  end
  ;
  (bm.add_related_file)(l_0_6)
  local l_0_10 = nil
  local l_0_11 = nil
  local l_0_12 = bm.add_related_string
  local l_0_13 = l_0_0
  do
    l_0_12(l_0_13, safeJsonSerialize({DriverName = l_0_1, DriverFile = l_0_2, DriverPath = l_0_6, ExpCount = l_0_9 or -1, ExpList = l_0_10 or "?", ExpMissing = l_0_11 or -1}), bm.RelatedStringBMReport)
    l_0_12 = bm
    l_0_12 = l_0_12.get_current_process_startup_info
    l_0_12 = l_0_12()
    if l_0_12 then
      l_0_13 = l_0_12.ppid
      if l_0_13 then
        l_0_13 = TrackPidAndTechniqueBM
        l_0_13(l_0_12.ppid, "T1547.012", "persist_printprocessor_driver")
      end
    end
    l_0_13 = mp
    l_0_13 = l_0_13.INFECTED
    do return l_0_13 end
    -- DECOMPILER ERROR at PC123: freeLocal<0 in 'ReleaseLocals'

  end
end

