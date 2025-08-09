-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d4b3ca8e6807\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "PrintProcessor"
local l_0_1 = (string.match)((this_sigattrlog[2]).utf8p1 or "", "%\\([^%\\]+)%\\%\\")
local l_0_2 = (this_sigattrlog[2]).utf8p2
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
do
  if not (string.find)(l_0_2, "\\", 1, true) or not l_0_2 then
    local l_0_4, l_0_5 = (string.format)("C:\\Windows\\System32\\spool\\prtprocs\\x64\\%s", l_0_2)
  end
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R3 in 'UnsetPending'

  local l_0_6 = nil
  if isnull(GetRollingQueueKeyValue("SuspiciousDLL.PrtProc.Exports", l_0_4)) then
    return mp.CLEAN
  end
  local l_0_7, l_0_8, l_0_9 = , (string.match)(GetRollingQueueKeyValue("SuspiciousDLL.PrtProc.Exports", l_0_4), "Count=(%d+)_List=(.+)_MissingReq=(%d+)")
  if not l_0_8 or not l_0_9 or not "Count=(%d+)_List=(.+)_MissingReq=(%d+)" or tonumber(l_0_8) == 0 or tonumber(R9_PC73) == 0 then
    return mp.CLEAN
  end
  local l_0_10 = nil
  local l_0_11 = bm.add_related_string
  local l_0_12 = R9_PC73
  local l_0_13 = safeJsonSerialize
  l_0_13 = l_0_13({DriverName = l_0_1, DriverFile = l_0_2, DriverPath = l_0_6, ExpCount = l_0_8, ExpList = l_0_9, ExpMissing = l_0_10})
  l_0_11(l_0_12, l_0_13, bm.RelatedStringBMReport)
  l_0_11 = bm
  l_0_11 = l_0_11.get_current_process_startup_info
  l_0_11 = l_0_11()
  -- DECOMPILER ERROR at PC99: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC102: Overwrote pending register: R9 in 'AssignReg'

  if l_0_11 and l_0_12 then
    l_0_13 = l_0_11.ppid
    l_0_12(l_0_13, "T1547.012", "persist_printprocessor_driver")
  end
  -- DECOMPILER ERROR at PC107: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC108: Overwrote pending register: R9 in 'AssignReg'

  return l_0_12
end

