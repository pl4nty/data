-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\449b305afe467\1_luac 

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
-- DECOMPILER ERROR at PC42: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC43: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC44: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC45: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC47: Overwrote pending register: R6 in 'AssignReg'

l_0_3 = l_0_3(l_0_4, l_0_0.ppid, ("Microsoft\\Windows Defender Advanced Threat Protection\\").WTSIsRemoteSession)
-- DECOMPILER ERROR at PC50: Overwrote pending register: R2 in 'AssignReg'

_ = l_0_3
if not l_0_2 then
  l_0_3 = mp
  l_0_3 = l_0_3.CLEAN
  return l_0_3
end
-- DECOMPILER ERROR at PC57: Overwrote pending register: R4 in 'AssignReg'

l_0_3 = nil
if (this_sigattrlog[12]).matched then
  l_0_3 = (this_sigattrlog[12]).utf8p1
  -- DECOMPILER ERROR at PC74: Overwrote pending register: R4 in 'AssignReg'

end
if ((this_sigattrlog[12]).utf8p2 == "THREAT" and 10) or (this_sigattrlog[13]).matched then
  l_0_3 = (this_sigattrlog[13]).utf8p1
  -- DECOMPILER ERROR at PC91: Overwrote pending register: R4 in 'AssignReg'

end
if ((this_sigattrlog[13]).utf8p2 == "THREAT" and 10) or (this_sigattrlog[14]).matched then
  l_0_3 = (this_sigattrlog[14]).utf8p1
  -- DECOMPILER ERROR at PC108: Overwrote pending register: R4 in 'AssignReg'

end
if ((this_sigattrlog[14]).utf8p2 == "THREAT" and 10) or (this_sigattrlog[15]).matched then
  l_0_3 = (this_sigattrlog[15]).utf8p2
  l_0_3 = l_0_3:match("name=(.*);.*")
  -- DECOMPILER ERROR at PC121: Overwrote pending register: R4 in 'AssignReg'

end
if (this_sigattrlog[16]).matched then
  l_0_3 = (this_sigattrlog[16]).utf8p2
  l_0_3 = l_0_3:match("name=(.*);.*")
  -- DECOMPILER ERROR at PC134: Overwrote pending register: R4 in 'AssignReg'

end
if (this_sigattrlog[17]).matched then
  l_0_3 = (this_sigattrlog[17]).utf8p1
  -- DECOMPILER ERROR at PC151: Overwrote pending register: R4 in 'AssignReg'

end
if (this_sigattrlog[17]).utf8p2 ~= "INFECTED" or not 10 then
  local l_0_5 = (MpCommon.QuerySessionInformation)(l_0_0.ppid, MpCommon.WTSUserName)
  local l_0_6 = (bm.get_imagepath)()
  local l_0_7 = l_0_6:match("([^\\]+)$")
  local l_0_8 = l_0_7 .. "_" .. tostring(l_0_5)
  local l_0_9, l_0_10 = hasSeenBefore(l_0_8, l_0_3, 7, "RemoteTamperingAttemptInMachine")
  if not l_0_9 or l_0_10 < 3 then
    local l_0_11 = 7200
    local l_0_12 = 1000
    local l_0_13 = "TamperingAlerts_Remote"
    AppendToRollingQueue(l_0_13, l_0_7 .. "_" .. l_0_3, R17_PC192, l_0_11, l_0_12)
    local l_0_14 = GetRollingQueueSumOfValues(l_0_13)
    if l_0_14 >= 15 then
      local l_0_15 = GetRollingQueue(l_0_13)
      ;
      (bm.add_related_string)(R17_PC192, safeJsonSerialize(l_0_15), bm.RelatedStringBMReport)
      reportSessionInformationInclusive()
      add_parents()
      return mp.INFECTED
    end
  end
  do
    return mp.CLEAN
  end
end

