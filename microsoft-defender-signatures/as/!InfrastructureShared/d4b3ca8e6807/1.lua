-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d4b3ca8e6807\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0["0d5a49d5-57c7-40c0-ab8b-3a066e83b05a"] = true
l_0_0["64eacc49-6a31-42c6-9b39-c3d9148e65f4"] = true
if not l_0_0[(string.lower)((versioning.GetOrgID)() or "")] then
  return mp.CLEAN
end
local l_0_1 = "PrintProcessor"
local l_0_2 = (string.match)((this_sigattrlog[2]).utf8p1 or "", "%\\([^%\\]+)%\\%\\")
local l_0_3 = (this_sigattrlog[2]).utf8p2
if isnull(l_0_2) or isnull(l_0_3) then
  return mp.CLEAN
end
do
  if not (string.find)(l_0_3, "\\", 1, true) or not l_0_3 then
    local l_0_5, l_0_6 = (string.format)("C:\\Windows\\System32\\spool\\prtprocs\\x64\\%s", l_0_3)
  end
  -- DECOMPILER ERROR at PC65: Confused about usage of register: R4 in 'UnsetPending'

  local l_0_7 = nil
  if isnull(GetRollingQueueKeyValue("SuspiciousDLL.PrtProc.Exports", (string.lower)(l_0_5))) then
    return mp.CLEAN
  end
  local l_0_8, l_0_9, l_0_10 = , (string.match)(GetRollingQueueKeyValue("SuspiciousDLL.PrtProc.Exports", (string.lower)(l_0_5)), "Count=(%d+)_List=(.+)_MissingReq=(%d+)")
  if not l_0_9 or not l_0_10 or not "Count=(%d+)_List=(.+)_MissingReq=(%d+)" or tonumber(l_0_9) == 0 or tonumber(R10_PC94) == 0 then
    return mp.CLEAN
  end
  ;
  (bm.add_threat_file)(R10_PC94)
  local l_0_11 = nil
  -- DECOMPILER ERROR at PC106: Overwrote pending register: R10 in 'AssignReg'

  local l_0_12 = bm.add_related_string
  local l_0_13 = R10_PC94
  local l_0_14 = safeJsonSerialize
  do
    l_0_14 = l_0_14({DriverName = l_0_2, DriverFile = l_0_3, DriverPath = l_0_7, ExpCount = l_0_9 or -1, ExpList = l_0_10 or "?", ExpMissing = l_0_11 or -1})
    l_0_12(l_0_13, l_0_14, bm.RelatedStringBMReport)
    l_0_12 = bm
    l_0_12 = l_0_12.get_current_process_startup_info
    l_0_12 = l_0_12()
    -- DECOMPILER ERROR at PC133: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC136: Overwrote pending register: R10 in 'AssignReg'

    if l_0_12 and l_0_13 then
      l_0_14 = l_0_12.ppid
      l_0_13(l_0_14, "T1547.012", "persist_printprocessor_driver")
    end
    -- DECOMPILER ERROR at PC141: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC142: Overwrote pending register: R10 in 'AssignReg'

    do return l_0_13 end
    -- DECOMPILER ERROR at PC144: freeLocal<0 in 'ReleaseLocals'

  end
end

