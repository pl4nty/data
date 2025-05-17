-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\60fb3684410ed\1.luac 

-- params : ...
-- function num : 0
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = {}
if (this_sigattrlog[23]).matched then
  l_0_0.type = "BM_TP_IGNORE"
  l_0_0.block_usermode = (this_sigattrlog[23]).reg_block_usermode
  l_0_0.event = (this_sigattrlog[23]).utf8p1
else
  if (this_sigattrlog[24]).matched then
    l_0_0.type = "BM_TP_IGNORE"
    l_0_0.block_usermode = (this_sigattrlog[24]).reg_block_usermode
    l_0_0.event = (this_sigattrlog[24]).utf8p1
  else
    if (this_sigattrlog[25]).matched then
      l_0_0.type = "BM_TP_BLOCK"
      l_0_0.block_usermode = (this_sigattrlog[25]).reg_block_usermode
      l_0_0.event = (this_sigattrlog[25]).utf8p1
    else
      if (this_sigattrlog[26]).matched then
        l_0_0.type = "BM_TP_BLOCK"
        l_0_0.block_usermode = (this_sigattrlog[26]).reg_block_usermode
        l_0_0.event = (this_sigattrlog[26]).utf8p1
      end
    end
  end
end
if not next(l_0_0) then
  return mp.CLEAN
end
;
(bm.add_related_string)("EventInfo", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
add_parents()
reportSessionInformationInclusive()
local l_0_1 = {}
local l_0_2 = {}
-- DECOMPILER ERROR at PC92: No list found for R2 , SetList fails

local l_0_3 = {}
-- DECOMPILER ERROR at PC94: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC96: No list found for R3 , SetList fails

local l_0_4 = {}
-- DECOMPILER ERROR at PC98: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC100: No list found for R4 , SetList fails

local l_0_5 = {}
-- DECOMPILER ERROR at PC102: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC104: No list found for R5 , SetList fails

local l_0_6 = {}
-- DECOMPILER ERROR at PC106: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC108: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC109: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC111: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC120: Overwrote pending register: R7 in 'AssignReg'

if l_0_3 then
  return ("Windows Defender Advanced Threat Protection").CLEAN
end
-- DECOMPILER ERROR at PC124: Overwrote pending register: R8 in 'AssignReg'

local l_0_7 = reportRelevantUntrustedEntitiesForPid("")
if l_0_7 and next(l_0_7) then
  (bm.add_related_string)("HasUntrustedEntities", "true", bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("UntrustedEntities", safeJsonSerialize(l_0_7), bm.RelatedStringBMReport)
end
local l_0_8 = (bm.get_current_process_startup_info)()
if not l_0_8 or not l_0_8.ppid then
  return mp.CLEAN
end
local l_0_9 = (bm.get_imagepath)()
local l_0_10 = l_0_9:match("([^\\]+)$")
local l_0_11, l_0_12 = hasSeenBefore(l_0_10, l_0_0.event, 7, "TamperingAttemptInMachine")
if not l_0_11 or l_0_12 < 3 then
  local l_0_13 = 7200
  local l_0_14 = 1000
  local l_0_15 = "TamperingAlerts_TPAggr_G"
  local l_0_16 = l_0_10 .. "_" .. l_0_0.event
  do
    local l_0_17, l_0_18, l_0_19 = l_0_0.type == "BM_TP_BLOCK" and 10 or 5
    -- DECOMPILER ERROR at PC193: Confused about usage of register: R17 in 'UnsetPending'

    AppendToRollingQueue(l_0_15, l_0_16, l_0_17, l_0_13, l_0_14)
    local l_0_20 = nil
    do
      if GetRollingQueueSumOfValues(l_0_15) >= 15 then
        local l_0_21 = nil
        ;
        (bm.add_related_string)("Alerts", safeJsonSerialize(GetRollingQueue(l_0_15)), bm.RelatedStringBMReport)
        ;
        (bm.add_related_string)("Score", l_0_21, bm.RelatedStringBMReport)
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

