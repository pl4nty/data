-- Threat: !InfrastructureShared
-- Name: TechniqueTracker
-- Type: 1
-- Includes: LuaFuncHelper, ResearchData, Path

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local function r0_0(p1_0, p1_1)
  local r1_0, r1_1 = IsTacticObservedGlobal(p1_0, true)
  local r1_2 = 1
  if r1_0 then
    r1_2 = tonumber(r1_1) + r1_2
  end
  AppendToRollingQueue("gTacticsTable", p1_0, r1_2, p1_1, 100, 1)
end

local function r0_1()
  local r2_0, r2_1 = pcall(MpCommon.RollingQueueCount, "gTechniquesTable")
  if r2_0 and r2_1 ~= nil then
    return r2_1
  end
  return 0
end

local function r0_2()
  local r3_0, r3_1 = pcall(MpCommon.RollingQueueCount, "gTacticsTable")
  if r3_0 and r3_1 ~= nil then
    return r3_1
  end
  return 0
end

local function r0_3(p4_0)
  if p4_0 == nil then
    return nil
  end
  local r4_0 = nil
  local r4_1 = p4_0:lower()
  if r4_1 == "cmdhstr" then
    r4_0 = mp.GetScannedPPID()
  elseif r4_1 == "bm" then
    local r4_2, r4_3 = pcall(bm.get_current_process_startup_info)
    if r4_2 and r4_3 ~= nil then
      r4_0 = r4_3.ppid
    end
  elseif r4_1 == "amsi" then
    local r4_4, r4_5 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
    if r4_4 and r4_5 ~= nil then
      r4_0 = r4_5
    end
  elseif r4_1 == "rtp" then
    local r4_6, r4_7 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_PROCESS_ID)
    if r4_6 and r4_7 ~= nil then
      r4_0 = r4_7
    end
  end
  return r4_0
end

local function r0_4(p5_0)
  if p5_0 == nil or not (type(p5_0) == "string" and not (#p5_0 <= 0)) then
    return
  end
  local r5_0 = string.lower(string.format("0x%02X_0x%02X", mp.crc32(-1, p5_0, 1, #p5_0),
      tostring(#p5_0)))
  if r5_0 == nil or #r5_0 <= 10 then
    return
  end
  return r5_0
end

local function r0_5(p6_0, p6_1, p6_2)
  if p6_0 ~= nil and p6_0 ~= "" and p6_1 ~= nil and p6_1 ~= "" then
    p6_0 = GetRealPidForScenario(p6_0)
    p6_2 = p6_2 or false
    return IsKeyInRollingQueue("InheritedTech-" .. p6_0, p6_1, p6_2)
  end
  return false, nil
end

local function r0_6(p7_0, p7_1, p7_2)
  if p7_0 ~= nil and p7_0 ~= "" and p7_1 ~= nil and p7_1 ~= "" then
    p7_0 = GetRealPidForScenario(p7_0)
    p7_2 = p7_2 or false
    return IsKeyInRollingQueue("InheritedTact-" .. p7_0, p7_1, p7_2)
  end
  return false, nil
end

local function r0_7(p8_0, p8_1, p8_2, p8_3)
  local function r8_0(p9_0)
    if p9_0 == nil or #p9_0 <= 3 then
      return
    end
    local r9_0 = string.lower(p9_0)
    local r9_1 = "bm_m"
    if string.sub(r9_0, 1, 1) == "t" then
      return p9_0
    end
    if string.sub(r9_0, 1, #r9_1) ~= r9_1 then
      return
    end
    return string.sub(p9_0, #r9_1 + 1, #p9_0)
  end

  if p8_0 == nil or type(p8_0) ~= "string" or #p8_0 <= 1 or p8_1 == nil then
    return
  end
  p8_2 = p8_2 == nil and 0 or p8_2
  local r8_1 = p8_3 == nil and "CommandLineCustomHash" or p8_3
  local r8_2 = getCustomStringHash(p8_0)
  if r8_2 == nil then
    return
  end
  local r8_3 = r8_1 .. ":" .. r8_2
  local r8_4 = false
  if type(p8_1) == "string" then
    local r8_5 = r8_0(p8_1)
    if r8_5 ~= nil then
      MpCommon.AppendPersistContextNoPath(r8_3, r8_5, p8_2)
      r8_4 = true
    end
  elseif type(p8_1) == "table" then
    for r8_6, r8_7 in ipairs(p8_1) do
      local r8_8 = r8_0(r8_7)
      if r8_8 ~= nil then
        MpCommon.AppendPersistContextNoPath(r8_3, r8_8, p8_2)
        r8_4 = true
      end
    end
  end
  return r8_4
end

local function r0_8(p10_0)
  if p10_0 == nil or #p10_0 <= 1 then
    return
  end
  local r10_0 = {
    cmd = "%windir%\\system32\\cmd.exe",
    powershell = "%windir%\\system32\\windowspowershell\\v1.0\\powershell.exe",
    wscript = "%windir%\\system32\\wscript.exe", cscript = "%windir%\\system32\\cscript.exe",
    mshta = "%windir%\\system32\\mshta.exe", wmic = "%windir%\\system32\\wbem\\wmic.exe",
    bitsadmin = "%windir%\\system32\\bitsadmin.exe", rundll32 = "%windir%\\system32\\rundll32.exe",
    svchost = "%windir%\\system32\\svchost.exe", services = "%windir%\\system32\\services.exe",
    reg = "%windir%\\system32\\reg.exe", regsvr32 = "%windir%\\system32\\regsvr32.exe",
    regedit = "%windir%\\regedit.exe", schtasks = "%windir%\\system32\\schtasks.exe",
    ["%comspec%"] = "%windir%\\system32\\cmd.exe"
  }
  if #p10_0 > 4 and string.sub(p10_0, -4) == ".exe" then
    p10_0 = string.sub(p10_0, 1, #p10_0 - 4)
  end
  p10_0 = string.lower(p10_0)
  local r10_1 = r10_0[p10_0]
  if r10_1 ~= nil then
    r10_1 = mp.ContextualExpandEnvironmentVariables(r10_1)
  end
  return r10_1
end

local function r0_9(p11_0, p11_1)
  if p11_0 == nil then
    return
  end
  local r11_0 = p11_1 == nil and "CommandLineCustomHash" or p11_1
  local r11_1 = getCustomStringHash(p11_0)
  if r11_1 == nil then
    return
  end
  local r11_2 = r11_0 .. ":" .. r11_1
  if not (MpCommon.GetPersistContextCountNoPath(r11_2) >= 1) then
    return
  end
  return MpCommon.GetPersistContextNoPath(r11_2)
end

local function r0_10(p12_0, p12_1, p12_2, p12_3)
  if p12_0 == nil or p12_0 == "" or p12_1 == nil or p12_1 == "" or p12_2 == nil or p12_2 == "" then
    return
  end
  p12_3 = p12_3 or 3600
  p12_0 = GetRealPidForScenario(p12_0)
  local r12_0, r12_1 = r0_5(p12_0, p12_2)
  if r12_0 then
    r12_1 = r12_1 .. "," .. p12_1
  else
    r12_1 = p12_1
  end
  AppendToRollingQueue("InheritedTech-" .. p12_0, p12_2, r12_1, p12_3)
end

local function r0_11(p13_0, p13_1, p13_2, p13_3)
  if p13_0 == nil or p13_0 == "" or p13_1 == nil or p13_1 == "" or p13_2 == nil or p13_2 == "" then
    return
  end
  p13_3 = p13_3 or 3600
  p13_0 = GetRealPidForScenario(p13_0)
  local r13_0, r13_1 = r0_6(p13_0, p13_2)
  if r13_0 then
    r13_1 = r13_1 .. "," .. p13_1
  else
    r13_1 = p13_1
  end
  AppendToRollingQueue("InheritedTact-" .. p13_0, p13_2, r13_1, p13_3)
end

local function r0_12(p14_0)
  if p14_0 ~= nil
    and not (#p14_0 <= 4)
    and string.sub(p14_0, 1, 2) ~= "\\\\"
    and string.sub(p14_0, 2, 3) ~= ":\\"
    and string.find(p14_0, " ", 1, true) ~= nil then
    local r14_0 = string.match(p14_0, "^(.-)%s")
    if r14_0 == nil then
      return p14_0, false
    end
    local r14_1 = r0_8(r14_0)
    if r14_1 == nil then
      return p14_0, false
    end
    local r14_2 = r14_1 .. string.sub(p14_0, #r14_0 + 1, #p14_0)
    return r14_2, true
  end
  return p14_0, false
end

local function r0_13(p15_0, p15_1, p15_2, p15_3, p15_4, p15_5)
  if not (type(p15_2) == "number"
    and not (p15_2 <= 0)
    and not (p15_2 > 15)
    and p15_0 ~= nil
    and p15_0 ~= ""
    and p15_1 ~= nil
    and p15_1 ~= ""
    and (p15_3 == nil or type(p15_3) == "table")) then
    return
  end
  if p15_5 == nil then
    p15_5 = p15_0
  end
  local r15_0 = mp.GetParentProcInfo(p15_0)
  if r15_0 == nil or r15_0.image_path == nil then
    return
  end
  if p15_3 ~= nil then
    for r15_1, r15_2 in ipairs(p15_3) do
      if string.find(r15_0.image_path, r15_2, 1, true) then
        return
      end
    end
  end
  r0_10(r15_0.ppid, p15_5, p15_1, p15_4)
  r0_13(r15_0.ppid, p15_1, p15_2 - 1, p15_3, p15_4, p15_5)
end

local function r0_14(p16_0, p16_1, p16_2, p16_3, p16_4, p16_5)
  if not (type(p16_2) == "number"
    and not (p16_2 <= 0)
    and not (p16_2 > 15)
    and p16_0 ~= nil
    and p16_0 ~= ""
    and p16_1 ~= nil
    and p16_1 ~= ""
    and (p16_3 == nil or type(p16_3) == "table")) then
    return
  end
  if p16_5 == nil then
    p16_5 = p16_0
  end
  local r16_0 = mp.GetParentProcInfo(p16_0)
  if r16_0 == nil or r16_0.image_path == nil then
    return
  end
  if p16_3 ~= nil then
    for r16_1, r16_2 in ipairs(p16_3) do
      if string.find(r16_0.image_path, r16_2, 1, true) then
        return
      end
    end
  end
  r0_11(r16_0.ppid, p16_5, p16_1, p16_4)
  r0_14(r16_0.ppid, p16_1, p16_2 - 1, p16_3, p16_4, p16_5)
end

local function r0_15(p17_0, p17_1)
  local r17_0, r17_1 = 1024, 4
  if 32 < string.len(p17_0) then
    return false
  end
  return r17_1 <= string.len(p17_1) and string.len(p17_1) <= r17_0
end

local function r0_16(p18_0, p18_1)
  if p18_0 == nil then
    return false
  end
  p18_1 = p18_1 or false
  if p18_1 then
    local r18_0 = safeJsonSerialize(p18_0)
    if r18_0 ~= nil then
      bm.add_related_string("TTData", r18_0, bm.RelatedStringBMReport)
    end
  else
    for r18_1, r18_2 in pairs(p18_0) do
      local r18_3 = string.format("MpInternal_researchdata=%s=%s", r18_1, tostring(r18_2))
      mp.set_mpattribute(r18_3)
    end
  end
  return true
end

function StringEndsWith(p19_0, p19_1)
  return p19_1 == "" or string.sub(p19_0, -string.len(p19_1)) == p19_1
end

function StringStartsWith(p20_0, p20_1)
  return p20_1 == "" or string.sub(p20_0, 1, string.len(p20_1)) == p20_1
end

function StringSplit(p21_0, p21_1)
  p21_1 = p21_1 == nil and "%s" or p21_1
  local r21_0 = {}
  for r21_1 in string.gmatch(p21_0, "([^" .. p21_1 .. "]+)") do
    table.insert(r21_0, r21_1)
  end
  return r21_0
end

function AddTechniqueGlobal(p22_0, p22_1)
  local r22_0, r22_1 = IsTechniqueObservedGlobal(p22_0, true)
  local r22_2 = 1
  if r22_0 then
    r22_2 = tonumber(r22_1) + r22_2
  end
  AppendToRollingQueue("gTechniquesTable", p22_0, r22_2, p22_1, 100, 1)
end

function AddTechniqueForPid(p23_0, p23_1, p23_2)
  if p23_0 == nil or p23_0 == "" or p23_1 == nil or p23_1 == "" then
    return
  end
  p23_2 = p23_2 or 3600
  p23_0 = GetRealPidForScenario(p23_0)
  local r23_0, r23_1 = IsTechniqueObservedForPid(p23_0, p23_1)
  r23_1 = not r23_0 and 1 or r23_1 + 1
  AppendToRollingQueue("Tech-" .. p23_0, p23_1, r23_1, p23_2)
end

function AddTacticForPid(p24_0, p24_1, p24_2)
  if p24_0 == nil or p24_0 == "" or p24_1 == nil or p24_1 == "" then
    return
  end
  p24_2 = p24_2 or 3600
  p24_0 = GetRealPidForScenario(p24_0)
  local r24_0, r24_1 = IsTacticObservedForPid(p24_0, p24_1)
  r24_1 = not r24_0 and 1 or r24_1 + 1
  AppendToRollingQueue("Tact-" .. p24_0, p24_1, r24_1, p24_2)
end

local function r0_17(p25_0, p25_1)
  p25_0 = GetRealPidForScenario(p25_0)
  AppendToRollingQueue("gPidsTable", p25_0, 1, p25_1, 500, 1)
end

function GetRealPidForScenario(p26_0)
  if p26_0 == nil then
    return p26_0, p26_0
  end
  if p26_0:match("pid:.+,ProcessStart:.+") then
    return p26_0, p26_0
  end
  local r26_0 = nil
  if p26_0 == "CMDHSTR" then
    local r26_1, r26_2 = pcall(mp.GetParentProcInfo)
    if r26_1 and r26_2 ~= nil then
      r26_0 = r26_2.ppid
    else
      r26_0 = mp.GetScannedPPID()
    end
  elseif p26_0 == "BM" then
    local r26_3, r26_4 = pcall(bm.get_current_process_startup_info)
    if r26_3 and r26_4 ~= nil then
      r26_0 = r26_4.ppid
    end
  elseif p26_0 == "AMSI" then
    local r26_5, r26_6 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
    if r26_5 and r26_6 ~= nil then
      r26_0 = r26_6
    end
  elseif p26_0 == "RTP" then
    local r26_7, r26_8 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_PROCESS_PPID)
    if r26_7 and r26_8 ~= nil then
      r26_0 = r26_8
    end
  end
  local r26_9 = r26_0
  if r26_9 == nil then
    r26_9 = p26_0
  end
  local r26_10 = p26_0
  return r26_9, r26_10
end

function GetTechniquesTableForPid(p27_0)
  p27_0 = GetRealPidForScenario(p27_0)
  return GetRollingQueueAsHashTable("Tech-" .. p27_0)
end

function GetTacticsTableForPid(p28_0)
  p28_0 = GetRealPidForScenario(p28_0)
  return GetRollingQueueAsHashTable("Tact-" .. p28_0)
end

function GetTacticsTableGlobal()
  return GetRollingQueueAsHashTable("gTacticsTable")
end

local function r0_18()
  local r30_0, r30_1 = pcall(MpCommon.RollingQueueCount, "gPidsTable")
  if r30_0 and r30_1 ~= nil then
    return r30_1
  end
  return 0
end

function GetTechniquesCountForPid(p31_0)
  p31_0 = GetRealPidForScenario(p31_0)
  local r31_0, r31_1 = pcall(MpCommon.RollingQueueCount, "Tech-" .. p31_0)
  if r31_0 and r31_1 ~= nil then
    return r31_1
  end
  return 0
end

function GetTacticsCountForPid(p32_0)
  p32_0 = GetRealPidForScenario(p32_0)
  local r32_0, r32_1 = pcall(MpCommon.RollingQueueCount, "Tact-" .. p32_0)
  if r32_0 and r32_1 ~= nil then
    return r32_1
  end
  return 0
end

function IsTechniqueObservedGlobal(p33_0, p33_1)
  p33_1 = p33_1 or false
  return IsKeyInRollingQueue("gTechniquesTable", p33_0, p33_1)
end

function IsTacticObservedGlobal(p34_0, p34_1)
  p34_1 = p34_1 or false
  return IsKeyInRollingQueue("gTacticsTable", p34_0, p34_1)
end

function IsPidObservedGlobal(p35_0)
  p35_0 = GetRealPidForScenario(p35_0)
  return IsKeyInRollingQueue("gPidsTable", p35_0, true)
end

function IsTechniqueObservedForPid(p36_0, p36_1, p36_2)
  if p36_0 ~= nil and p36_0 ~= "" and p36_1 ~= nil and p36_1 ~= "" then
    p36_0 = GetRealPidForScenario(p36_0)
    p36_2 = p36_2 or false
    return IsKeyInRollingQueue("Tech-" .. p36_0, p36_1, p36_2)
  end
  return false, nil
end

function IsTacticObservedForPid(p37_0, p37_1, p37_2)
  if p37_0 ~= nil and p37_0 ~= "" and p37_1 ~= nil and p37_1 ~= "" then
    p37_0 = GetRealPidForScenario(p37_0)
    p37_2 = p37_2 or false
    return IsKeyInRollingQueue("Tact-" .. p37_0, p37_1, p37_2)
  end
  return false, nil
end

function IsPidExcluded(p38_0)
  if not IsTacticObservedForPid(p38_0, "ttexclusion")
    and not IsTechniqueObservedForPid(p38_0, "ttexclusion") then
    if IsLegacyOrgMachine() then
      return true
    end
    return false
  end
  return true
end

function GetDetectionThresholdMetReason(p39_0, p39_1, p39_2, p39_3, p39_4)
  local r39_0 = IsPidObservedGlobal(p39_0)
  local r39_1, r39_2 = false, 0
  if r39_0 then
    r0_1()
    r0_2()
    local r39_3, r39_4, r39_5, r39_6 = 0, 0, "", ""
    local r39_7 = GetTacticsTableForPid(p39_0)
    local r39_8 = GetTechniquesTableForPid(p39_0)
    if r39_7 == nil or r39_8 == nil then
      return false, 0
    end
    local r39_9, r39_10, r39_11 = pairs(r39_7)
    for r39_12, r39_13 in r39_9, r39_10, r39_11 do
      if r39_12 ~= nil then
        local r39_14 = string.format("%s%s%s", r39_6, "|", r39_12)
        r39_6 = r39_14
      end
      if r39_13 ~= nil and type(r39_13) == "number" then
        r39_4 = r39_4 + r39_13
      end
    end
    r39_9 = string.lower(r39_6)
    r39_6 = r39_9
    r39_9, r39_10, r39_11 = pairs(r39_8)
    for r39_15, r39_16 in r39_9, r39_10, r39_11 do
      if r39_15 ~= nil then
        local r39_17 = string.format("%s%s%s", r39_5, "|", r39_15)
        r39_5 = r39_17
      end
      if r39_16 ~= nil and type(r39_16) == "number" then
        r39_3 = r39_3 + r39_16
      end
    end
    r39_9 = string.lower(r39_5)
    r39_5 = r39_9
    r39_9 = r39_6:find("ttexclusion", 1, true)
    if r39_9 or r39_5:find("ttexclusion", 1, true) or IsLegacyOrgMachine() then
      r39_2 = mp.bitor(r39_2, 2147483648)
    end
    r39_9 = GetTaintLevelHR
    r39_9 = r39_9()
    if r39_9 == "Medium" or r39_9 == "High" then
      r39_2 = mp.bitor(r39_2, 1)
    end
    if GetTaintLevelML() == "High" then
      r39_2 = mp.bitor(r39_2, 1)
    end
    r39_11 = r39_6:find("processinjection_target", 1, true)
    if r39_11 or r39_6:find("processhollowing_target", 1, true) then
      r39_2 = mp.bitor(r39_2, 2)
    end
    local r39_18 = r39_6
    r39_11 = r39_18.find
    r39_11 = r39_11(r39_18, "processinjection", 1, true)
    if r39_11 and r39_6:find("keylog", 1, true) then
      r39_2 = mp.bitor(r39_2, 4)
    end
    r39_18 = r39_6
    r39_11 = r39_18.find
    r39_11 = r39_11(r39_18, "indirectcmdexec", 1, true)
    if r39_11 then
      r39_2 = mp.bitor(r39_2, 8)
    end
    r39_18 = r39_6
    r39_11 = r39_18.find
    r39_11 = r39_11(r39_18, "processinjection", 1, true)
    if r39_11 and IsTacticObservedGlobal("processdiscovery") then
      r39_2 = mp.bitor(r39_2, 16)
    end
    r39_18 = r39_6
    r39_11 = r39_18.find
    r39_11 = r39_11(r39_18, "credentialdumping", 1, true)
    if r39_11 then
      r39_2 = mp.bitor(r39_2, 32)
    end
    r39_18 = r39_6
    r39_11 = r39_18.find
    r39_11 = r39_11(r39_18, "command_control_l", 1, true)
    if r39_11 or r39_6:find("command_control_n", 1, true) then
      r39_2 = mp.bitor(r39_2, 1024)
    end
    r39_18 = r39_5
    r39_11 = r39_18.find
    r39_11 = r39_11(r39_18, "T1036", 1, true)
    if r39_11 then
      r39_2 = mp.bitor(r39_2, 128)
    end
    r39_18 = r39_5
    r39_11 = r39_18.find
    r39_11 = r39_11(r39_18, "T1027.002", 1, true)
    if r39_11 then
      r39_2 = mp.bitor(r39_2, 256)
    end
    r39_18 = r39_5
    r39_11 = r39_18.find
    r39_11 = r39_11(r39_18, "T1505.003", 1, true)
    if r39_11 then
      r39_2 = mp.bitor(r39_2, 4096)
    end
    r39_18 = r39_6
    r39_11 = r39_18.find
    r39_11 = r39_11(r39_18, "_malware", 1, true)
    if r39_11 or r39_5:find("tt-thresholdmet", 1, true) or r39_6:find("tt-thresholdmet", 1, true) then
      local r39_19 = mp.bitor(r39_2, 2048)
      r39_2 = r39_19
    end
  end
  if r39_2 ~= 0 then
    r39_1 = mp.bitand(r39_2, 2147483648) == 0
  end
  return r39_1, r39_2
end

function IsDetectionThresholdMet(p40_0, p40_1, p40_2, p40_3, p40_4)
  p40_1 = p40_1 or 0
  p40_2 = p40_2 or 0
  p40_3 = p40_3 or 0
  p40_4 = p40_4 or 0
  local r40_0 = GetDetectionThresholdMetReason(p40_0, p40_1, p40_2, p40_3, p40_4)
  return r40_0
end

function GetDetectionThresholdMetLinuxReason(p41_0, p41_1, p41_2, p41_3, p41_4)
  local r41_0 = 0
  local r41_1 = true
  local r41_2, r41_3, r41_4 = nil, false, 0
  if r41_1 then
    local r41_5 = GetTacticsTableForPid(p41_0)
    local r41_6 = GetTechniquesTableForPid(p41_0)
    if r41_5 == nil or r41_6 == nil then
      return false, 0
    end
    local r41_7 = GetTaintLevelHR()
    if r41_7 == "Medium" or r41_7 == "High" then
      r41_4 = mp.bitor(r41_4, 1)
    end
    if GetTaintLevelML() == "High" then
      r41_4 = mp.bitor(r41_4, 1)
    end
    local r41_8, r41_9, r41_10 = pairs(r41_5)
    for r41_11, r41_12 in r41_8, r41_9, r41_10 do
      if r41_11 ~= nil then
        if r41_2 == nil then
          r41_2 = r41_11:lower()
        else
          local r41_13 = r41_2
          r41_2 = r41_13 .. " | " .. r41_11:lower()
        end
      end
      if r41_12 ~= nil then
        r41_0 = r41_0 + r41_12
      end
    end
    if r41_2 ~= nil then
      local r41_14 = r41_2:find("impact", 1, true)
      if r41_14 and r41_2:find("collection", 1, true) and r41_2:find("discovery", 1, true) then
        r41_4 = mp.bitor(r41_4, 2)
      end
      r41_14 = r41_2.find
      r41_14 = r41_14(r41_2, "execution", 1, true)
      if r41_14 and r41_2:find("persistence", 1, true) then
        r41_4 = mp.bitor(r41_4, 4)
      end
      r41_14 = r41_2.find
      r41_14 = r41_14(r41_2, "collection", 1, true)
      if r41_14
        and r41_2:find("impact", 1, true)
        and (r41_2:find("credentialaccess", 1, true) or r41_2:find("execution", 1, true)) then
        r41_4 = mp.bitor(r41_4, 8)
      end
      r41_14 = r41_2.find
      r41_14 = r41_14(r41_2, "defenseevasion", 1, true)
      if r41_14 and r41_2:find("lateralmovement", 1, true) and r41_2:find("collection", 1, true) then
        r41_4 = mp.bitor(r41_4, 16)
      end
      r41_14 = r41_2.find
      r41_14 = r41_14(r41_2, "credentialaccess", 1, true)
      if r41_14
        and r41_2:find("impact", 1, true)
        and r41_2:find("collection", 1, true)
        and r41_2:find("exfil", 1, true) then
        r41_4 = mp.bitor(r41_4, 32)
      end
      r41_14 = r41_2.find
      r41_14 = r41_14(r41_2, "accountdiscovery", 1, true)
      if r41_14
        and r41_2:find("lateralmovement", 1, true)
        and r41_2:find("remotesystemdiscovery", 1, true) then
        r41_4 = mp.bitor(r41_4, 64)
      end
      r41_14 = r41_2.find
      r41_14 = r41_14(r41_2, "execution", 1, true)
      if r41_14 and r41_2:find("impact", 1, true) then
        r41_4 = mp.bitor(r41_4, 128)
      end
      r41_14 = r41_2.find
      r41_14 = r41_14(r41_2, "collection", 1, true)
      if (r41_14 or r41_2:find("discovery", 1, true)) and r41_2:find("exfiltration", 1, true) then
        local r41_15 = mp.bitor(r41_4, 256)
        r41_4 = r41_15
      end
    end
  end
  return r41_4 ~= 0 or r41_3, r41_4
end

function IsDetectionThresholdMetLinux(p42_0, p42_1, p42_2, p42_3, p42_4)
  p42_1 = p42_1 or 0
  p42_2 = p42_2 or 0
  p42_3 = p42_3 or 0
  p42_4 = p42_4 or 0
  local r42_0 = GetDetectionThresholdMetLinuxReason(p42_0, p42_1, p42_2, p42_3, p42_4)
  return r42_0
end

function GetTaintLevelHR()
  local r43_0
  if MpCommon.GetPersistContextCountNoPath("TaintedMachine") > 0 then
    if MpCommon.GetPersistContextCountNoPath("TaintedMachineHigh") > 0 then
      r43_0 = "High"
    elseif MpCommon.GetPersistContextCountNoPath("TaintedMachineMedium") > 0 then
      r43_0 = "Medium"
    elseif MpCommon.GetPersistContextCountNoPath("TaintedMachineLow") > 0 then
      r43_0 = "Low"
    end
  end
  return r43_0
end

function GetTaintLevelML()
  local r44_0
  if MpCommon.GetPersistContextCountNoPath("TaintedMachine") > 0 then
    if MpCommon.GetPersistContextCountNoPath("TaintedMachineML_High") > 0 then
      r44_0 = "High"
    elseif MpCommon.GetPersistContextCountNoPath("TaintedMachineML_Medium") > 0 then
      r44_0 = "Medium"
    elseif MpCommon.GetPersistContextCountNoPath("TaintedMachineML_Low") > 0 then
      r44_0 = "Low"
    end
  end
  return r44_0
end

function AddPidSpecificTechniqueAndTactic(p45_0, p45_1, p45_2, p45_3)
  p45_0 = GetRealPidForScenario(p45_0)
  if p45_0 ~= nil then
    p45_3 = p45_3 or 3600
    r0_17(p45_0, p45_3)
    if p45_1 ~= nil and p45_1 ~= "" and p45_1 ~= "T0000" then
      AddTechniqueForPid(p45_0, p45_1, p45_3)
      AddTechniqueGlobal(p45_1, p45_3)
    end
    if p45_2 ~= nil and p45_2 ~= "" then
      AddTacticForPid(p45_0, p45_2, p45_3)
      r0_0(p45_2, p45_3)
    end
  end
end

function AddResearchData(p46_0, p46_1)
  p46_0 = GetRealPidForScenario(p46_0)
  p46_1 = p46_1 or false
  local r46_0, r46_1 = GetDetectionThresholdMetReason(p46_0)
  local r46_2 = {}
  r46_2.ttver = "0003"
  r46_2.TrackedPid = p46_0
  r46_2.IsThresholdMet = tostring(r46_0)
  r46_2.ThresholdMetReason = "000" .. tostring(r46_1)
  r46_2.PidsCount = "000" .. tostring(r0_18())
  local r46_3 = GetRollingQueueKeysAsString
  local r46_4, r46_5 = "Tech-", p46_0
  local r46_6 = r46_4 .. r46_5
  r46_5 = nil
  r46_3 = r46_3(r46_6)
  if r46_3 == nil then
    r46_3 = p46_0 .. " tech table missing"
  end
  r46_2.TrackedPidTechniques = r46_3
  local r46_7, r46_8 = GetRollingQueueKeysAsString, p46_0
  local r46_9 = "Tact-" .. r46_8
  r46_8 = nil
  r46_7 = r46_7(r46_9)
  if r46_7 == nil then
    r46_7 = p46_0 .. " tact table missing"
  end
  r46_2.TrackedPidTactics = r46_7
  local r46_10 = GetRollingQueueHashTableAsString
  local r46_11 = p46_0
  local r46_12 = "InheritedTech-" .. r46_11
  r46_11 = nil
  r46_10 = r46_10(r46_12)
  if r46_10 ~= nil then
    local r46_13 = MpCommon.Base64Encode(r46_10)
    r46_2.TrackedPidInheritedTechniques = r46_13
  end
  local r46_14 = GetRollingQueueHashTableAsString
  local r46_15 = p46_0
  local r46_16 = "InheritedTact-" .. r46_15
  r46_15 = nil
  r46_14 = r46_14(r46_16)
  if r46_14 ~= nil then
    local r46_17 = MpCommon.Base64Encode(r46_14)
    r46_2.TrackedPidInheritedTactics = r46_17
  end
  local r46_18 = GetRollingQueueKeysAsString("gTechniquesTable")
  r46_18 = r46_18 == nil and "gTechniquesTable table missing" or r46_18
  r46_2.AllTechniques = r46_18
  local r46_19 = GetRollingQueueKeysAsString("gTacticsTable")
  r46_19 = r46_19 == nil and "gTacticsTable table missing" or r46_19
  r46_2.AllTactics = r46_19
  if MpCommon.GetPersistContextCountNoPath("TaintedMachine") >= 1 then
    r46_2.IsTainted = "true"
    local r46_20 = MpCommon.GetPersistContextNoPath("TaintedMachine")
    if r46_20 then
      local r46_21 = table.concat(r46_20, "|")
      r46_2.TaintLevel = r46_21
    end
  else
    r46_2.IsTainted = "false"
  end
  local r46_22 = GetAtomicCounter("TestMode_fde8")
  if r46_22 ~= nil then
    local r46_23 = GetRollingQueueKeysAsString("SuspAttackServer")
    if r46_23 ~= nil then
      r46_2.AttackMachines = r46_23
    end
  end
  r0_16(r46_2, p46_1)
end

function TT_SendBMSigTrigger(p47_0, p47_1, p47_2, p47_3)
  if mp.ENGINEBUILD < 19900 then
    return
  end
  local r47_0 = GetRealPidForScenario(p47_0)
  p47_3 = p47_3 or 10
  if r47_0 and p47_1 and p47_2 then
    local r47_1 = string.lower(string.format("%s|%s|%s", r47_0, p47_1, p47_2))
    local r47_2 = IsKeyInRollingQueue("tt-sigtriggers", r47_1, true)
    if not r47_2 and pcall(MpCommon.BmTriggerSig, r47_0, p47_1, p47_2) then
      AppendToRollingQueue("tt-sigtriggers", r47_1, "1", p47_3)
    end
  end
end

function TrackPidAndTechnique(p48_0, p48_1, p48_2, p48_3, p48_4)
  if p48_0 == nil or p48_0 == "" or p48_1 == nil or p48_1 == "" then
    return
  end
  p48_0 = GetRealPidForScenario(p48_0)
  p48_3 = p48_3 == nil and 3600 or p48_3
  AddPidSpecificTechniqueAndTactic(p48_0, p48_1, p48_2, p48_3)
  p48_4 = p48_4 or false
  if not p48_4 then
    AddResearchData(p48_0, false)
  end
  if p48_0:sub(1, 4) == "pid:" then
    TT_SendBMSigTrigger(p48_0, p48_1, p48_2)
  end
end

function TrackPidAndMultipleTechniques(p49_0, p49_1, p49_2, p49_3)
  if not (p49_0 and p49_0 ~= "" and p49_1 and type(p49_1) == "table") then
    return
  end
  for r49_0, r49_1 in pairs(p49_1) do
    if r49_0 and r49_1 then
      TrackPidAndTechnique(p49_0, r49_0, r49_1, p49_2, p49_3)
    end
  end
end

function TrackPidAndTechniqueBM(p50_0, p50_1, p50_2, p50_3, p50_4)
  if p50_0 == nil or p50_0 == "" or p50_1 == nil or p50_1 == "" then
    return
  end
  p50_0 = GetRealPidForScenario(p50_0)
  p50_3 = p50_3 == nil and 3600 or p50_3
  AddPidSpecificTechniqueAndTactic(p50_0, p50_1, p50_2, p50_3)
  p50_4 = p50_4 or false
  if not p50_4 then
    AddResearchData(p50_0, true)
  end
  if p50_0:sub(1, 4) == "pid:" and p50_2 ~= nil and p50_2 ~= "" then
    pcall(bm.trigger_sig, p50_1, p50_2, p50_0)
  end
end

function TrackPidAndMultipleTechniquesBM(p51_0, p51_1, p51_2, p51_3)
  if not (p51_0 and p51_0 ~= "" and p51_1 and type(p51_1) == "table") then
    return
  end
  for r51_0, r51_1 in pairs(p51_1) do
    if r51_0 and r51_1 then
      TrackPidAndTechniqueBM(p51_0, r51_0, r51_1, p51_2, p51_3)
    end
  end
end

function TrackCustomPersistContextNameByPPID(p52_0, p52_1, p52_2, p52_3)
  if p52_0 ~= nil and p52_1 ~= nil and p52_2 ~= nil then
    if p52_1:sub(1, 4) ~= "pid:" then
      p52_1 = r0_3(p52_1)
    end
    if p52_1 == nil then
      return nil
    end
    if p52_0:lower() == "set" then
      p52_3 = p52_3 == nil and 3600 or p52_3
      MpCommon.AppendPersistContextNoPath(p52_1, p52_2, p52_3)
      return true
    end
    if p52_0:lower() == "query" then
      return MpCommon.QueryPersistContextNoPath(p52_1, p52_2)
    end
    return nil
  end
  return nil
end

function normalize_unicode(p53_0)
  if p53_0 == nil then
    return
  end
  do
    local r53_0 = ""
    local r53_1, r53_2, r53_3 = p53_0:gmatch(".")
    local r53_4 = false
    for r53_5 in r53_1, r53_2, r53_3 do
      local r53_6 = string.byte(r53_5)
      if r53_6 == 0 then
        if r53_4 then
          local r53_7 = r53_0
          r53_0 = r53_7 .. " "
          r53_4 = false
        else
          r53_4 = true
        end
      elseif r53_6 >= 32 and r53_6 <= 126 then
        local r53_8 = r53_0
        r53_0 = r53_8 .. r53_5
        r53_4 = false
      else
        r53_4 = false
      end
    end
    return r53_0
  end
end

function appendNotExistingFilePersistContext(p54_0, p54_1, p54_2)
  if p54_0 ~= nil and p54_1 ~= nil then
    p54_2 = p54_2 == nil and 0 or p54_2
    if MpCommon.QueryPersistContext(p54_0, p54_1) then
      return false
    end
    MpCommon.AppendPersistContext(p54_0, p54_1, p54_2)
    return true
  end
  return false
end

function appendFilePersistContextFromList(p55_0, p55_1, p55_2, p55_3)
  if p55_0 ~= nil and p55_1 ~= nil then
    p55_2 = p55_2 == nil and 0 or p55_2
    local r55_0 = false
    for r55_1, r55_2 in ipairs(p55_1) do
      if p55_3 == nil or mp.bitand(p55_3, 1) ~= 1 then
        if appendNotExistingFilePersistContext(p55_0, r55_2) then
          r55_0 = true
        end
      else
        MpCommon.AppendPersistContext(p55_0, r55_2, p55_2)
        r55_0 = true
      end
    end
    return r55_0
  end
  return false
end

function getCustomStringHash(p56_0)
  if p56_0 == nil or not (type(p56_0) == "string" and not (#p56_0 <= 0)) then
    return
  end
  local r56_0 = string.lower(p56_0)
  r56_0 = string.gsub(r56_0, '"', "")
  r56_0 = string.gsub(r56_0, " ", "")
  return r0_4(r56_0), r56_0
end

function checkFileLastWriteTime(p57_0, p57_1)
  if p57_0 == nil and #p57_0 <= 4 then
    return
  end
  p57_0 = MpCommon.PathToWin32Path(p57_0)
  if not sysio.IsFileExists(p57_0) then
    return
  end
  local r57_0 = sysio.GetFileLastWriteTime(p57_0)
  if not (sysio.GetLastResult().Success and r57_0 ~= 0) then
    return
  end
  local r57_1 = r57_0 / 10000000 - 11644473600
  local r57_2 = MpCommon.GetCurrentTimeT()
  local r57_3 = r57_2 - r57_1
  if p57_1 == nil then
    return r57_3, r57_1, r57_0, r57_2
  end
  local r57_4 = r57_2 < r57_1 or p57_1 < r57_3
  local r57_5 = r57_3
  local r57_6 = r57_1
  local r57_7 = r57_0
  local r57_8 = r57_2
  return r57_4, r57_5, r57_6, r57_7, r57_8
end

function IsTacticObservedForParents(p58_0, p58_1, p58_2, p58_3)
  if type(p58_2) == "number"
    and not (p58_2 <= 0)
    and not (p58_2 > 15)
    and p58_0 ~= nil
    and p58_0 ~= ""
    and p58_1 ~= nil
    and p58_1 ~= "" then
    local r58_0 = mp.GetParentProcInfo(p58_0)
    if r58_0 == nil then
      return false, nil
    end
    local r58_1, r58_2 = IsTacticObservedForPid(r58_0.ppid, p58_1, p58_3)
    if r58_1 then
      return r58_1, r58_2
    end
    return IsTacticObservedForParents(r58_0.ppid, p58_1, p58_2 - 1, p58_3)
  end
  return false, nil
end

function IsTechniqueObservedForParents(p59_0, p59_1, p59_2, p59_3)
  if type(p59_2) == "number"
    and not (p59_2 <= 0)
    and not (p59_2 > 15)
    and p59_0 ~= nil
    and p59_0 ~= ""
    and p59_1 ~= nil
    and p59_1 ~= "" then
    local r59_0 = mp.GetParentProcInfo(p59_0)
    if r59_0 == nil then
      return false, nil
    end
    local r59_1, r59_2 = IsTechniqueObservedForPid(r59_0.ppid, p59_1, p59_3)
    if r59_1 then
      return r59_1, r59_2
    end
    return IsTechniqueObservedForParents(r59_0.ppid, p59_1, p59_2 - 1, p59_3)
  end
  return false, nil
end

function expandRelativePath(p60_0, p60_1)
  if p60_0 == nil or #p60_0 <= 4 or p60_1 == nil or #p60_1 <= 2 then
    return
  end
  if string.sub(p60_0, 1, 3) ~= "..\\" then
    return
  end
  local r60_0, r60_1 = string.gsub(p60_0, "%.%.\\", "")
  if r60_1 == nil or r60_1 == 0 then
    return
  end
  local r60_2, r60_3 = string.gsub(p60_1, "\\", "")
  if r60_3 == nil or r60_3 == 0 then
    return
  end
  r60_3 = r60_3 + 1
  local r60_4 = r60_3 - r60_1
  r60_4 = r60_4 <= 0 and 1 or r60_4
  local r60_5 = string.gmatch(p60_1, "[^\\]+")
  if r60_5 == nil then
    return
  end
  local r60_6, r60_7 = 1, ""
  for r60_8 in r60_5 do
    r60_7 = r60_7 .. r60_8 .. "\\"
    if r60_4 <= r60_6 then
      break
    end
    r60_6 = r60_6 + 1
  end
  if r60_7 == "" then
    return
  end
  return r60_7 .. r60_0
end

function TrackFileAndTechnique(p61_0, p61_1, p61_2, p61_3)
  local function r61_0(p62_0, p62_1, p62_2)
    if p62_0 == nil or p62_1 == nil or p62_2 == nil then
      return
    end
    local r62_0, r62_1 = "BM_M", nil
    if string.sub(p62_1, 1, #r62_0) == r62_0 then
      r62_1 = p62_1
    elseif string.match(p62_1, "^[tT][0-9][0-9][0-9][0-9]") then
      r62_1 = r62_0 .. p62_1
    end
    if r62_1 ~= nil then
      MpCommon.AppendPersistContext(p62_0, r62_1, p62_2)
    end
    return r62_1
  end

  if p61_0 ~= nil and type(p61_0) == "string" and not (#p61_0 <= 4) then
    if p61_1 == nil then
      return
    end
    do
      p61_2 = p61_2 == nil and 0 or p61_2
      local r61_1 = p61_3 == nil and "FilePersistContextToMpAttribute.A" or p61_3
      local r61_2 = "BM_M"
      local r61_3
      if type(p61_1) == "string" then
        if r61_0(p61_0, p61_1, p61_2) == nil then
          r61_3 = nil
        else
          r61_3 = true
        end
      else
        if type(p61_1) ~= "table" then
          return
        end
        local r61_4, r61_5, r61_6 = ipairs(p61_1)
        r61_3 = nil
        for r61_7, r61_8 in r61_4, r61_5, r61_6 do
          local r61_9 = r61_0
          r61_9 = r61_9(p61_0, r61_8, p61_2)
          if r61_9 ~= nil then
            r61_3 = true
          end
        end
      end
      if r61_3 then
        MpCommon.AppendPersistContext(p61_0, r61_1, p61_2)
      end
      return r61_3
    end
  end
end

function checkParentProcessNameFromListByPPID(p63_0, p63_1)
  if p63_0 == nil or p63_1 == nil then
    return
  end
  if p63_0:sub(1, 4) ~= "pid:" then
    p63_0 = r0_3(p63_0)
  end
  local r63_0 = mp.GetParentProcInfo(p63_0)
  if r63_0 == nil then
    return
  end
  local r63_1 = string.lower(r63_0.image_path)
  local r63_2 = string.match(r63_1, "([^\\]+)$")
  local r63_3 = false
  if type(p63_1) == "table" then
    if p63_1[r63_2] ~= nil then
      r63_3 = true
    end
  elseif type(p63_1) == "string" and string.find(p63_1, r63_2, 1, true) ~= nil then
    r63_3 = true
  end
  return r63_3, r63_2
end

function checkParentProcessNameFromListByPPIDRecursive(p64_0, p64_1, p64_2)
  if p64_2 < 1 or p64_0 == nil or p64_1 == nil then
    return
  end
  if p64_0:sub(1, 4) ~= "pid:" then
    p64_0 = r0_3(p64_0)
  end
  local r64_0 = mp.GetParentProcInfo(p64_0)
  if r64_0 == nil then
    return
  end
  local r64_1 = { r64_0 }
  local r64_2 = r64_0
  for r64_3 = 1, p64_2 - 1 do
    r64_2 = mp.GetParentProcInfo(r64_2.ppid)
    if r64_2 == nil then
      break
    end
    table.insert(r64_1, r64_2)
  end
  local r64_4, r64_5 = false, ""
  for r64_6, r64_7 in ipairs(r64_1) do
    local r64_8 = string.lower(r64_7.image_path)
    local r64_9 = string.match(r64_8, "([^\\]+)$")
    if type(p64_1) == "table" then
      if p64_1[r64_9] ~= nil then
        r64_4 = true
        local r64_10 = r64_5
        local r64_11 = ";"
        local r64_12 = r64_9
        r64_5 = r64_10 .. r64_11 .. r64_12
      end
    elseif type(p64_1) == "string" and string.find(p64_1, r64_9, 1, true) ~= nil then
      r64_4 = true
      local r64_13 = r64_5
      local r64_14 = ";"
      local r64_15 = r64_9
      r64_5 = r64_13 .. r64_14 .. r64_15
    end
  end
  return r64_4, r64_5
end

function IsLegacyOrgMachine()
  local r65_0 = {
    ["9e8f722b-3aa1-4069-ab9f-fc8485ca4af9"] = true, ["e333e141-0df0-4d49-8334-ce4a3d2b51cf"] = true,
    ["a97898e3-0e7b-4c74-9c71-cf807c8a9eea"] = true, ["ebc2ebcb-43e4-4f76-8c75-2be36bdead88"] = true,
    ["fff415a5-d876-4e19-af91-a430fb7df00a"] = true, ["0b20fcfe-9850-4391-aff0-75075c0dbb1a"] = true,
    ["3b7984a2-ac4f-44ab-aefb-e0673362ee6a"] = true, ["0b11e29f-70a9-4c86-8858-55b9f37e3020"] = true,
    ["194c1c9f-90d1-40c8-9ba5-7fa5a43617f9"] = true, ["c1ed41b8-316f-4206-8655-2039a416ecf1"] = true,
    ["831aa694-4c12-49b5-9949-a4976dc1d67d"] = true, ["43a876e1-c5f3-4bcb-be8f-a0e405839830"] = true,
    ["93576e31-5469-4e26-a549-3a18220dc565"] = true, ["f3b27d4b-1c32-4f7a-b947-7a67617a319f"] = true,
    ["331f9d38-ce30-4a30-94c1-f70ab226d869"] = true, ["19361904-3386-43a8-961b-e86764aea86b"] = true,
    ["b49066f2-d2ca-44c6-a197-b75bb646b99f"] = true, ["66da7d04-65b9-4832-9cc1-5e9c5af5327c"] = true,
    ["4529e5c0-f3aa-4be7-a530-9ab6a3735062"] = true, ["0a7b537b-2304-49bf-b124-14194e13737b"] = true,
    ["23dc6e7f-39ea-45a4-a5b5-86d4223d3042"] = true, ["e0413d41-3502-4db1-9039-c88af24ead06"] = true,
    ["4574428d-d2dc-47e6-ae9f-9e24438c82e7"] = true, ["e17a58f3-7283-464c-a452-eb64ad83ec97"] = true,
    ["68521817-d140-4b74-a14f-eed29027e376"] = true, ["072b5815-bdf9-4765-bc12-6d049ae4efff"] = true,
    ["bcb207b2-cc60-4212-9043-d12afadb0fbc"] = true, ["49892dca-c126-4dac-95e7-f5757cccc16a"] = true,
    ["74e61dec-e6ab-4d90-91b1-ba372a703e06"] = true, ["2257c4e1-c3b0-439a-9119-fb2d0552bb43"] = true,
    ["3676a7b6-192c-4f13-a3ec-b0afab8f8d2b"] = true, ["fb85f5cc-d3fa-4d69-b25f-38f49233ef37"] = true,
    ["665a0743-4170-4383-b6ba-28935c57d01b"] = true, ["5ee978e9-163e-4d1e-b53a-61a36ba2b18a"] = true,
    ["7f050e73-5a3d-4813-85af-82422a793fad"] = true, ["9cc53ef5-7b0f-4aad-879c-8c7928b10dbe"] = true,
    ["94deb9b0-3515-48d3-8f59-0f596d5bb090"] = true, ["56dcd088-5605-4d08-b572-a504cf4dae65"] = true,
    ["174fa9ca-e8dd-4ae6-bcd8-8cb2f2204f95"] = true, ["932f5304-5c67-4d54-b103-b78bf287a2c3"] = true,
    ["a58b13d8-a8f3-4b11-b655-2d93970f6374"] = true, ["e53d4363-125e-4fdb-9135-f4bd0b35568e"] = true,
    ["d7c7c745-195f-4223-9c7a-99fb420fd000"] = true, ["5027d848-972a-4730-90b8-c684eff2122c"] = true,
    ["45575928-30c1-4b72-8bf9-0d19cc13e52c"] = true, ["50da504b-557b-4e97-beab-4c91dfb8c56d"] = true,
    ["0267a949-b82d-4347-b173-660c76e30da6"] = true, ["64032f4d-626a-4a92-ae42-d693ef078591"] = true,
    ["4a7a5002-cd9d-4b70-ad48-f8c53f86145b"] = true, ["8645a59d-7655-442b-9c39-bffe1294f8cb"] = true,
    ["ba8974ba-9b35-4ad0-8413-8ac01f765545"] = true, ["336876bb-1a0d-43f5-bf32-ce406f723b5e"] = true,
    ["02504642-40b7-40dd-bb23-d393ce4cc043"] = true, ["6d73cb3c-f9ca-4fd1-a357-695eb0fb8d5b"] = true,
    ["68c53d9c-8e07-4f7e-9b50-2b70499b95d0"] = true, ["d9390c80-4dad-4cc5-80c6-5da2bd33d673"] = true,
    ["4338bd78-8653-4e6f-b8cf-893b6b5dca63"] = true, ["238b89a1-be2f-4939-91dd-173c76c18095"] = true,
    ["0112e007-42b5-4355-ac50-01f8b6f60daa"] = true, ["6d4e7515-41ef-43fc-96f8-27e2fd492a19"] = true,
    ["f2c2c063-9ed1-4f73-a624-1d8fca3ee19e"] = true, ["b7f116fa-c0c0-4e37-aa6d-64790ea61007"] = true,
    ["109420d0-e127-480e-aad0-20bb832d9709"] = true, ["e2882248-03d6-4da2-87f7-da8967cf4672"] = true,
    ["d06d867f-fbea-4112-aec2-a437ff86bbfd"] = true, ["0ca80520-ab29-4a0a-86ae-e4f834611541"] = true,
    ["209400ca-9614-45e3-a14b-070d8d339b9e"] = true, ["26496fc8-a570-42b7-be89-a82840a08cbb"] = true,
    ["0b23e19e-541d-4cb3-89f4-419bc9c593a6"] = true, ["d0dc6b38-53fa-4bc6-949f-6d9dbe2d0024"] = true,
    ["6b763308-b0e7-415e-b1d6-4ed29c8d0155"] = true, ["864d05f5-3f47-4fb0-aecd-3d75ccd0de94"] = true,
    ["7b5315ed-6572-462d-8284-189038da8165"] = true, ["c7d04a61-5996-49a0-ae1b-f057623509c3"] = true,
    ["952d5943-138b-4d48-a5f3-078526a57c5d"] = true, ["c2cc1990-5094-4e7e-ab4f-65af1c52df24"] = true,
    ["aea7413a-28a8-48ef-a443-4c5c27161cb9"] = true, ["0831a921-cf12-4ecf-a3a2-0aeaba8ed268"] = true,
    ["f74b2f70-3ee6-4410-aca1-fa7f6696907a"] = true, ["fcfb1e78-be1a-45a2-b166-1e6c088ab4df"] = true,
    ["9d0004e6-2aeb-46ed-ac66-42719249fbfd"] = true, ["9e7cdd29-13c8-42c6-b852-6ad49cb47be6"] = true,
    ["7978aa21-cbb0-431f-8048-b6fe6a372187"] = true, ["51401eaf-db7b-410e-9830-aaf6170095d1"] = true,
    ["e8869022-0cda-47b4-98a0-2e481fa8bb39"] = true, ["9e2558e3-1b29-4bb1-9aa9-00f0bbf7df7a"] = true,
    ["229ff4d6-9334-4f5b-a766-b89c5cd7493a"] = true, ["48aa7ccc-e241-4c9c-8c74-2f60aac9f1af"] = true,
    ["e6d6bc19-a278-42e4-a2c9-de0dc3107cb1"] = true, ["e338937b-e3b8-4023-b9df-48372faa73b1"] = true,
    ["efa9c680-5281-4eeb-8760-fbe4a02c1cdf"] = true, ["a36f0250-09a4-4a6e-afc8-146c8d0f2523"] = true,
    ["2fb7ef2c-b321-471f-8f3f-def24ce84c96"] = true, ["8c450d96-3c8c-4fd7-b212-b194b86aeb0b"] = true,
    ["6aafad28-3462-4c54-9fa2-05525d654885"] = true, ["d7d1b4c2-d239-42be-aff7-f77bf22bc50a"] = true,
    ["84da20cd-3dad-4d27-b1a1-e4c2da9fe3de"] = true, ["d8c1a97c-1989-47f1-bad7-f61fc9fec10f"] = true,
    ["17c4f810-b36a-4b9b-b522-6ffa44933865"] = true, ["bf4cd6de-a593-46de-8705-e89a98a1a51b"] = true,
    ["c14ea10d-54bf-42d7-848c-cc9c895f8a0c"] = true, ["26b0eb5d-5020-4a63-b60f-16cabf0b5f50"] = true,
    ["f42f4b2b-f13a-4c8b-881a-6f1ffb1aa266"] = true, ["f11c8ce9-2021-4261-b39b-a1b99ca660d4"] = true,
    ["cdd251fe-9ff1-4da0-82f8-b2f559040782"] = true, ["0eb1e5d9-3dd3-4038-833e-834da63e8625"] = true,
    ["692555dd-b6cc-468f-9b4e-951f039ad383"] = true, ["06c1f48d-d514-415e-b385-713d1283a52d"] = true,
    ["1fa3fe7c-5db3-4537-9622-d1636572a18d"] = true, ["f16bd8a4-0f46-4633-aaae-048665ff9d56"] = true,
    ["207f432c-cb0c-483d-b407-2769b035f309"] = true, ["760925bc-cf36-40b7-bb44-c784fd7220c7"] = true,
    ["7742aae5-2519-4ec1-98e5-56c231438f79"] = true, ["629c1926-47fd-4a94-b2db-1f69647460ff"] = true,
    ["2a0e6866-eb55-4558-a3e6-9946ac41f870"] = true, ["29a97a64-bd43-4ce6-aaea-3982b1542e93"] = true,
    ["1e3b04c1-46c0-43e2-b456-d02c67cbfb6b"] = true, ["72c339fc-1375-4814-a4e3-f7fb7e8c8cf1"] = true,
    ["6b2d7646-e0df-42db-b5ee-4e228e0d6488"] = true, ["863e9bf6-e7c5-47e6-a63e-f94ef9f6ebe0"] = true,
    ["a62a1460-a7bd-4d81-87e4-f459245de4ad"] = true, ["bb58c89e-34d4-48eb-b965-8990bfab8d0f"] = true,
    ["fd0c1195-045d-48bf-92fc-0f241e525c3d"] = true, ["717551f8-5e59-45fe-aebe-eb3abd64cfec"] = true,
    ["7d32b9ed-c15f-486b-95bb-125216f5f7e7"] = true, ["a1984def-d4e6-476f-895f-6a6837704502"] = true,
    ["7eaf2863-7a12-4d95-8674-96407f926580"] = true, ["e89ae3b9-fa0c-43b2-b94a-61910e07d57d"] = true,
    ["583ad211-3e4b-4b8d-a903-9ef1cdfd8ff7"] = true, ["d9a18c49-7d30-4a5a-b58d-a0d124625781"] = true,
    ["df391576-f230-45b2-8d4f-03c3bacfabdd"] = true, ["52709bd7-7299-41a7-8b26-a0f6f80e1828"] = true,
    ["d884ee3c-20ae-4fee-b7be-719717882a61"] = true, ["89ece62e-abcc-49f3-9493-2e960aeddf09"] = true,
    ["7682190b-f1a4-494b-8bce-8854ab1f30ed"] = true, ["24a2479a-cecb-4c12-b83d-d5d6bc7d5c9a"] = true,
    ["7b003a1e-32d8-4d0c-b89e-b3f830ef9298"] = true, ["d33f1674-ec6e-4d30-9580-0f3a7fe9192d"] = true,
    ["482e5bc7-e3a3-470d-90df-5ae60e66de63"] = true, ["2fd18d75-7637-46c5-a38a-6fa157c323cd"] = true,
    ["dd03a6fe-556b-4162-aba3-1b967b71505c"] = true, ["a449ec79-829f-4a14-8ed4-c46d20cf7e98"] = true,
    ["73194067-7f1f-4f59-9a91-c513f9674595"] = true, ["142c86bb-2ee0-417d-8ebd-798e1b9168f1"] = true,
    ["bcdb10c5-56eb-47f4-a6b5-6c4b2dbeb995"] = true, ["557ac93d-2be7-43a5-a6a4-c58541c95d17"] = true,
    ["8eaddf99-40ac-499c-96bf-3f88d9729ed8"] = true, ["772b3e06-dce8-4c91-b82a-eb416497d1de"] = true,
    ["cc391f9b-f27c-41cb-ba4f-15e91c636b19"] = true, ["01fe0665-1ce5-4583-bafe-f2bf8a6a73d0"] = true,
    ["d5d90bec-2758-42d0-bf56-02d956bf135c"] = true, ["1bf8c75c-9326-4e7e-9dd3-5c1892c0ffc3"] = true,
    ["b0272ed6-629f-42e9-bef5-3b879cf44196"] = true, ["40a6c58e-df9e-46a2-b702-2f0e11c8470b"] = true,
    ["c0bd6124-45c1-4996-924c-46167a59a818"] = true, ["d3e3a858-f780-4d2c-b8e8-22d79d916ec1"] = true,
    ["4ade8f48-1ef2-47f8-b554-daacc40fd518"] = true, ["e3186a6e-fb5c-43b4-b5be-3d1ee0ebf674"] = true,
    ["c2773dc2-bddd-44a8-b797-e12e0e64cb8e"] = true, ["9022e75e-dfe8-4dcb-bd7a-df2a8168ac8d"] = true,
    ["277894f2-d95f-41b8-b7ac-9b9bc223031c"] = true, ["1b9d508b-eb79-4d91-9f66-dadb514ab39c"] = true,
    ["03812f4b-e4df-4e71-a7e9-02e02301c4b1"] = true, ["922ad644-d59b-4338-a818-0d6314a78536"] = true,
    ["f626ea2f-6a93-4850-bfa7-9018adb65582"] = true, ["86486b45-9fab-4b60-8ff6-d5477783a825"] = true,
    ["53e28208-6aac-4f9b-8d60-f4a9e05c8774"] = true, ["4cbb9f77-ea9f-41a0-b52a-960ac2dc5f01"] = true,
    ["c85a1588-d8b9-4c80-83a0-d6a87be9b712"] = true, ["ac94ef0a-20cd-43aa-8924-6bd156ecd6f0"] = true,
    ["27823e87-5194-40fa-a692-e3aefa2faa16"] = true, ["83d70c4c-fcb9-4de9-9880-2c34b95f0439"] = true,
    ["187d8278-def1-4813-8a1d-3614e9fcdbb4"] = true, ["e2741811-7cad-4941-a6d6-a090d7a11253"] = true,
    ["a9e4e1ae-044e-4b18-85ba-b1e40d43b511"] = true, ["f576af69-ad0b-4fef-ba5f-33a21773df43"] = true,
    ["8081f7dc-c79d-415d-8a14-dda42304d1a4"] = true, ["d148c7f3-45f0-4a78-8647-b46b2cac7b64"] = true,
    ["02781b2f-3388-4de3-ac1e-34d8a69b4b9d"] = true, ["a10a291b-4384-4161-98de-81e52f69df88"] = true,
    ["c31b3172-0a24-439d-9289-19a636ca8084"] = true, ["e5b09fc4-d1d9-42ff-a826-91792c600b87"] = true,
    ["f011ea84-bfc4-4e3a-b313-2eb3519586ec"] = true, ["d79e04ae-7499-4740-8bfa-a871fae7f415"] = true,
    ["0a22f1df-85ef-4b8e-ad38-641b33651e9d"] = true, ["fa9b0987-a412-4c68-9624-0909df6ee8c1"] = true,
    ["5df1c174-1f0f-4a02-b449-e1fc85d2370a"] = true, ["ec1154b2-d473-41a0-b914-d27b2bf64ac8"] = true,
    ["de8ad6e8-f9f2-45f4-b7dd-be2fda319016"] = true, ["e9cf8e43-27d7-47a9-a79d-2e04141762a7"] = true,
    ["50b7f255-6811-4f15-80ac-ffbab20c5878"] = true, ["551a8a43-bd4f-4ee0-82ac-0a3336533959"] = true,
    ["ae71b458-f29f-4887-9204-d01d649088bb"] = true, ["ecb93044-1c56-489a-a5cd-7a5acfbf53d5"] = true,
    ["5a324dde-dcb5-4e3a-b2c1-1fdc6c60d48e"] = true, ["a6454b24-1b9a-4dc0-974b-c3fe4bf71f2a"] = true,
    ["b001a172-4636-4058-82a4-88803b90eb08"] = true, ["67bad259-d464-44e7-b65c-83905665dd84"] = true,
    ["2a4e6c81-1a1e-4bee-9c8a-a7ac7b9e8d9e"] = true, ["457cf4d7-3847-4e71-9140-436a62db100c"] = true,
    ["b9d143cb-d802-43bb-a820-9790c501e286"] = true, ["07aebed2-fa9b-4da3-bde1-a4e53168030f"] = true,
    ["88598bde-cc7f-42cd-b32d-5423c5faf3ba"] = true, ["c7ec637c-878a-4f01-8c2c-b5cd6da7b836"] = true,
    ["1f14b09f-9477-4311-8aa0-4b103e996cdb"] = true, ["88409457-5141-4c6a-9654-386e5f9dfc7a"] = true,
    ["d45a1e7f-069a-44ce-863d-996b3afc8a32"] = true, ["b609c345-933c-4cfd-9dbf-4923a6e25f73"] = true,
    ["cf12250b-0606-4ccb-886a-0938c73de778"] = true, ["f3588a11-f071-4990-91be-1f99e816f9b6"] = true,
    ["b423ea88-8ed1-4b93-a7bd-04d80eb90ee1"] = true, ["73604805-290b-4930-b64d-c10694aca30c"] = true,
    ["da31a007-6033-43a1-bbc4-566981c87dbd"] = true, ["6c88703a-ff48-419b-a8f0-42effae4881b"] = true,
    ["81ffcd20-4c13-4353-94d6-885c1c96f4a1"] = true, ["a3906bc6-a3b6-4e49-bd0f-c0bff3e648e8"] = true,
    ["95034fa2-fe1f-489d-8ecc-827deb470cec"] = true, ["34f75caf-f95c-4149-bb5c-091730d4ade3"] = true,
    ["68420a91-f498-481c-9dc1-f957f15fcc65"] = true, ["efa6410a-b0a6-40be-9b26-69e397f22dd4"] = true,
    ["73e3f0fb-cebd-4d0d-b0a3-b82bcd7d7684"] = true, ["1ef3488a-db57-4847-abb5-a5b3aee8f942"] = true,
    ["367f773d-1bd7-4b11-9e2d-14248dce10e7"] = true, ["0ac1bd10-462e-43ba-9740-f12e7ba862ce"] = true,
    ["0ca6e27d-1eff-4640-af51-f60da7b266e0"] = true, ["e0c79e35-7c39-49f6-8650-edcc69aaba61"] = true,
    ["078d14d5-bba0-4c1e-86ea-fe726b17aa59"] = true, ["de48c3c7-1162-479d-b727-b9a7a1f27ebb"] = true,
    ["9f9ad922-1c9b-4b26-a2a7-b8fe2ce243b1"] = true, ["fa21229b-8de2-4e42-8176-23518d5fee8e"] = true,
    ["00767538-3aeb-47f5-b21e-068eaa2d3585"] = true, ["cda6a59a-bdd7-4269-a89a-cfe0cc035844"] = true,
    ["e0f54a9a-e7c7-4139-a528-7e616a808425"] = true, ["1cbdbd86-9676-4a69-8266-75550389e512"] = true,
    ["5240d2ad-529b-4ff2-be61-24c22e2dc223"] = true, ["9508acec-64bb-4c8b-b777-e4623ed552c4"] = true,
    ["2baef0fb-732b-48be-8b05-8378c32b3863"] = true, ["ec086568-3b10-43b7-acf7-4a2822fc8663"] = true,
    ["c9093900-b1d3-42c7-808b-5b7e0da66ca4"] = true, ["a3830578-0653-45ea-9095-97da11450d60"] = true,
    ["5ad249ba-02d7-4358-8475-a9c880d5ac2e"] = true, ["7c219fe2-6478-45bc-b1b3-5c6e782bdb91"] = true,
    ["3930f511-4397-44c1-aa4e-35bfc85b3412"] = true, ["9c692ae1-ba89-46b4-9917-6d9a4cbb12b3"] = true,
    ["f562fd84-a462-4425-a835-761be8c9d403"] = true, ["abae58f7-d355-46e7-9be3-c37a9b70bb5a"] = true,
    ["e18a8e9d-0168-4175-9f80-8886b3cd1316"] = true, ["083d3fb1-ce12-4ba4-ae1d-8efd37e2c0f4"] = true,
    ["5e25bb3b-ef5e-4757-97ca-7187daf43243"] = true, ["49739652-cc07-49c3-8b31-0c7eb0d0f4dc"] = true,
    ["add9e0a6-9239-4ceb-ac67-c7e9358f58e3"] = true, ["dd8fc33b-7a0f-4243-a4fa-5df4600bfcb6"] = true,
    ["d60f87ec-db7d-4372-bc31-c770b7382f93"] = true, ["f35d5ad5-45af-41b0-9d28-0f73e845187b"] = true,
    ["1cf3c410-ef90-4f2d-b20d-a56b16de0e83"] = true, ["090b3ee2-3ac6-46b9-ba96-7a3b8a81cd1f"] = true,
    ["cfca059b-1611-4471-b00e-6670b6cc60ca"] = true, ["c677c28d-2c94-49ef-a250-5099ed00cea8"] = true,
    ["7d8df643-d167-4f22-bb7b-512e3fdbb275"] = true, ["46449c61-d6a2-45fa-8851-5fa8a46d5ed2"] = true,
    ["40222833-e511-47af-9324-40c4531ba777"] = true, ["6d219195-ecf9-401b-9892-3568b7ee1833"] = true,
    ["27d074db-bf2f-4c3d-a19d-498603494a51"] = true, ["e0c103d7-e635-4e0e-b800-9b31892842f4"] = true,
    ["e9323610-6354-4b09-a4aa-2307494bba43"] = true, ["0e2eb614-0a43-4328-9264-41c261c891b6"] = true
  }
  local r65_1 = versioning.GetOrgID()
  local r65_2 = false
  if not (r65_1 == nil or r65_0[r65_1] ~= true) then
    r65_2 = true
  end
  return r65_2, r65_1
end

function isLolbinFilename(p66_0)
  local r66_0 = {
    ["cmd.exe"] = true, ["powershell.exe"] = true, ["wscript.exe"] = true, ["cscript.exe"] = true,
    ["mshta.exe"] = true, ["wmic.exe"] = true, ["bitsadmin.exe"] = true
  }
  local r66_1 = string.match(p66_0, "([^\\]+)$")
  local r66_2 = r66_0[r66_1] and true or false
  local r66_3 = r66_1
  return r66_2, r66_3
end

function isLolbinFile(p67_0)
  local r67_0 = {
    "\\system32\\cmd.exe", "\\system32\\windowspowershell\\v1.0\\powershell.exe",
    "\\system32\\wscript.exe", "\\system32\\cscript.exe", "\\system32\\mshta.exe",
    "\\system32\\wbem\\wmic.exe", "\\system32\\bitsadmin.exe", "\\system32\\mshta.exe",
    "\\system32\\rundll32.exe", "\\system32\\svchost.exe", "\\syswow64\\svchost.exe",
    "\\system32\\services.exe", "\\syswow64\\services.exe", "\\system32\\reg.exe",
    "\\windows\\regedit.exe", "\\system32\\userinit.exe"
  }
  for r67_1, r67_2 in ipairs(r67_0) do
    if string.sub(p67_0, -#r67_2) == r67_2 then
      return true
    end
  end
  return false
end

function TrackCommandLineAndTechnique(p68_0, p68_1, p68_2, p68_3, p68_4)
  if p68_0 == nil or type(p68_0) ~= "string" or #p68_0 <= 1 or p68_1 == nil then
    return
  end
  p68_4 = p68_4 == nil or p68_4
  local r68_0 = r0_7(p68_0, p68_1, p68_2, p68_3)
  if r68_0 == true then
    r0_7(p68_0, "T0000:track_cmdline", p68_2, p68_3)
  end
  local r68_1, r68_2 = r0_12(p68_0)
  local r68_3
  if p68_4 == true and r68_2 == true then
    r68_3 = r0_7(r68_1, p68_1, p68_2, p68_3)
    if r68_3 == true then
      r0_7(r68_1, "T0000:track_cmdline", p68_2, p68_3)
    end
  else
    r68_3 = nil
  end
  local r68_4 = r68_0
  local r68_5 = r68_3
  return r68_4, r68_5
end

function IsCommandLineTracked(p69_0, p69_1, p69_2)
  if p69_0 == nil then
    return
  end
  p69_2 = p69_2 == nil or p69_2
  local r69_0 = r0_9(p69_0, p69_1)
  if r69_0 == nil then
    local r69_1, r69_2 = r0_12(p69_0)
    if p69_2 == true and r69_2 == true then
      local r69_3 = r0_9(r69_1, p69_1)
      if r69_3 ~= nil then
        return true, r69_3, r69_1
      end
    end
    return false
  end
  return true, r69_0, p69_0
end

function IsCommandLineTrackedForTechnique(p70_0, p70_1, p70_2, p70_3)
  local function r70_0(p71_0, p71_1)
    if p71_0 == nil or p71_1 == nil or type(p71_1) ~= "table" then
      return
    end
    local r71_0 = string.lower(p71_0)
    for r71_1, r71_2 in ipairs(p71_1) do
      local r71_3 = string.lower(r71_2)
      if string.find(r71_3, r71_0, 1, true) then
        return true, r71_2
      end
    end
    return false
  end

  if p70_0 == nil or p70_1 == nil then
    return
  end
  p70_3 = p70_3 == nil or p70_3
  local r70_1 = r0_9(p70_0, p70_2)
  if r70_1 ~= nil then
    local r70_2, r70_3 = r70_0(p70_1, r70_1)
    if r70_2 == true then
      return true, r70_3, p70_0
    end
  end
  local r70_4, r70_5 = r0_12(p70_0)
  if p70_3 == true and r70_5 == true then
    local r70_6 = r0_9(r70_4, p70_2)
    if r70_6 ~= nil then
      local r70_7, r70_8 = r70_0(p70_1, r70_6)
      if r70_7 == true then
        return true, r70_8, r70_4
      end
    end
  end
  return false
end

function table_distinct_values(p72_0)
  if p72_0 ~= nil and #p72_0 ~= nil and not (#p72_0 <= 1) then
    local r72_0 = {}
    table.sort(p72_0)
    for r72_1, r72_2 in ipairs(p72_0) do
      if r72_2 ~= p72_0[r72_1 + 1] then
        table.insert(r72_0, r72_2)
      end
    end
    return r72_0
  end
  return p72_0
end

function get_filepaths_from_string(p73_0, p73_1, p73_2)
  if p73_0 == nil or not (type(p73_0) == "string" and not (#p73_0 <= 3)) then
    return
  end
  p73_0 = string.lower(p73_0)
  local r73_0 = mp.GetExecutablesFromCommandLine(p73_0)
  r73_0 = r73_0 == nil and {} or type(r73_0) ~= "table" and {} or r73_0
  local r73_1 = string.gmatch(p73_0, "(%%.-%.[a-z]+)")
  for r73_2 in r73_1 do
    local r73_3, r73_4 = pcall(mp.ContextualExpandEnvironmentVariables, r73_2)
    if not r73_3 then
      r73_4 = MpCommon.ExpandEnvironmentVariables(r73_2)
    end
    if r73_4 ~= nil then
      table.insert(r73_0, r73_4)
    end
  end
  if string.find(p73_0, "cmd.exe", 1, true) and string.find(p73_0, " /d ", 1, true) then
    local r73_5 = p73_0:match('/d%s+"([^"]+)"')
    if r73_5 then
      p73_1 = r73_5
    else
      p73_1 = p73_0:match('/d%s+([^%s"]+)')
    end
    p73_1 = p73_1:gsub("[\"']", "")
  elseif string.find(p73_0, "powershell.exe", 1, true)
    and string.find(p73_0, " -workingdirectory ", 1, true) then
    local r73_6 = p73_0:match('%-workingdirectory%s+"([^"]+)"')
    if r73_6 then
      p73_1 = r73_6
    else
      p73_1 = p73_0:match("%-workingdirectory%s+([^%s]+)")
    end
    p73_1 = p73_1:gsub("[\"']", "")
  end
  local r73_7, r73_8 = false, false
  if p73_1 ~= nil and #p73_1 > 3 then
    r73_7 = true
    if string.find(p73_1, "%", 1, true) then
      p73_1 = MpCommon.ExpandEnvironmentVariables(p73_1)
    end
    if string.sub(p73_1, -1) == "\\" then
      r73_8 = true
    else
      r73_8 = false
    end
  end
  if string.find(p73_0, "node.exe .", 1, true)
    or string.find(p73_0, "node .", 1, true)
    or string.find(p73_0, "node", 1, true)
      and (string.find(p73_0, " -argumentlist '.'", 1, true)
        or string.find(p73_0, ' -argumentlist "."', 1, true)) then
    p73_0 = p73_0 .. " index.js "
  end
  if string.find(p73_0, "node", 1, true) then
    local function r73_9(p74_0)
      local r74_0 = p74_0:match('"[^"]*\\node%.exe"%s+"([^"]+)"')
        or p74_0:match("\"[^\"]*\\node%.exe\"%s+'([^']+)'")
      if r74_0 then
        return r74_0
      end
      local r74_1 = p74_0:match('%snode%.exe%s+"([^"]+)"')
      local r74_2 = r74_1 or p74_0:match("%snode%.exe%s+'([^']+)'")
      if r74_2 then
        return r74_2
      end
      local r74_3 = p74_0:match('%snode%s+"([^"]+)"')
      local r74_4 = r74_3 or p74_0:match("%snode%s+'([^']+)'")
      if r74_4 then
        return r74_4
      end
      return p74_0:match('"[^"]*\\node%.exe"%s+([^%s]+)')
        or p74_0:match("%snode%.exe%s+([^%s]+)")
        or p74_0:match("%snode%s+([^%s]+)")
    end

    local r73_10 = r73_9(p73_0)
    if r73_10 ~= nil then
      r73_10 = r73_10 .. "\\index.js"
      p73_0 = p73_0 .. ' "' .. r73_10 .. '"'
    end
  end
  local r73_11 = string.gmatch(p73_0, "(.:\\.-%.[a-z]+)")
  for r73_12 in r73_11 do
    table.insert(r73_0, r73_12)
  end
  local r73_13 = string.gmatch(p73_0, "['\"%s,]?([^\"'%s,]-%.%a+)[%\"'%s,]?")
  local r73_14 = MpCommon.ExpandEnvironmentVariables("%windir%")
  for r73_15 in r73_13 do
    if string.find(r73_15, "\\", 1, true) == nil then
      if p73_2 ~= true then
        local r73_16 = r73_14 .. "\\system32\\" .. r73_15
        table.insert(r73_0, r73_16)
        local r73_17 = r73_14 .. "\\" .. r73_15
        table.insert(r73_0, r73_17)
        local r73_18 = r73_14 .. "\\system32\\wbem\\" .. r73_15
        table.insert(r73_0, r73_18)
        local r73_19 = r73_14 .. "\\system32\\windowspowershell\\v1.0\\" .. r73_15
        table.insert(r73_0, r73_19)
        local r73_20 = r73_14 .. "\\syswow64\\" .. r73_15
        table.insert(r73_0, r73_20)
      end
      if r73_7 == true then
        if r73_8 == true then
          local r73_16 = p73_1 .. r73_15
          table.insert(r73_0, r73_16)
        else
          local r73_16 = p73_1 .. "\\" .. r73_15
          table.insert(r73_0, r73_16)
        end
      end
    end
  end
  return r73_0
end

function IsProcNameInParentProcessTree(p75_0, p75_1, p75_2)
  if p75_0 == nil or p75_1 == nil then
    return
  end
  local r75_0 = p75_0
  if p75_0:sub(1, 4) ~= "pid:" then
    p75_0 = r0_3(p75_0)
  end
  if p75_0 == nil then
    return nil
  end
  p75_2 = p75_2 == nil and 5 or p75_2
  local r75_1 = p75_0
  for r75_2 = 1, p75_2 do
    local r75_3 = mp.GetParentProcInfo(r75_1)
    if r75_2 == 1 and string.lower(r75_0) == "cmdhstr" then
      r75_3 = mp.GetParentProcInfo()
    end
    if r75_3 == nil then
      break
    end
    r75_1 = r75_3.ppid
    if r75_1 == nil then
      break
    end
    if r75_3.image_path ~= nil then
      local r75_4 = string.lower(r75_3.image_path)
      if type(p75_1) == "string" then
        if string.sub(r75_4, -#p75_1) == p75_1 then
          return true, r75_1, r75_4, p75_1, r75_2
        end
      elseif type(p75_1) == "table" then
        for r75_5, r75_6 in ipairs(p75_1) do
          if string.sub(r75_4, -#r75_6) == r75_6 then
            return true, r75_1, r75_4, r75_6, r75_2
          end
        end
      end
    end
  end
  return false
end

local function r0_19(p76_0)
  if p76_0 ~= nil and p76_0 ~= "" then
    local r76_0 = p76_0:lower()
    p76_0 = r76_0
    r76_0 = {
      ["encrypted-tbn0.gstatic.com"] = true, ["img.freepik.com"] = true,
      ["api.engage.cloud.microsoft"] = true, ["image.shutterstock.com"] = true,
      ["cdn-icons-png.flaticon.com"] = true, ["loop.cloud.microsoft"] = true,
      [";lanmanredirector"] = true, ["login.microsoftonline.com"] = true, ["login.live.com"] = true,
      ["about:internet"] = true, ["google.com"] = true
    }
    return r76_0[p76_0]
  end
  return true
end

function TrackAttackerServer(p77_0, p77_1)
  if not p77_1 then
    p77_1 = 3600
  end
  local r77_0 = ExtractPartsFromUri(p77_0)
  if r77_0.host and r77_0.host ~= "" then
    local r77_1 = GetRollingQueueKeyValue("SuspAttackServer", r77_0.host)
    if r77_1 == nil then
      r77_1 = tostring(r77_0.path)
    else
      r77_1 = r77_1 .. "|" .. tostring(r77_0.path)
    end
    AppendToRollingQueue("SuspAttackServer", r77_0.host, r77_1, 3600)
  end
end

function IsHostAttackServerCloudChk(p78_0, p78_1, p78_2, p78_3, p78_4)
  if p78_0 then
    local r78_0 = ExtractPartsFromUri(p78_0)
    if r78_0.host and r78_0.host ~= "" then
      p78_0 = r78_0.host
    end
    if IsKeyInRollingQueue("CleanHostCache", p78_0) then
      return false
    end
    if r0_19(p78_0) then
      return false
    end
    local r78_1 = IsKeyInRollingQueue("SuspAttackServer", r78_0.host, false)
    if r78_1 then
      return r78_1
    end
    local r78_2 = {}
    r78_2.SIG_CONTEXT = "ATTACKSERVER"
    r78_2.TAG = "NOLOOKUP"
    if p78_1 ~= nil and p78_1 ~= "" then
      r78_2.CONTENT_SOURCE = p78_1
    end
    if p78_2 ~= nil and p78_2 ~= "" then
      r78_2.PROCESS_CONTEXT = p78_2
    end
    if p78_3 ~= nil and p78_3 ~= "" then
      r78_2.PROCESS_CMDLINE = p78_3
    end
    if p78_4 ~= nil and p78_4 ~= "" then
      r78_2.SCENARIO = p78_4
    end
    local r78_3 = SafeGetUrlReputation({ p78_0 }, r78_2, false, 2000)
    if r78_3.urls[p78_0] and r78_3.urls[p78_0].determination == 2 then
      TrackAttackerServer(p78_0)
      return true
    end
    AppendToRollingQueue("CleanHostCache", p78_0, true, 36000)
    return false
  end
  return false
end

function IsHostAttackServer(p79_0, p79_1)
  local r79_0 = false
  p79_1 = p79_1 or false
  local r79_1 = ExtractPartsFromUri(p79_0)
  if r79_1.host and r79_1.host ~= "" then
    p79_1 = p79_1 or false
    if r0_19(r79_1.host) then
      return false
    end
    return (IsKeyInRollingQueue("SuspAttackServer", r79_1.host, p79_1))
  end
  return false
end

function IsDiscoveryCollectionThresholdMetLinux(p80_0)
  if p80_0 == nil then
    return false
  end
  local r80_0, r80_1, r80_2 = 0, 45, 100
  if IsTechniqueObservedForPid(p80_0, "T1057") or IsTacticObservedForPid(p80_0, "Discovery_Process") then
    r80_0 = r80_0 + 15
  end
  if IsTechniqueObservedForPid(p80_0, "T1552") or IsTacticObservedForPid(p80_0, "CredentialAccess") then
    r80_0 = r80_0 + 16
  end
  if IsTechniqueObservedForPid(p80_0, "T1083")
    or IsTacticObservedForPid(p80_0, "Discovery_FileAndDirectoryDiscovery") then
    r80_0 = r80_0 + 15
  end
  if IsTechniqueObservedForPid(p80_0, "T1074")
    or IsTacticObservedForPid(p80_0, "Collection_DataStaged") then
    r80_0 = r80_0 + 15
  end
  if IsTechniqueObservedForPid(p80_0, "T1049")
    or IsTacticObservedForPid(p80_0, "Discovery_NetworkConnectionsDiscovery") then
    r80_0 = r80_0 + 15
  end
  if IsTechniqueObservedForPid(p80_0, "T1033")
    or IsTacticObservedForPid(p80_0, "Discovery_SystemOwnerUserDiscovery") then
    r80_0 = r80_0 + 8
  end
  if IsTechniqueObservedForPid(p80_0, "T1518")
    or IsTacticObservedForPid(p80_0, "Discovery_SoftwareDiscovery") then
    r80_0 = r80_0 + 8
  end
  if IsTechniqueObservedForPid(p80_0, "T1082")
    or IsTacticObservedForPid(p80_0, "Discovery_SystemInfoDiscovery") then
    r80_0 = r80_0 + 8
  end
  if r80_1 <= r80_0 and r80_0 <= r80_2 then
    return true
  end
  return false
end

function IsDetectionThresholdMetLinuxWrapper(p81_0, p81_1, p81_2, p81_3, p81_4)
  local r81_0 = 0
  local r81_1 = true
  local r81_2 = nil
  if IsDetectionThresholdMetLinux(p81_0) then
    return true
  end
  if r81_1 then
    local r81_3 = GetTacticsTableForPid(p81_0)
    local r81_4 = GetTechniquesTableForPid(p81_0)
    if r81_3 == nil or r81_4 == nil then
      return false
    end
    for r81_5, r81_6 in pairs(r81_3) do
      if r81_5 ~= nil then
        if r81_2 == nil then
          r81_2 = r81_5:lower()
        else
          local r81_7 = r81_2
          r81_2 = r81_7 .. " | " .. r81_5:lower()
        end
      end
      if r81_6 ~= nil then
        r81_0 = r81_0 + r81_6
      end
    end
    if r81_2 ~= nil then
      local r81_8 = r81_2:find("collection", 1, true)
      if r81_8 and r81_2:find("discovery", 1, true) and r81_2:find("exfiltration", 1, true) then
        return true
      end
      local r81_9 = r81_2:find("initialaccess", 1, true)
      if (r81_9
        or r81_2:find("collection", 1, true)
        or r81_2:find("discovery", 1, true)
        or r81_2:find("execution", 1, true)
        or r81_2:find("credentialaccess", 1, true)
        or r81_2:find("defenseevasion", 1, true)
        or r81_2:find("lateralmovement", 1, true)
        or r81_2:find("privilegeescalation", 1, true))
        and r81_2:find("persistence", 1, true)
        and (r81_2:find("exfiltration", 1, true) or r81_2:find("commandandcontrol", 1, true)) then
        return true
      end
      local r81_10 = r81_2:find("collection", 1, true)
      if (r81_10 or r81_2:find("discovery", 1, true) or r81_2:find("execution", 1, true))
        and (r81_2:find("credentialaccess", 1, true)
          or r81_2:find("defenseevasion", 1, true)
          or r81_2:find("lateralmovement", 1, true))
        and (r81_2:find("persistence", 1, true)
          or r81_2:find("exfiltration", 1, true)
          or r81_2:find("commandandcontrol", 1, true)) then
        return true
      end
      local r81_11 = r81_2:find("initialaccess", 1, true)
      if (r81_11
        or r81_2:find("collection", 1, true)
        or r81_2:find("discovery", 1, true)
        or r81_2:find("execution", 1, true)
        or r81_2:find("credentialaccess", 1, true)
        or r81_2:find("defenseevasion", 1, true)
        or r81_2:find("lateralmovement", 1, true)
        or r81_2:find("privilegeescalation", 1, true))
        and r81_2:find("exfiltration", 1, true)
        and r81_2:find("commandandcontrol", 1, true) then
        return true
      end
    end
    local r81_12, r81_13, r81_14 = 0, 4, 17
    if r81_2:find("initialaccess", 1, true) then
      r81_12 = r81_12 + 1
    end
    local r81_15 = r81_2.find
    r81_15 = r81_15(r81_2, "execution", 1, true)
    if r81_15 then
      r81_12 = r81_12 + 1
    end
    r81_15 = r81_2.find
    r81_15 = r81_15(r81_2, "persistence", 1, true)
    if r81_15 then
      r81_12 = r81_12 + 2
    end
    r81_15 = r81_2.find
    r81_15 = r81_15(r81_2, "privilegeescalation", 1, true)
    if r81_15 then
      r81_12 = r81_12 + 1
    end
    r81_15 = r81_2.find
    r81_15 = r81_15(r81_2, "defenseevasion", 1, true)
    if r81_15 then
      r81_12 = r81_12 + 1
    end
    r81_15 = r81_2.find
    r81_15 = r81_15(r81_2, "credentialaccess", 1, true)
    if r81_15 then
      r81_12 = r81_12 + 1
    end
    r81_15 = r81_2.find
    r81_15 = r81_15(r81_2, "discovery", 1, true)
    if r81_15 then
      r81_12 = r81_12 + 1
    end
    r81_15 = r81_2.find
    r81_15 = r81_15(r81_2, "lateralmovement", 1, true)
    if r81_15 then
      r81_12 = r81_12 + 2
    end
    r81_15 = r81_2.find
    r81_15 = r81_15(r81_2, "collection", 1, true)
    if r81_15 then
      r81_12 = r81_12 + 1
    end
    r81_15 = r81_2.find
    r81_15 = r81_15(r81_2, "commandandcontrol", 1, true)
    if r81_15 then
      r81_12 = r81_12 + 2
    end
    r81_15 = r81_2.find
    r81_15 = r81_15(r81_2, "exfiltration", 1, true)
    if r81_15 then
      r81_12 = r81_12 + 2
    end
    r81_15 = r81_2.find
    r81_15 = r81_15(r81_2, "impact", 1, true)
    if r81_15 then
      r81_12 = r81_12 + 2
    end
    if r81_13 <= r81_12 and r81_12 <= r81_14 then
      return true
    end
  end
  return false
end

function TT_IsProdCriticalService(p82_0)
  local r82_0 = p82_0:find("veeam.backup", 1, true)
  if not r82_0 and not p82_0:find("backupexec", 1, true) and not p82_0:find("netbackup", 1, true) then
    local r82_1 = p82_0:find("msexchange", 1, true)
    if not r82_1
      and not p82_0:find("microsoft.exchange", 1, true)
      and not p82_0:find("acronis", 1, true) then
      local r82_2 = p82_0:find("veeamenterprise", 1, true)
      if not r82_2 and not p82_0:find("oracle", 1, true) and not p82_0:find("sqlagent", 1, true) then
        local r82_3 = {
          acronisagent = true, acrsch2svc = true, avpsus = true, ["bmr boot service"] = true,
          ["bmr mtftp service"] = true, caarcupdatesvc = true, casad2dwebsvc = true, ccevtmgr = true,
          ccsetmgr = true, defwatch = true, dns = true, dnssvc = true, eventlog = true, gxblr = true,
          gxcimgr = true, gxcvd = true, gxfwd = true, gxvss = true, intuit = true,
          ["intuit.quickbooks.fcs"] = true, mcafeedlpagentservice = true, memtas = true,
          mepocs = true, mfewc = true, mpssvc = true, ["msdtc.exe"] = true, msdtc = true,
          ["msexchange transport logsearch"] = true, msexchangeantispamupdate = true,
          msexchangecompliance = true, msexchangedagmgmt = true, msexchangedelivery = true,
          msexchangediagnostics = true, msexchangeedgesync = true, msexchangefastsearch = true,
          msexchangefrontendtransport = true, msexchangehm = true, msexchangehmrecovery = true,
          msexchangeimap4 = true, msexchangeimap4be = true, msexchangeis = true,
          msexchangemailboxassistants = true, msexchangemailboxreplication = true,
          msexchangenotificationsbroker = true, msexchangepop3 = true, msexchangepop3be = true,
          msexchangerepl = true, msexchangerpc = true, msexchangeservicehost = true,
          msexchangesubmission = true, msexchangethrottling = true, msexchangetransport = true,
          msexchangeum = true, msexchangeumcr = true, msmpeng = true, mssense = true, mspub = true,
          mssqlserver = true, mssqlsvc = true, mysql = true, mysql80 = true, pdvfsservice = true,
          perfhost = true, pop3svc = true, profsvc = true, qbcfmonitorservice = true,
          qbfcservice = true, qbidpservice = true, rtvscan = true, samss = true,
          ["sacsvr.exe"] = true, savroam = true, ["savservice.exe"] = true, sdrsvc = true,
          sense = true, sophos = true, sql = true, ["sqlagent.exe"] = true,
          ["sqlbrowser.exe"] = true, sqlbrowser = true, ["sqlceip.exe"] = true,
          sqlserveragent = true, ["sqlservr.exe"] = true, sqltelemetry = true,
          ["sqlwriter.exe"] = true, sqlwriter = true, stc_raw_agent = true, usermanager = true,
          vboxdrv = true, vds = true, ["veeam.guest.interaction.proxy.exe"] = true, veeam = true,
          veeamcatalogsvc = true, veeamcloudsvc = true, veeamdeploymentservice = true,
          ["veeamdeploymentsvc.exe"] = true, veeamdeploysvc = true,
          ["veeamfilesysvsssvc.exe"] = true, ["veeamnfssvc.exe"] = true, veeamnfssvc = true,
          ["veeamtransportsvc.exe"] = true, veeamtransportsvc = true, vmcompute = true, vmms = true,
          ["vmwp.exe"] = true, vsnapvss = true, vss = true, vsssvc = true, webthreatdefsvc = true,
          wecsvc = true, wer = true, wersvc = true, windefend = true, w3svc = true,
          ["w3wp.exe"] = true, yoobackup = true, yooit = true
        }
        if r82_3[p82_0] then
          return true
        end
        return false
      end
      return true
    end
    return true
  end
  return true
end

function Has_NetworkLogonSuccess(p83_0)
  p83_0 = p83_0 or false
  local r83_0 = GetRollingQueue("has_networklogonsuccess")
  if r83_0 then
    if p83_0 then
      local r83_1 = safeJsonSerialize(r83_0)
      if r83_1 ~= nil then
        r83_1 = MpCommon.Base64Encode(r83_1)
        bm.add_related_string("NetworkLogonSuccess", r83_1, bm.RelatedStringBMReport)
      end
    else
      local r83_2 = safeJsonSerialize(r83_0)
      if r83_2 ~= nil then
        r83_2 = MpCommon.Base64Encode(r83_2)
        set_research_data("NetworkLogonSuccess", r83_2, false)
      end
    end
    return true
  end
  return false
end

function isLolBasFilename(p84_0, p84_1)
  if p84_0 == nil or #p84_0 <= 5 then
    return
  end
  local r84_0 = string.lower(p84_0)
  p84_0 = r84_0
  r84_0 = {
    ["addinutil.exe"] = "binaries", ["appinstaller.exe"] = "binaries",
    ["aspnet_compiler.exe"] = "binaries", ["at.exe"] = "binaries", ["atbroker.exe"] = "binaries",
    ["bash.exe"] = "binaries", ["bitsadmin.exe"] = "binaries", ["certoc.exe"] = "binaries",
    ["certreq.exe"] = "binaries", ["certutil.exe"] = "binaries", ["cmd.exe"] = "binaries",
    ["cmdkey.exe"] = "binaries", ["cmdl32.exe"] = "binaries", ["cmstp.exe"] = "binaries",
    ["colorcpl.exe"] = "binaries", ["computerdefaults.exe"] = "binaries",
    ["configsecuritypolicy.exe"] = "binaries", ["conhost.exe"] = "binaries",
    ["control.exe"] = "binaries", ["csc.exe"] = "binaries", ["cscript.exe"] = "binaries",
    ["customshellhost.exe"] = "binaries", ["datasvcutil.exe"] = "binaries",
    ["desktopimgdownldr.exe"] = "binaries", ["devicecredentialdeployment.exe"] = "binaries",
    ["dfsvc.exe"] = "binaries", ["diantz.exe"] = "binaries", ["diskshadow.exe"] = "binaries",
    ["dnscmd.exe"] = "binaries", ["esentutl.exe"] = "binaries", ["eventvwr.exe"] = "binaries",
    ["expand.exe"] = "binaries", ["explorer.exe"] = "binaries", ["extexport.exe"] = "binaries",
    ["extrac32.exe"] = "binaries", ["findstr.exe"] = "binaries", ["finger.exe"] = "binaries",
    ["fltmc.exe"] = "binaries", ["forfiles.exe"] = "binaries", ["fsutil.exe"] = "binaries",
    ["ftp.exe"] = "binaries", ["gpscript.exe"] = "binaries", ["hh.exe"] = "binaries",
    ["imewdbld.exe"] = "binaries", ["ie4uinit.exe"] = "binaries", ["iediagcmd.exe"] = "binaries",
    ["ieexec.exe"] = "binaries", ["ilasm.exe"] = "binaries", ["infdefaultinstall.exe"] = "binaries",
    ["installutil.exe"] = "binaries", ["jsc.exe"] = "binaries", ["ldifde.exe"] = "binaries",
    ["makecab.exe"] = "binaries", ["mavinject.exe"] = "binaries",
    ["microsoft.workflow.compiler.exe"] = "binaries", ["mmc.exe"] = "binaries",
    ["mpcmdrun.exe"] = "binaries", ["msbuild.exe"] = "binaries", ["msconfig.exe"] = "binaries",
    ["msdt.exe"] = "binaries", ["msedge.exe"] = "binaries", ["mshta.exe"] = "binaries",
    ["msiexec.exe"] = "binaries", ["netsh.exe"] = "binaries", ["ngen.exe"] = "binaries",
    ["odbcconf.exe"] = "binaries", ["offlinescannershell.exe"] = "binaries",
    ["onedrivestandaloneupdater.exe"] = "binaries", ["pcalua.exe"] = "binaries",
    ["pcwrun.exe"] = "binaries", ["pktmon.exe"] = "binaries", ["pnputil.exe"] = "binaries",
    ["presentationhost.exe"] = "binaries", ["print.exe"] = "binaries", ["printbrm.exe"] = "binaries",
    ["provlaunch.exe"] = "binaries", ["psr.exe"] = "binaries", ["rasautou.exe"] = "binaries",
    ["rdrleakdiag.exe"] = "binaries", ["reg.exe"] = "binaries", ["regasm.exe"] = "binaries",
    ["regedit.exe"] = "binaries", ["regini.exe"] = "binaries",
    ["register-cimprovider.exe"] = "binaries", ["regsvcs.exe"] = "binaries",
    ["regsvr32.exe"] = "binaries", ["replace.exe"] = "binaries", ["rpcping.exe"] = "binaries",
    ["rundll32.exe"] = "binaries", ["runexehelper.exe"] = "binaries", ["runonce.exe"] = "binaries",
    ["runscripthelper.exe"] = "binaries", ["sc.exe"] = "binaries", ["schtasks.exe"] = "binaries",
    ["scriptrunner.exe"] = "binaries", ["setres.exe"] = "binaries",
    ["settingsynchost.exe"] = "binaries", ["ssh.exe"] = "binaries", ["stordiag.exe"] = "binaries",
    ["syncappvpublishingserver.exe"] = "binaries", ["tar.exe"] = "binaries",
    ["ttdinject.exe"] = "binaries", ["tttracer.exe"] = "binaries", ["unregmp2.exe"] = "binaries",
    ["vbc.exe"] = "binaries", ["verclsid.exe"] = "binaries", ["wab.exe"] = "binaries",
    ["wbadmin.exe"] = "binaries", ["winget.exe"] = "binaries", ["wlrmdr.exe"] = "binaries",
    ["wmic.exe"] = "binaries", ["workfolders.exe"] = "binaries", ["wscript.exe"] = "binaries",
    ["wsreset.exe"] = "binaries", ["wuauclt.exe"] = "binaries", ["xwizard.exe"] = "binaries",
    ["msedge_proxy.exe"] = "binaries", ["msedgewebview2.exe"] = "binaries", ["wt.exe"] = "binaries",
    ["advpack.dll"] = "libraries", ["desk.cpl"] = "libraries", ["dfshim.dll"] = "libraries",
    ["ieadvpack.dll"] = "libraries", ["ieframe.dll"] = "libraries", ["mshtml.dll"] = "libraries",
    ["pcwutl.dll"] = "libraries", ["scrobj.dll"] = "libraries", ["setupapi.dll"] = "libraries",
    ["shdocvw.dll"] = "libraries", ["shell32.dll"] = "libraries", ["shimgvw.dll"] = "libraries",
    ["syssetup.dll"] = "libraries", ["url.dll"] = "libraries", ["zipfldr.dll"] = "libraries",
    ["comsvcs.dll"] = "libraries", ["acccheckconsole.exe"] = "othermsbinaries",
    ["adplus.exe"] = "othermsbinaries", ["agentexecutor.exe"] = "othermsbinaries",
    ["appcert.exe"] = "othermsbinaries", ["appvlp.exe"] = "othermsbinaries",
    ["bginfo.exe"] = "othermsbinaries", ["cdb.exe"] = "othermsbinaries",
    ["coregen.exe"] = "othermsbinaries", ["createdump.exe"] = "othermsbinaries",
    ["csi.exe"] = "othermsbinaries", ["defaultpack.exe"] = "othermsbinaries",
    ["devinit.exe"] = "othermsbinaries", ["devtoolslauncher.exe"] = "othermsbinaries",
    ["dnx.exe"] = "othermsbinaries", ["dotnet.exe"] = "othermsbinaries",
    ["dsdbutil.exe"] = "othermsbinaries", ["dtutil.exe"] = "othermsbinaries",
    ["dump64.exe"] = "othermsbinaries", ["dumpminitool.exe"] = "othermsbinaries",
    ["dxcap.exe"] = "othermsbinaries", ["excel.exe"] = "othermsbinaries",
    ["fsi.exe"] = "othermsbinaries", ["fsianycpu.exe"] = "othermsbinaries",
    ["mftrace.exe"] = "othermsbinaries",
    ["microsoft.nodejstools.pressanykey.exe"] = "othermsbinaries",
    ["msaccess.exe"] = "othermsbinaries", ["msdeploy.exe"] = "othermsbinaries",
    ["msohtmed.exe"] = "othermsbinaries", ["mspub.exe"] = "othermsbinaries",
    ["msxsl.exe"] = "othermsbinaries", ["ntdsutil.exe"] = "othermsbinaries",
    ["openconsole.exe"] = "othermsbinaries", ["powerpnt.exe"] = "othermsbinaries",
    ["procdump.exe"] = "othermsbinaries", ["protocolhandler.exe"] = "othermsbinaries",
    ["rcsi.exe"] = "othermsbinaries", ["remote.exe"] = "othermsbinaries",
    ["sqldumper.exe"] = "othermsbinaries", ["sqlps.exe"] = "othermsbinaries",
    ["sqltoolsps.exe"] = "othermsbinaries", ["squirrel.exe"] = "othermsbinaries",
    ["te.exe"] = "othermsbinaries", ["teams.exe"] = "othermsbinaries",
    ["testwindowremoteagent.exe"] = "othermsbinaries", ["tracker.exe"] = "othermsbinaries",
    ["update.exe"] = "othermsbinaries", ["vsdiagnostics.exe"] = "othermsbinaries",
    ["vsiisexelauncher.exe"] = "othermsbinaries", ["visio.exe"] = "othermsbinaries",
    ["visualuiaverifynative.exe"] = "othermsbinaries", ["vslaunchbrowser.exe"] = "othermsbinaries",
    ["vshadow.exe"] = "othermsbinaries", ["vsjitdebugger.exe"] = "othermsbinaries",
    ["wfc.exe"] = "othermsbinaries", ["winproj.exe"] = "othermsbinaries",
    ["winword.exe"] = "othermsbinaries", ["wsl.exe"] = "othermsbinaries",
    ["devtunnel.exe"] = "othermsbinaries", ["vsls-agent.exe"] = "othermsbinaries",
    ["vstest.console.exe"] = "othermsbinaries", ["winfile.exe"] = "othermsbinaries",
    ["xsd.exe"] = "othermsbinaries", ["cl_loadassembly.ps1"] = "scripts",
    ["cl_mutexverifiers.ps1"] = "scripts", ["cl_invocation.ps1"] = "scripts",
    ["launch-vsdevshell.ps1"] = "scripts", ["manage-bde.wsf"] = "scripts",
    ["pubprn.vbs"] = "scripts", ["syncappvpublishingserver.vbs"] = "scripts",
    ["utilityfunctions.ps1"] = "scripts", ["winrm.vbs"] = "scripts", ["pester.bat"] = "scripts"
  }
  local r84_1 = r84_0[p84_0]
  if r84_1 == nil then
    return false
  end
  if p84_1 == nil then
    return true, r84_1
  end
  p84_1 = string.lower(p84_1)
  if p84_1 == r84_1 then
    return true
  end
  return false
end

function getOrgIdScrubbed()
  local r85_0 = versioning.GetOrgID()
  if r85_0 == nil or not (#r85_0 > 20) then
    return
  end
  return "PII_" .. string.lower(r85_0)
end

function isDefenderPath(p86_0)
  if p86_0 == nil then
    return
  end
  local r86_0 = normalize_path(p86_0)
  if r86_0 == nil then
    return
  end
  local r86_1 = string.lower(r86_0)
  r86_0 = r86_1
  r86_1 = {
    "c:\\programdata\\microsoft\\windows defender", "c:\\program files\\windows defender",
    "c:\\program files\\windows defender advanced threat protection",
    "c:\\program files\\windows security", "c:\\windows\\system32\\securityhealthservice.exe"
  }
  for r86_2, r86_3 in ipairs(r86_1) do
    if string.find(r86_0, r86_3, 1, true) then
      return true
    end
  end
  return false
end

function isFilenameInSideLoadIndicators(p87_0)
  if p87_0 == nil or #p87_0 <= 2 then
    return
  end
  local r87_0 = {
    ["goopdate.dll"] = mp.INFECTED, ["mpsvc.dll"] = mp.INFECTED, ["mpclient.dll"] = mp.INFECTED,
    ["mpgear.dll"] = mp.INFECTED, ["iphlpapi.dll"] = mp.INFECTED, ["libcef.dll"] = mp.INFECTED,
    ["activeds.dll"] = mp.INFECTED, ["qclite.dll"] = mp.INFECTED, ["msimg32.dll"] = mp.INFECTED,
    ["aclmgr.dll"] = mp.INFECTED, ["rcdll.dll"] = mp.INFECTED, ["iscsiexe.dll"] = mp.INFECTED,
    ["iviewers.dll"] = mp.INFECTED, ["mscoree.dll"] = mp.INFECTED, ["version.dll"] = mp.INFECTED,
    ["cryptsp.dll"] = mp.INFECTED, ["msvcp140.dll"] = mp.INFECTED, ["d3dx9_43.dll"] = mp.INFECTED,
    ["atom.dll"] = mp.INFECTED, ["foxsdku32w.dll"] = mp.INFECTED,
    ["anydatarecoverysdk.dll"] = mp.INFECTED, ["libiomp5md.dll"] = mp.INFECTED,
    ["vcomp110.dll"] = mp.INFECTED, ["cmdres.dll"] = mp.INFECTED, ["vcl120.bpl"] = mp.INFECTED,
    ["msedgeupdate.dll"] = mp.INFECTED, ["msedge_elf.dll"] = mp.INFECTED,
    ["chrome_elf.dll"] = mp.INFECTED, ["midlrtmd.dll"] = mp.INFECTED, ["duser.dll"] = mp.INFECTED,
    ["dllsafecheck.dll"] = mp.INFECTED, ["userenv.dll"] = mp.INFECTED,
    ["k7sysmn1.dll"] = mp.INFECTED, ["cryptbase.dll"] = mp.INFECTED, ["ncrypt.dll"] = mp.INFECTED,
    ["edputil.dll"] = mp.INFECTED, ["dbgeng.dll"] = mp.INFECTED, ["faultrep.dll"] = mp.INFECTED,
    ["wsock32.dll"] = mp.INFECTED, ["wintthp.dll"] = mp.INFECTED, ["dismcore.dll"] = mp.INFECTED,
    ["hccutils.dll"] = mp.INFECTED, ["x32bridge.dll"] = mp.INFECTED, ["wdsync.dll"] = mp.INFECTED,
    ["wdlocal.dll"] = mp.INFECTED, ["cnqmutil.dll"] = mp.INFECTED, ["hd-common.dll"] = mp.INFECTED,
    ["imobiehelper.dll"] = mp.INFECTED, ["toolsbag.dll"] = mp.INFECTED, ["mvvm.dll"] = mp.INFECTED,
    ["textshaping.dll"] = mp.INFECTED, ["mcvsocfg.dll"] = mp.INFECTED,
    ["netapi32.dll"] = mp.INFECTED, ["dsrole.dll"] = mp.INFECTED, ["sspicli.dll"] = mp.INFECTED,
    ["msftedit.dll"] = mp.INFECTED, ["format.dll"] = mp.INFECTED,
    ["webview2loader.dll"] = mp.INFECTED, ["winmm.dll"] = mp.INFECTED,
    ["brmod104.dll"] = mp.INFECTED, ["facesdk.dll"] = mp.INFECTED, ["dokan1.dll"] = mp.INFECTED,
    ["vdfvm17.dll"] = mp.INFECTED, ["dvusb.dll"] = mp.INFECTED, ["drivespan.dll"] = mp.INFECTED,
    ["gswdll32.dll"] = mp.INFECTED, ["vivaldi_elf.dll"] = mp.INFECTED,
    ["protectwow64.dll"] = mp.INFECTED, ["ceiinfolog.dll"] = mp.INFECTED,
    ["waveedit.dll"] = mp.INFECTED, ["mpamedia.dll"] = mp.INFECTED, ["coreclr.dll"] = mp.INFECTED,
    ["scanimageui.dll"] = mp.INFECTED, ["hpcustpartui.dll"] = mp.INFECTED,
    ["vina-cav3.dll"] = mp.INFECTED, ["mozglue.dll"] = mp.INFECTED, ["ccl80u.dll"] = mp.INFECTED,
    ["corefoundation.dll"] = mp.INFECTED, ["wtsapi32.dll"] = mp.INFECTED,
    ["ualapi.dll"] = mp.INFECTED, ["propsys.dll"] = mp.INFECTED, ["profapi.dll"] = mp.INFECTED,
    ["winmde.dll"] = mp.INFECTED, ["colorui.dll"] = mp.INFECTED, ["dui70.dll"] = mp.INFECTED,
    ["mi.dll"] = mp.INFECTED, ["winhttp.dll"] = mp.INFECTED, ["esent.dll"] = mp.INFECTED,
    ["wbemcomm.dll"] = mp.INFECTED, ["sxshared.dll"] = mp.INFECTED, ["winsync.dll"] = mp.INFECTED,
    ["ncobjapi.dll"] = mp.INFECTED, ["wlbsctrl.dll"] = mp.INFECTED, ["wmiclnt.dll"] = mp.INFECTED,
    ["vcruntime140.dll"] = mp.INFECTED, ["wwlib.dll"] = mp.INFECTED, ["vgauth.dll"] = mp.INFECTED,
    ["secur32.dll"] = mp.INFECTED, ["hpqhvsei.dll"] = mp.INFECTED, ["tosbtkbd.dll"] = mp.INFECTED,
    ["delevator64.dll"] = mp.INFECTED, ["vixdisklib.dll"] = mp.INFECTED,
    ["sbiedll.dll"] = mp.INFECTED, ["d3d8.dll"] = mp.INFECTED, ["sensapi.dll"] = mp.INFECTED,
    ["dxgi.dll"] = mp.INFECTED, ["fszwd.dat"] = mp.INFECTED, ["radcui.dll"] = mp.INFECTED,
    ["nethost.dll"] = mp.INFECTED, ["printui.dll"] = mp.INFECTED, ["wscapi.dll"] = mp.INFECTED,
    ["wininet.dll"] = mp.INFECTED, ["clink_dll_x86.dll"] = mp.INFECTED, ["ahni2t.dll"] = mp.INFECTED,
    ["safestore64.dll"] = mp.INFECTED, ["wchook.dkll"] = mp.INFECTED, ["libcurl.dll"] = mp.INFECTED,
    ["mspgimme.dll"] = mp.INFECTED, ["oledlg.dll"] = mp.INFECTED,
    ["systemsettings.dll"] = mp.INFECTED, ["printdialog.dll"] = mp.INFECTED,
    ["iumbase.dll"] = mp.INFECTED, ["avcodec-61.dll"] = mp.INFECTED, ["heif.dll"] = mp.INFECTED,
    ["libde265.dll"] = mp.INFECTED, ["xmllite.dll"] = mp.INFECTED, ["uevmonitor.dll"] = mp.INFECTED,
    ["cnmpaui.dll"] = mp.INFECTED, ["sentinelagentcore.dll"] = mp.INFECTED,
    ["log.dll"] = mp.INFECTED, ["appvisvsubsystems64.dll"] = mp.INFECTED,
    ["windowscodecs.dll"] = mp.INFECTED, ["python310.dll"] = mp.INFECTED, ["u2ec.dll"] = mp.INFECTED,
    ["wer.dll"] = mp.INFECTED, ["client.dll"] = mp.INFECTED, ["tpsvcloc.dll"] = mp.INFECTED,
    ["sqlite.dll"] = mp.INFECTED, ["glib-2.0.dll"] = mp.INFECTED, ["crashrpt1403.dll"] = mp.INFECTED,
    ["asus_wmi.dll"] = mp.INFECTED, ["wptsextensions.dll"] = mp.INFECTED,
    ["soldier.dll"] = mp.INFECTED, ["libvlc.dll"] = mp.INFECTED,
    ["getcurrentdeploy.dll"] = mp.INFECTED, ["calibre-launcher.dll"] = mp.INFECTED,
    ["pcaui.dll"] = mp.INFECTED, ["scnpst64.dll"] = mp.INFECTED, ["sdl3.dll"] = mp.INFECTED,
    ["broker.dll"] = mp.INFECTED, ["dbghelp.dll"] = mp.INFECTED, ["apiclient.dll"] = mp.INFECTED,
    ["pputillib.dll"] = mp.INFECTED, ["oart.dll"] = mp.INFECTED, ["psregapi.dll"] = mp.INFECTED,
    ["traceapi.dll"] = mp.INFECTED, ["libxml2.dll"] = mp.INFECTED,
    ["vulcanmessage5.dll"] = mp.INFECTED, ["gude.dll"] = mp.INFECTED,
    ["libvlccore.dll"] = mp.INFECTED, ["vmwarebase.dll"] = mp.INFECTED, ["d3d11.dll"] = mp.INFECTED,
    ["libmupdf.dll"] = mp.INFECTED, ["castlelib.dll"] = mp.INFECTED,
    ["certificatevalidation.dll"] = mp.INFECTED, ["sqlite3.dll"] = mp.LOWFI,
    ["ffmpeg.dll"] = mp.LOWFI, ["jli.dll"] = mp.LOWFI
  }
  return r87_0[p87_0]
end

function isCommonScheduledTaskCommand(p88_0)
  if p88_0 == nil or #p88_0 <= 5 then
    return
  end
  local r88_0 = string.lower(p88_0)
  p88_0 = r88_0
  r88_0 = {}
  local r88_1 = { " /ua /installsource scheduler", " /c" }
  r88_0["\\microsoft\\edgeupdate\\microsoftedgeupdate.exe"] = r88_1
  r88_1 = { " /target:computer", " /target:user" }
  r88_0["C:\\Windows\\System32\\gpupdate.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\taskhostw.exe"] = r88_1
  r88_1 = { " -upload" }
  r88_0["C:\\Windows\\System32\\wermgr.exe"] = r88_1
  r88_1 = { " --wake --system" }
  r88_0["\\Google\\GoogleUpdater\\"] = r88_1
  r88_1 = {}
  r88_0["\\Microsoft Intune Management Extension\\ClientCertCheck.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\wsqmcons.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\appidcertstorecheck.exe"] = r88_1
  r88_1 = { " /checkin" }
  r88_0["\\Common Files\\microsoft shared\\ClickToRun\\officesvcmgr.exe"] = r88_1
  r88_1 = { " ReportPolicies", " StartScan", " StartWork" }
  r88_0["C:\\Windows\\System32\\UsoClient.exe"] = r88_1
  r88_1 = { " /frequentupdate SCHEDULEDTASK ", " /WatchService" }
  r88_0["\\Common Files\\microsoft shared\\ClickToRun\\OfficeC2RClient.exe"] = r88_1
  r88_1 = {}
  r88_0["\\Common Files\\Adobe\\ARM\\1.0\\AdobeARM.exe"] = r88_1
  r88_1 = { " /offerraupdate" }
  r88_0["C:\\Windows\\System32\\raserver.exe"] = r88_1
  r88_1 = {}
  r88_0["\\Microsoft Office\\root\\Office16\\SDXHelper.exe"] = r88_1
  r88_1 = {
    " C:\\WINDOWS\\system32\\PcaSvc.dll,PcaPatchSdbTask",
    " C:\\WINDOWS\\system32\\Windows.StateRepositoryClient.dll,StateRepositoryDoMaintenanceTasks",
    " C:\\WINDOWS\\system32\\CapabilityAccessManager.dll,CapabilityAccessManagerDoStoreMaintenance",
    " Startupscan.dll,SusRunTask"
  }
  r88_0["C:\\Windows\\System32\\rundll32.exe"] = r88_1
  r88_1 = { " $(Arg0) $(Arg1) $(Arg2)" }
  r88_0["C:\\Windows\\System32\\dsregcmd.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\AppHostRegistrationVerifier.exe"] = r88_1
  r88_1 = {
    " start InventorySvc", " start pushtoinstall registration", " start w32time task_started",
    " start wuauserv", " start pushtoinstall login"
  }
  r88_0["C:\\Windows\\System32\\sc.exe"] = r88_1
  r88_1 = {}
  r88_0["\\appdata\\local\\microsoft\\onedrive\\onedrivestandaloneupdater.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\UCPDMgr.exe"] = r88_1
  r88_1 = { " SystemCxt", " UserCxt" }
  r88_0["C:\\Windows\\System32\\DeviceCensus.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\dstokenclean.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\appidpolicyconverter.exe"] = r88_1
  r88_1 = { " -z" }
  r88_0["C:\\Windows\\System32\\DiskSnapshot.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\Speech_OneCore\\common\\SpeechModelDownload.exe"] = r88_1
  r88_1 = { " poll" }
  r88_0["\\Windows Autopatch Client Broker\\ClientBroker\\ClientBroker.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\dmclient.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\ClipRenew.exe"] = r88_1
  r88_1 = {
    " -IdleTask -TaskName WdVerification", " -IdleTask -TaskName WdCacheMaintenance",
    " -IdleTask -TaskName WdCleanup"
  }
  r88_0["C:\\ProgramData\\Microsoft\\Windows Defender\\Platform\\"] = r88_1
  r88_1 = { " /SendHeartbeat" }
  r88_0["C:\\Windows\\System32\\UIEOrchestrator.exe"] = r88_1
  r88_1 = { " CSP" }
  r88_0["C:\\Windows\\System32\\hvsievaluator.exe"] = r88_1
  r88_1 = {}
  r88_0["\\Microsoft Intune Management Extension\\ClientHealthEval.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\CCM\\CcmEval.exe"] = r88_1
  r88_1 = {
    "windowsdefenderatponboardingscript.cmd", "defenderatponboarding.cmd", "\\Utility\\GPODATA\\"
  }
  r88_0["C:\\Windows\\System32\\cmd.exe"] = r88_1
  r88_1 = { " /autocleanstoragesense /d C:" }
  r88_0["C:\\Windows\\System32\\cleanmgr.exe"] = r88_1
  r88_1 = { " /pushregistration" }
  r88_0["\\Microsoft Office\\root\\vfs\\ProgramFilesCommonX64\\Microsoft Shared\\Office16\\opushutil.exe"] = r88_1
  r88_1 = {}
  r88_0["\\Microsoft OneDrive\\OneDriveStandaloneUpdater.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\Microsoft.Data.UsageAndQualityInsights.MaintenanceTask.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\MusNotification.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\lpremove.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\LocationNotificationWindows.exe"] = r88_1
  r88_1 = {}
  r88_0["\\RUXIM\\PLUGScheduler.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\UCConfigTask.exe"] = r88_1
  r88_1 = { " sync" }
  r88_0["C:\\Windows\\System32\\msfeedssync.exe"] = r88_1
  r88_1 = {
    "\\Cloud\\DSREGCMD' ; $DPath = $RPath.Replace('HKEY_LOCAL_MACHINE','HKLM:') ; Remove-Item -Path $DPath -Recurse -EA 0 ; $pattern = ' *[A-z]+ : [A-z0-9\\{\\}]+ *' ; $dsregcmd = dsregcmd /status ",
    "\\Cloud\\Intune' ; $DPath = $RPath.Replace('HKEY_LOCAL_MACHINE','HKLM:') ; Remove-ItemProperty -Path $DPath -Name '*' -EA 0 ; $QPath = 'HKLM:\\SOFTWARE\\Microsoft\\Enrollments'"
  }
  r88_0["C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"] = r88_1
  r88_1 = { " ExecuteScheduledSPPCreation" }
  r88_0["C:\\Windows\\System32\\SrTasks.exe"] = r88_1
  r88_1 = { "http://localhost/WebAPI/Utilities/support/DefenderDatUpdate" }
  r88_0["\\util\\ServiceExecution.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\dxgiadaptercache.exe"] = r88_1
  r88_1 = {}
  r88_0["\\Bin\\EpicHyperdriveTempDataCleanup.exe"] = r88_1
  r88_1 = { " wacheck" }
  r88_0["\\Microsoft Office\\root\\vfs\\ProgramFilesCommonX64\\Microsoft Shared\\Office16\\ActionsServer\\ActionsServer.exe"] = r88_1
  r88_1 = {}
  r88_0["C:\\Windows\\System32\\CompatTelRunner.exe"] = r88_1
  r88_1 = { " GenericMessagingAddin_Pulsation" }
  r88_0["\\ScheduleEventAction.exe"] = r88_1
  r88_1 = { "/turn 5 /source LogonIdleTask" }
  r88_0["C:\\Windows\\System32\\provtool.exe"] = r88_1
  r88_1 = { " /ItemId:db9484d4-5488-4a63-98a1-368bd3b988e8 /DelayForMax:7200" }
  r88_0["\\Thycotic\\Agents\\Agent\\TaskExecutor.exe"] = r88_1
  r88_1 = { "C:\\Windows\\Packagelogs\\AADBrokerPlugIn_Remediation\\" }
  r88_0["C:\\Windows\\System32\\wscript.exe"] = r88_1
  r88_1 = { " Task" }
  r88_0["\\ManageEngine\\UEMS_Agent\\bin\\dcagentupgrader.exe"] = r88_1
  r88_1 = pairs
  for r88_2, r88_3 in r88_1(r88_0) do
    if r88_2 ~= nil and string.find(p88_0, string.lower(r88_2), 1, true) then
      if #r88_3 == 0 then
        return true
      end
      for r88_4, r88_5 in ipairs(r88_3) do
        if r88_5 ~= nil and string.find(p88_0, string.lower(r88_5), 1, true) then
          return true
        end
      end
      return false
    end
  end
  return false
end

function isCommonScheduledTaskFile(p89_0)
  if p89_0 == nil or #p89_0 <= 5 then
    return
  end
  p89_0 = string.lower(p89_0)
  if not StringEndsWith(p89_0, "defenderatponboardingscript.cmd")
    and not StringEndsWith(p89_0, "defenderatponboarding.cmd")
    and not StringEndsWith(p89_0, "\\programdata\\airwatch\\cache\\disable_netbios.ps1")
    and not StringEndsWith(p89_0, "\\windows\\ise\\ise_add_profile.bat")
    and not StringEndsWith(p89_0, "\\temp\\clientcert.ps1")
    and not StringEndsWith(p89_0, "\\program files\\wpdf\\scripts\\tsuserex.dll")
    and not StringEndsWith(p89_0, "\\windows\\disable-usbhubsleep.ps1")
    and not StringEndsWith(p89_0, "\\windows\\logs\\defender-onboard-startupscript.ps1")
    and not StringEndsWith(p89_0, "\\vf\\vf-removechat.ps1")
    and not StringEndsWith(p89_0, "w11migration\\dot1svc.ps1")
    and not StringEndsWith(p89_0, "\\pcdiag_m365\\run.ps1")
    and not StringEndsWith(p89_0, "\\support\\utils\\session\\bat\\unlockevent.bat")
    and not StringEndsWith(p89_0, "\\yvapps\\unlock.bat")
    and not StringEndsWith(p89_0, "\\anima-scripts\\delete_logs.bat")
    and not StringEndsWith(p89_0, "\\package-deploy\\enabledefender.cmd")
    and not StringEndsWith(p89_0, "\\temp\\lansweeper\\install.cmd")
    and not StringEndsWith(p89_0, "\\it\\lockscreen\\lockscreen.ps1")
    and not StringEndsWith(p89_0, "\\wdf\\cfr.ps1") then
    local r89_0 = { "windowsdefenderatponboardingpackage", "windowsdefenderatponboardingscript" }
    for r89_1, r89_2 in pairs(r89_0) do
      if string.find(p89_0, r89_2, 1, true) then
        return true
      end
    end
    local r89_3 = string.match(p89_0, "([^\\]+)$") or p89_0
    if r89_3 == nil or #r89_3 <= 4 then
      return
    end
    local r89_4 = {
      ["ws1_health_utility.ps1"] = true, ["configmgrclienthealth.ps1"] = true,
      ["enable-hybridazureadscheduletasks.ps1"] = true,
      ["psappdeploytoolkit-executeasuser.vbs"] = true, ["mdm_dsmcheck.ps1"] = true,
      ["noahbu.cmd"] = true, ["pslogcleanup.ps1"] = true, ["uemslogcollector.exe"] = true,
      ["map-paw-share.ps1"] = true, ["deploy-osicfromgpo.ps1"] = true,
      ["configmgrclienthealth.exe"] = true, ["sccm_client_install_v2.4.ps1"] = true,
      ["lock.bat"] = true, ["rungpresultreport.vbs"] = true,
      ["bitsadmin_change_to_no_proxy.bat"] = true, ["devicecomplianceonboardingscript.cmd"] = true,
      ["smime_auto_installation.vbs"] = true, ["manage.dla.ps1"] = true,
      ["invoke-mdesetup.ps1"] = true, ["enable-bitlocker.ps1"] = true,
      ["backup-log_v0.33.ps1"] = true, ["migrate-client.cmd"] = true,
      ["zd_nimda_cockpit_pw.ps1"] = true, ["dnswinsconfig.exe"] = true,
      ["setmcafeecustomprops.ps1"] = true, ["enableinheritance_final.ps1"] = true,
      ["vf-wdatp_registry.xml"] = true, ["windowsdefenderatponboardingscript.cmd"] = true,
      ["runtoasthidden.cmd"] = true, ["citrixvda_modreg.bat"] = true, ["win32agentipc.exe"] = true,
      ["set-ahcbitlockersequence.ps1"] = true, ["wudu.vbs"] = true,
      ["sccmclienteval_new.ps1"] = true, ["outlooksmime.vbs"] = true,
      ["get-newteamsversion.ps1"] = true, ["java_deployment.ps1"] = true,
      ["pxs_bvalidation.ps1"] = true, ["saverecoverykey.ps1"] = true, ["check-gpo.ps1"] = true,
      ["lockevent.bat"] = true, ["gporunpsscriptsilent.vbs"] = true,
      ["removelocalprofiles.ps1"] = true, ["configmgrstartup.vbs"] = true,
      ["clean-usertemp.ps1"] = true, ["ubsremoteassistendtasks.ps1"] = true, ["rac.exe"] = true,
      ["firstlaunch_teams.ps1"] = true, ["cer_automation.bat"] = true,
      ["launchdeployapps.vbs"] = true, ["intunescript-imageinformation-user.ps1"] = true,
      ["configupdater.ps1"] = true, ["addskypemeetingsplugintofirewall.ps1"] = true,
      ["users_fw.ps1"] = true, ["get-usersession-logoff-old-v1.ps1"] = true,
      ["user_logging_final.ps1"] = true, ["optumscriptswitchupdate.bat"] = true,
      ["reboot_check_updated.ps1"] = true, ["pcm-ucheck.ps1"] = true,
      ["remove-intunecurrentenrollment.ps1"] = true, ["browsercacheremoval.bat"] = true,
      ["workstationmanager-privilegerevocation.ps1"] = true, ["discovery-windows.exe"] = true,
      ["chama_ps1_configpatch.vbs"] = true, ["wudu_rollback.vbs"] = true, ["mugshotv2.bat"] = true,
      ["802.1x_authentication_settings.xml"] = true, ["docusnapscript-run.ps1"] = true,
      ["auditposte.exe"] = true, ["launchpsscript.vbs"] = true, ["itunes_stop.vbs"] = true,
      ["updatecertificat.ps1"] = true, ["windowsdefenderatplocalonboardingscript.cmd"] = true,
      ["n5start.ps1"] = true, ["winget-upgrade.ps1"] = true, ["dateprofile.ps1"] = true,
      ["setwin10smoptions.cmd"] = true, ["qualyscloudagentinstallation.bat"] = true,
      ["deployirtk.cmd"] = true, ["helios_it_zd_inventarisierung_ocs.ps1"] = true,
      ["monitor-nexthinkservice.ps1"] = true, ["readingrjpolicy.ps1"] = true,
      ["mdm_edgeupdatehelper.ps1"] = true, ["unlockevent.bat"] = true,
      ["corporatebranding.bat"] = true, ["vf-mde-enable.ps1"] = true, ["migrate-user.vbs"] = true,
      ["iemode_update.bat"] = true, ["configmgrstartup_schedtask.wsf"] = true,
      ["uploadappjson.ps1"] = true, ["ecm-nl-live.js"] = true, ["1096notify.ps1"] = true,
      ["idleuserlogoff-8hours.ps1"] = true, ["zscaler_audit.ps1"] = true,
      ["disable-windowsfirewalllocalsmbrules.ps1"] = true, ["update_win_features.bat"] = true,
      ["chrome_bku_install.exe"] = true, ["lockscreensaver.exe"] = true,
      ["hivenightmarefix.ps1"] = true, ["automatic_pagefile_tuning.ps1"] = true,
      ["xmlchecker.ps1"] = true, ["cleanup.ps1"] = true, ["lockscreenbranding.ps1"] = true,
      ["print_disable.bat"] = true, ["sp_poshacme_renewal.ps1"] = true,
      ["healthcheckmdatp.ps1"] = true, ["delprof_adm.log"] = true,
      ["526-get-mcgtcpconnections.ps1"] = true, ["createczlocadmin.ps1"] = true,
      ["karmakvpnping.cmd"] = true, ["configbackgroundsync.ps1"] = true,
      ["push-ordrepattributes.ps1"] = true, ["mbamcheckstatus.vbs"] = true,
      ["get_csv_certificate.vbs"] = true, ["scheduleclientshutdowncommand.ps1"] = true,
      ["wwan_info_to_reg.ps1"] = true, ["removelocalwinrm.ps1"] = true, ["casvc-install.exe"] = true,
      ["checkmecm.bat"] = true, ["clear-printerdefaults.vbs"] = true, ["rebootlogging.ps1"] = true,
      ["nettoyagearchiveslogsec.ps1"] = true, ["wfdv_printers_local.vbs"] = true,
      ["alwaysonvpn_device.ps1"] = true, ["hwinventory.ps1"] = true,
      ["appdatafirewallrules.ps1"] = true, ["eyextensioninstallforcelist.exe"] = true,
      ["chrome_bku_tray.exe"] = true, ["sp_removejob.cmd"] = true, ["startupevent.bat"] = true,
      ["installskysea.vbe"] = true, ["skyseasetup.bat"] = true,
      ["AuditCopyCATsForAppVapps-ng.ps1"] = true, ["QuickAssistRemoval.ps1"] = true,
      ["java8uninstall.ps1"] = true, ["dsregcmd-leave.log"] = true, ["getPcInfo.ps1"] = true,
      ["prelude_fake_disk_mount.txt"] = true, ["eyofficetargetedsettings.exe"] = true,
      ["sp_audit_poshacme_certs_v2.ps1"] = true, ["auditcopycatsforappvapps-ng.ps1"] = true,
      ["quickassistremoval.ps1"] = true, ["acrlogin.log"] = true, ["set-script.ps1"] = true,
      ["random_reboot.ps1"] = true, ["wfdv_meditech_local.vbs"] = true,
      ["setpermissions.cmd"] = true, ["print_enable.bat"] = true, ["onboarding.bat"] = true,
      ["disable_netbios.ps1"] = true, ["uninstall_solarwinds_client_components.ps1"] = true,
      ["defaultimappregistrysettings.ps1"] = true, ["runhidden.vbs"] = true, ["pulizia.bat"] = true,
      ["qaw.proxcardcredprov.log"] = true, ["!!flash-uninstall-anddeletefiles.bat"] = true,
      ["backrunarg.vbs"] = true, ["controlproxy.ps1"] = true, ["pcut_upgrade.ps1"] = true,
      ["gp.vbs"] = true, ["audio_driver_remove.bat"] = true, ["eas delete.ps1"] = true,
      ["rebootwithdelay.vbs"] = true, ["sophoscentral-disinstalla-agent.ps1"] = true,
      ["checknetworkandteams_dnsdomain.ps1"] = true, ["disableflightmode.ps1"] = true,
      ["cpdloginscript.bat"] = true, ["dash-file-dist_bootstrapper.ps1"] = true,
      ["loghealthcentrally.ps1"] = true, ["retail-biosmanagement.ps1"] = true,
      ["bitlocker-enrollment.cmd"] = true, ["ciphersuite.ps1"] = true, ["onboard-device.cmd"] = true,
      ["set-disabledomaincreds.ps1"] = true, ["mdeonboardingwin10-11.cmd"] = true,
      ["exsynclauncher.vbs"] = true, ["windows-os-mmg_services_hostfile_update.bat"] = true,
      ["registerdns.ps1"] = true, ["cyberhavenmanager.exe"] = true, ["heartbeat.vbs"] = true,
      ["flex_sched_runinventory.bat"] = true, ["installagentscript.vbs"] = true,
      ["launchedgechromels.vbs"] = true, ["kiosk_reboot.vbs"] = true,
      ["sccm_metered_fix.ps1"] = true, ["desktop.ini"] = true, ["appxpackage_removal.vbs"] = true,
      ["gpo-scheduledtask-islhd-filesync.bat"] = true, ["fixunquotedserviceuninstall.ps1"] = true,
      ["invoke-setdevicetimestamp.ps1"] = true, ["deploymma2019.cmd"] = true,
      ["print_delete.bat"] = true, ["deleteprofiles-90days.ps1"] = true,
      ["loginreporttosql.exe"] = true, ["autosetup.vbe"] = true, ["mappadischi.vbs"] = true,
      ["set-processmitigation.ps1"] = true, ["cra_wifi_ecaw.cmd"] = true,
      ["windowsdefenderatp-gpo-onboarding.cmd"] = true, ["onedrivepcmover_scheduledtask.vbs"] = true,
      ["sendteamslogs.ps1"] = true, ["analyze-my-home-drive.vbs"] = true,
      ["install-eduroam-wlan-profile-8021xteapauthcheck.ps1"] = true, ["checkreboot.ps1"] = true,
      ["report.vbs"] = true, ["logonalert_win11.vbs"] = true, ["hide-console.vbs"] = true,
      ["regcmdstarthidden.exe"] = true, ["mappadischi.exe"] = true,
      ["karmakfusionbranchserver.ps1"] = true, ["delete_old_archived_winevent_logs.ps1"] = true,
      ["rem_everyone.ps1"] = true, ["selfscan.exe"] = true, ["updatewlapps-system.ps1"] = true
    }
    if r89_4[r89_3] == nil then
      return false
    end
    return true
  end
  return true
end

function getCommandLineType(p90_0)
  if p90_0 and not (#p90_0 <= 3) then
    local r90_0 = p90_0:lower()
    local r90_1 = {
      { key = "node.exe", type = "nodejs", gentype = "script" },
      { key = "node ", type = "nodejs", gentype = "script" },
      { key = "wscript", type = "wsh", gentype = "script" },
      { key = "cscript", type = "wsh", gentype = "script" },
      { key = "mshta", type = "mshta", gentype = "script" },
      { key = "python.exe", type = "python", gentype = "script" },
      { key = "python ", type = "python", gentype = "script" },
      { key = "java.exe", type = "java", gentype = "script" },
      { key = "java ", type = "java", gentype = "script" },
      { key = "rundll32", type = "rundll32", gentype = "dll_loader" },
      { key = "regsvr32", type = "regsvr32", gentype = "dll_loader" },
      { key = "curl", type = "curl", gentype = "downloader" },
      { key = "wget", type = "wget", gentype = "downloader" },
      { key = "certutil", type = "certutil", gentype = "downloader" },
      { key = "msiexec", type = "msi", gentype = "script" },
      { key = "powershell_ise", type = "powershell", gentype = "script" },
      { key = "pwsh", type = "powershell", gentype = "script" },
      { key = "powershell", type = "powershell", gentype = "script" },
      { key = "wmic", type = "wmic", gentype = "wmi" },
      { key = "cmd.exe", type = "cmd", gentype = "shell" },
      { key = "cmd ", type = "cmd", gentype = "shell" }
    }
    for r90_2 = 1, #r90_1 do
      local r90_3 = r90_1[r90_2]
      if r90_0:find(r90_3.key, 1, true) then
        return r90_3.type, r90_3.gentype
      end
    end
    return nil, nil
  end
  return nil, nil
end

function isKnownCleanPathContext(p91_0)
  if p91_0 == nil or #p91_0 <= 3 then
    return
  end
  p91_0 = string.lower(normalize_path(p91_0))
  if string.sub(p91_0, 1, 1) == "c" then
    if string.find(p91_0, "\\program files", 1, true) == nil
      and string.find(p91_0, "c:\\windows\\system32\\", 1, true) == nil
      and string.find(p91_0, "c:\\windows\\syswow64\\", 1, true) == nil
      and string.find(p91_0, "windows\\winsxs", 1, true) == nil
      and string.find(p91_0, "windows\\assembly", 1, true) == nil
      and string.find(p91_0, "windows\\microsoft.net", 1, true) == nil
      and string.find(p91_0, "\\$windows.\\", 1, true) == nil
      and string.find(p91_0, "\\windows.\\", 1, true) == nil
      and string.find(p91_0, "\\winpe\\windows\\", 1, true) == nil
      and string.find(p91_0, "\\$winreagent\\", 1, true) == nil
      and string.find(p91_0, "\\bin", 1, true) == nil
      and string.find(p91_0, "\\dev", 1, true) == nil
      and string.find(p91_0, "\\drvsetup", 1, true) == nil
      and string.find(p91_0, "\\lib\\", 1, true) == nil
      and string.find(p91_0, "\\git\\", 1, true) == nil
      and string.find(p91_0, "\\wintrv", 1, true) == nil
      and string.find(p91_0, "\\x64", 1, true) == nil
      and string.find(p91_0, "debug", 1, true) == nil
      and string.find(p91_0, "release", 1, true) == nil
      and string.find(p91_0, "\\sccmcontentlib\\filelib", 1, true) == nil
      and string.find(p91_0,
          "\\appdata\\local\\basf is\\basf service monitor\\basf service monitor.exe", 1, true)
        == nil
      and string.find(p91_0, "c:\\bootstrapper\\", 1, true) == nil then
      return false
    end
    return true
  end
  return true
end

function getAndDecodePowershellEncodedCommand(p92_0, p92_1)
  if p92_0 == nil then
    return
  end
  local r92_0 = p92_0
  local r92_1 = p92_0
  local r92_2 = string.lower(r92_1)
  if r92_2 == "cmdhstr" or r92_2 == "bm" or r92_2 == "amsi" or r92_2 == "rtp" then
    r92_1 = r0_3(r92_1)
  end
  if r92_1 ~= nil and r92_1:sub(1, 4) == "pid:" then
    r92_0 = mp.GetProcessCommandLine(r92_1)
  end
  if r92_0 ~= nil and string.find(string.lower(r92_0), " -e", 1, true) ~= nil then
    local r92_3 = r92_0:match('[%-/]%s*[Ee][Nn][Cc][Oo][Dd][Ee][Dd][Cc][Oo][Mm][Mm][Aa][Nn][Dd]%s+"([A-Za-z0-9+/=]+)"')
      or r92_0:match('[%-/]%s*[Ee][Nn][Cc]%s+"([A-Za-z0-9+/=]+)"')
      or r92_0:match('[%-/]%s*[Ee]%s+"([A-Za-z0-9+/=]+)"')
    if r92_3 and (p92_1 == nil or #r92_3 <= p92_1) then
      local r92_4 = MpCommon.Base64Decode(r92_3)
      if r92_4 then
        local r92_5 = normalize_unicode(r92_4)
        return r92_5
      end
      return nil
    end
    local r92_6 = r92_0:match("[%-/]%s*[Ee][Nn][Cc][Oo][Dd][Ee][Dd][Cc][Oo][Mm][Mm][Aa][Nn][Dd]%s+([A-Za-z0-9+/=]+)")
      or r92_0:match("[%-/]%s*[Ee][Nn][Cc]%s+([A-Za-z0-9+/=]+)")
      or r92_0:match("[%-/]%s*[Ee]%s+([A-Za-z0-9+/=]+)")
    if r92_6 and (p92_1 == nil or #r92_6 <= p92_1) then
      local r92_7 = MpCommon.Base64Decode(r92_6)
      if r92_7 then
        return (normalize_unicode(r92_7))
      end
    end
    return nil
  end
  return nil
end

function extractUrlParts(p93_0)
  if p93_0 == nil or #p93_0 < 5 then
    return
  end
  local r93_0 = string.lower(p93_0)
  p93_0 = r93_0
  r93_0 = p93_0.match
  local r93_1, r93_2 = r93_0(p93_0, "^([%a][%w+%-%.]*)://([^/%s]+)")
  if r93_2 then
    local r93_3 = string.lower(r93_1)
    r93_1 = r93_3
    r93_3 = r93_2:match(":(%d+)$")
    local r93_4 = r93_2:gsub(":%d+$", "")
    r93_2 = r93_4
    r93_4 = false
    local r93_5 = r93_2:match("^%d+%.%d+%.%d+%.%d+$")
    if r93_5 then
      local r93_6, r93_7, r93_8, r93_9
      if tonumber(r93_6) <= 255
        and tonumber(r93_7) <= 255
        and tonumber(r93_8) <= 255
        and tonumber(r93_9) <= 255 then
        r93_4 = true
      end
    elseif r93_2:match("^%[[%x:%.]+%]$") then
      r93_4 = true
    end
    local r93_10
    r93_5 = nil
    r93_10 = nil
    local r93_11 = false
    local r93_12 = p93_0:match("^[%a][%w+%-%.]*://[^/%s]+(/[^%s?#]*)")
    if r93_12 ~= nil and r93_12 ~= "" then
      local r93_13 = r93_12:match("/([^/]+)$")
      if r93_13 ~= nil and r93_13 ~= "" then
        r93_5 = r93_13
        r93_5, r93_10, r93_11 = r93_5, r93_13:match("%.([^.]+)$"), StringEndsWith(p93_0, r93_5)
      end
    end
    if r93_4 then
      local r93_14, r93_15 = nil, nil
      local r93_16 = r93_3
      local r93_17 = r93_5
      local r93_18 = r93_10
      local r93_19 = r93_1
      local r93_20 = r93_4
      local r93_21 = r93_11
      return r93_14, r93_15, r93_16, r93_17, r93_18, r93_19, r93_20, r93_21
    end
    local r93_22, r93_23 = r93_2:match("([^.]+)%.([^.]+)$")
    if r93_22 and r93_23 then
      local r93_24 = r93_22
      local r93_25 = r93_23
      local r93_26 = r93_3
      local r93_27 = r93_5
      local r93_28 = r93_10
      local r93_29 = r93_1
      local r93_30 = r93_4
      local r93_31 = r93_11
      return r93_24, r93_25, r93_26, r93_27, r93_28, r93_29, r93_30, r93_31
    end
    local r93_32, r93_33 = nil, nil
    local r93_34 = r93_3
    local r93_35 = r93_5
    local r93_36 = r93_10
    local r93_37 = r93_1
    local r93_38 = r93_4
    local r93_39 = r93_11
    return r93_32, r93_33, r93_34, r93_35, r93_36, r93_37, r93_38, r93_39
  end
  return nil, nil, nil, nil, nil, nil
end
