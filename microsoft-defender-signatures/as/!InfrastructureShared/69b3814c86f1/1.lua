-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69b3814c86f1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "ExecutableNonTextSection"
;
(bm.add_related_string)((string.format)("%s_test", l_0_0), "match", bm.RelatedStringBMReport)
if not (this_sigattrlog[2]).matched or not (this_sigattrlog[3]).matched or not (this_sigattrlog[4]).matched then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.PathToWin32Path)((this_sigattrlog[2]).utf8p1)
local l_0_2 = (MpCommon.PathToWin32Path)((this_sigattrlog[3]).utf8p1)
local l_0_3 = (string.match)((this_sigattrlog[3]).utf8p2, "Fsize:(%d+)")
local l_0_4 = (MpCommon.PathToWin32Path)((this_sigattrlog[4]).utf8p1)
if isnull(l_0_1) or isnull(l_0_2) or isnull(l_0_3) or isnull(l_0_4) then
  local l_0_5 = bm.add_related_string
  local l_0_6 = (string.format)("%_test", l_0_0)
  local l_0_7 = string.format
  local l_0_8 = "first %s second %s proc %s size %s"
  l_0_7 = l_0_7(l_0_8, l_0_1 or "null", l_0_2 or "null", l_0_4 or "null", l_0_3 or "null")
  l_0_8 = bm
  l_0_8 = l_0_8.RelatedStringBMReport
  l_0_5(l_0_6, l_0_7, l_0_8)
  l_0_5 = mp
  l_0_5 = l_0_5.INFECTED
  return l_0_5
end
do
  -- DECOMPILER ERROR at PC105: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC110: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_13 = nil
  if isnull(GetRollingQueueKeyValue(l_0_0, l_0_1)) then
    return mp.CLEAN
  end
  for l_0_17 in (string.gmatch)(GetRollingQueueKeyValue(l_0_0, l_0_1), "([^,]+)") do
    local l_0_14, l_0_15, l_0_16, l_0_17 = , tonumber(l_0_3)
    -- DECOMPILER ERROR at PC128: Confused about usage of register: R9 in 'UnsetPending'

    -- DECOMPILER ERROR at PC148: Overwrote pending register: R13 in 'AssignReg'

    if not isnull((string.match)(l_0_1 or "null", "^(.-)_(%d+)$")) and not isnull(R13_PC138) and l_0_15 == tonumber(R13_PC138) then
      local l_0_22 = nil
      local l_0_23 = nil
      ;
      (bm.add_related_string)(R13_PC138, safeJsonSerialize({RQ = l_0_17 or "", SectionName = l_0_22, SectionSize = l_0_23, FirstP1 = (this_sigattrlog[2]).utf8p1 or "", FirstP2 = (this_sigattrlog[2]).utf8p2 or "", FirstPath = l_0_13, SecondP1 = (this_sigattrlog[3]).utf8p1 or "", SecondP2 = (this_sigattrlog[3]).utf8p2 or "", SecondPath = l_0_14, SecondSize = l_0_15, ProcP1 = (this_sigattrlog[4]).utf8p1 or "", ProcP2 = (this_sigattrlog[4]).utf8p2 or "", ProcPath = l_0_16, FirstPPID = (this_sigattrlog[2]).ppid or "", SecondPPID = (this_sigattrlog[3]).ppid or "", ProcPPID = (this_sigattrlog[4]).ppid or ""}), bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  local l_0_25 = nil
  local l_0_26 = nil
  local l_0_27 = nil
  local l_0_28 = nil
  -- DECOMPILER ERROR at PC238: Confused about usage of register: R5 in 'UnsetPending'

  do
    ;
    (bm.add_related_string)(l_0_0, safeJsonSerialize({RQ = l_0_17 or "", SectionName = "No match", SectionSize = "No match", FirstP1 = (this_sigattrlog[2]).utf8p1 or "", FirstP2 = (this_sigattrlog[2]).utf8p2 or "", FirstPath = l_0_25, SecondP1 = (this_sigattrlog[3]).utf8p1 or "", SecondP2 = (this_sigattrlog[3]).utf8p2 or "", SecondPath = l_0_26, SecondSize = l_0_27, ProcP1 = (this_sigattrlog[4]).utf8p1 or "", ProcP2 = (this_sigattrlog[4]).utf8p2 or "", ProcPath = l_0_28, FirstPPID = (this_sigattrlog[2]).ppid, SecondPPID = (this_sigattrlog[3]).ppid, ProcPPID = (this_sigattrlog[4]).ppid}), bm.RelatedStringBMReport)
    do return mp.INFECTED end
    -- DECOMPILER ERROR at PC309: freeLocal<0 in 'ReleaseLocals'

  end
end

