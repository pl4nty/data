-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4ebb30b0329c1\1.luac 

-- params : ...
-- function num : 0
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = {}
local l_0_2 = {}
-- DECOMPILER ERROR at PC22: No list found for R2 , SetList fails

local l_0_3 = {}
-- DECOMPILER ERROR at PC24: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC26: No list found for R3 , SetList fails

local l_0_4 = {}
-- DECOMPILER ERROR at PC28: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC30: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC31: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC35: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC39: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC40: Overwrote pending register: R2 in 'AssignReg'

if l_0_2 == true then
  return l_0_2
end
-- DECOMPILER ERROR at PC42: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC42: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC43: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC44: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC45: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC48: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC49: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC50: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC51: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC52: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC53: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC56: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC59: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC60: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC61: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC62: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC65: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC66: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC67: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC68: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC69: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC70: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC73: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC76: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC77: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC78: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC79: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC82: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC83: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC84: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC85: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC86: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC87: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC90: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC93: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC94: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC95: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC96: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC99: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC100: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC101: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC102: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC103: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC104: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC104: Unhandled construct in 'MakeBoolean' P3

if not l_0_4 or ((((l_0_4 == "THREAT" and l_0_4) or l_0_4) and l_0_4 == "THREAT" and not l_0_4) or l_0_4 ~= "THREAT" or l_0_4) then
  l_0_4 = l_0_4(l_0_2, "Microsoft\\Windows Defender Advanced Threat Protection\\")
  -- DECOMPILER ERROR at PC105: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC106: Overwrote pending register: R3 in 'AssignReg'

end
l_0_4 = this_sigattrlog
l_0_4 = l_0_4[16]
l_0_4 = l_0_4.matched
if l_0_4 then
  l_0_4 = this_sigattrlog
  l_0_4 = l_0_4[16]
  -- DECOMPILER ERROR at PC114: Overwrote pending register: R2 in 'AssignReg'

  l_0_4 = l_0_4(l_0_2, "name=(.*);.*")
  -- DECOMPILER ERROR at PC118: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC119: Overwrote pending register: R3 in 'AssignReg'

end
l_0_4 = this_sigattrlog
l_0_4 = l_0_4[17]
l_0_4 = l_0_4.matched
if l_0_4 then
  l_0_4 = this_sigattrlog
  l_0_4 = l_0_4[17]
  -- DECOMPILER ERROR at PC127: Overwrote pending register: R2 in 'AssignReg'

  l_0_4 = l_0_4(l_0_2, "name=(.*);.*")
  -- DECOMPILER ERROR at PC131: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC132: Overwrote pending register: R3 in 'AssignReg'

end
l_0_4 = this_sigattrlog
l_0_4 = l_0_4[18]
l_0_4 = l_0_4.matched
if l_0_4 then
  l_0_4 = this_sigattrlog
  l_0_4 = l_0_4[18]
  -- DECOMPILER ERROR at PC140: Overwrote pending register: R2 in 'AssignReg'

  l_0_4 = l_0_4(l_0_2, "name=(.*);.*")
  -- DECOMPILER ERROR at PC144: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC145: Overwrote pending register: R3 in 'AssignReg'

end
l_0_4 = this_sigattrlog
l_0_4 = l_0_4[19]
l_0_4 = l_0_4.matched
if l_0_4 then
  l_0_4 = this_sigattrlog
  l_0_4 = l_0_4[19]
  -- DECOMPILER ERROR at PC153: Overwrote pending register: R2 in 'AssignReg'

  l_0_4 = this_sigattrlog
  l_0_4 = l_0_4[19]
  l_0_4 = l_0_4.utf8p2
  if l_0_4 == "INFECTED" then
    l_0_4 = 10
  end
  -- DECOMPILER ERROR at PC162: Overwrote pending register: R3 in 'AssignReg'

end
if not l_0_4 then
  l_0_4 = false
  l_0_4 = (MpCommon.StringRegExpSearch)("(Block|RTP|GpDisable|Srv)", l_0_2)
  if not l_0_4 then
    return mp.CLEAN
  end
  local l_0_5 = 7200
  local l_0_6 = 100
  local l_0_7 = (bm.get_imagepath)()
  local l_0_8 = l_0_7:match("([^\\]+)$")
  local l_0_9, l_0_10 = hasSeenBefore(l_0_8, l_0_2, 7, "TamperingAttemptInMachine")
  if not l_0_9 or l_0_10 < 3 then
    AppendToRollingQueue("TamperingAlerts", l_0_8 .. "_" .. l_0_2, l_0_3, l_0_5, l_0_6)
  end
  local l_0_11 = (MpCommon.EnumThreatHistory)("HackTool", 600, (crypto.bitor)(MpCommon.THREAT_HISTORY_CATEGORY_ASR, MpCommon.THREAT_HISTORY_CATEGORY_NP))
  if #l_0_11 > 0 or GetRollingQueueCount("ThreatsOnMachine_Lua") > 0 or GetRollingQueueSumOfValues("TamperingAlerts") >= 15 then
    local l_0_12 = GetRollingQueue("TamperingAlerts")
    local l_0_13 = GetRollingQueue("ThreatsOnMachine_Lua")
    ;
    (bm.add_related_string)("HackToolsSeenOnDevice_Lua", safeJsonSerialize(l_0_13), bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("HackToolsSeenOnDevice", safeJsonSerialize(l_0_11), bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("TamperingAlertsOnDevice", safeJsonSerialize(l_0_12), bm.RelatedStringBMReport)
    add_parents()
    return mp.INFECTED
  end
  do
    return mp.CLEAN
  end
end

