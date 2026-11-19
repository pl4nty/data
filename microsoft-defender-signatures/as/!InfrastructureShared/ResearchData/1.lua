-- Threat: !InfrastructureShared
-- Name: ResearchData
-- Type: 1
-- Includes: LuaFuncHelper

function validate_research_data(l_1_0, l_1_1)
  local l_1_2 = 1024
  
  local l_1_3 = 4
  local l_1_4 = 32
  if l_1_4 < string.len(l_1_0) then
    return false
  end
  return l_1_3 <= string.len(l_1_1) and l_1_2 >= string.len(l_1_1)
end

function set_research_data(l_2_0, l_2_1, l_2_2)
  if validate_research_data(l_2_0, l_2_1) == false then
    return false
  end
  if l_2_2 then
    bm.add_related_string(l_2_0, l_2_1, bm.RelatedStringBMReport)
  else
    local l_2_3 = "MpInternal_researchdata="
    local l_2_4 = l_2_3 .. l_2_0 .. "=" .. l_2_1
    mp.set_mpattribute(l_2_4)
  end
  return true
end

function set_research_data_ex(...)
  local l_3_0, l_3_1
  local l_3_2 = "MpInternal_researchdata="
  local l_3_3 = l_3_2
  for l_3_4, l_3_5 in ipairs({
    ...
  }) do
    if l_3_4 % 2 == 1 then
      l_3_0 = l_3_5
    else
      l_3_1 = l_3_5
      if not validate_research_data(l_3_0, l_3_1) then
        return false
      end
      local l_3_6 = l_3_0 .. "=" .. l_3_1
      if l_3_4 <= 2 then
        l_3_3 = l_3_3 .. l_3_6
      else
        l_3_3 = l_3_3 .. "," .. l_3_6
      end
    end
  end
  mp.set_mpattribute(l_3_3)
  return true
end

local function l_0_0()
  return 4
end

function initRQFTAT()
  local l_5_0 = "FTAT_STC"
  local l_5_1 = l_0_0()
  local l_5_2 = GetRollingQueue(l_5_0)
  local l_5_3 = MpCommon.GetCurrentTimeT()
  if l_5_2 == nil then
    for l_5_4 = 1, l_5_1 do
      AppendToRollingQueue(l_5_0, l_5_4, l_5_3, 157680000, 300)
    end
  elseif GetRollingQueueCount(l_5_0) ~= l_5_1 then
    do
      local l_5_5 = {}
      for l_5_6 in pairs(l_5_2) do
        l_5_5[l_5_2[l_5_6].key] = true
      end
      for l_5_7 = 1, l_5_1 do
        if not l_5_5[l_5_7] then
          AppendToRollingQueue(l_5_0, l_5_7, l_5_3, 157680000)
        end
      end
    end
  elseif l_5_3 - l_5_2[1].insert_time > 94608000 then
    for l_5_8 = 1, l_5_1 do
      local l_5_9 = l_5_2[l_5_8].insert_time
      AppendToRollingQueue(l_5_0, l_5_8, l_5_9, 157680000)
    end
  end
  return
end

function isFirstTimeATActive()
  return versioning.IsEnterprise() or versioning.IsServer() or versioning.IsSeville()
end

function updateToolID(l_7_0, l_7_1, l_7_2)
  local l_7_3, l_7_4, l_7_5
  local l_7_6 = "FTAT_" .. l_7_0
  l_7_5, l_7_3 = IsKeyInRollingQueue(l_7_6 .. "_C", l_7_2, true)
  if l_7_5 == true then
    l_7_3 = l_7_3 + 1
  else
    l_7_3 = 1
  end
  AppendToRollingQueue(l_7_6 .. "_C", l_7_2, l_7_3, 157680000, 300)
  l_7_5, l_7_4 = IsKeyInRollingQueue(l_7_6 .. "_LT", l_7_2, true)
  if l_7_5 == false then
    l_7_4 = 0
  end
  AppendToRollingQueue(l_7_6 .. "_LT", l_7_2, l_7_1, 157680000, 300)
  return l_7_3, l_7_4
end

local function l_0_1(l_8_0)
  local l_8_1 = {}
  local l_8_2 = GetRollingQueue(l_8_0)
  if l_8_2 == nil then
    return l_8_1
  end
  for l_8_3 in pairs(l_8_2) do
    l_8_1[#l_8_1 + 1] = l_8_2[l_8_3].key
  end
  return l_8_1
end

function createToolsList(l_9_0)
  local l_9_1 = l_0_1(l_9_0)
  if l_9_1 == nil then
    return ""
  end
  return table.concat(l_9_1, ",")
end

local function l_0_2(l_10_0)
  local l_10_1
  local l_10_2 = l_10_0 - 1
  while true do
    l_10_1 = sigattr_tail[l_10_2].attribute
    if l_10_1 ~= 16389 and sigattr_tail[l_10_2].utf8p1:lower() == sigattr_tail[l_10_0].utf8p1:lower() then
      return l_10_1
    end
    l_10_2 = l_10_2 - 1
    if l_10_2 <= 1 then
      return nil
    end
  end
  return nil
end

function whatEventGeneratedThisEvent(l_11_0)
  local l_11_1 = mp.SIGATTR_LOG_SZ
  if type(l_11_0) == "string" then
    for l_11_2 = l_11_1, 1, -1 do
      if sigattr_tail[l_11_2].utf8p2 == l_11_0 then
        return l_0_2(l_11_2)
      end
    end
    return nil
  end
  return nil
end

function updateFTATData(l_12_0, l_12_1, l_12_2)
  initRQFTAT()
  local l_12_3 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Control\\TimeZoneInformation")
  local l_12_4 = -1
  if l_12_3 ~= nil then
    l_12_4 = sysio.GetRegValueAsDword(l_12_3, "ActiveTimeBias")
    if l_12_4 == nil then
      l_12_4 = -1
    end
  end
  local l_12_5 = bm.get_current_process_startup_info()
  local l_12_6, l_12_7
  if l_12_5 ~= nil then
    l_12_6, l_12_7 = pcall(MpCommon.QuerySessionInformationSession, l_12_2, MpCommon.WTSUserName)
    if not l_12_6 then
      l_12_7 = "UserNameError"
    end
  end
  if l_12_7 == nil or l_12_7:len() == 0 then
    l_12_7 = "UserNameError"
  end
  local l_12_8 = #l_12_7
  l_12_7 = mp.crc32(0, l_12_7, 1, l_12_8)
  local l_12_9 = MpCommon.GetCurrentTimeT()
  if l_12_9 == nil or l_12_9 == 0 then
    l_12_9 = 1604188800
  end
  local l_12_10, l_12_11 = IsKeyInRollingQueue("FTAT_STC", l_12_0, true)
  if l_12_10 == false then
    l_12_11 = l_12_9
  end
  local l_12_12, l_12_13, l_12_14, l_12_15
  l_12_12, l_12_13 = updateToolID(l_12_7, l_12_9, l_12_1)
  l_12_14, l_12_15 = updateToolID("PC", l_12_9, l_12_1)
  local l_12_16 = createToolsList("FTAT_PC_C")
  local l_12_17 = l_12_1 .. "_" .. l_12_11 .. "_" .. l_12_9 .. "_" .. l_12_12 .. "_" .. l_12_13 .. "_" .. l_12_14 .. "_" .. l_12_15 .. "_" .. l_12_16 .. "_" .. l_12_4
  local l_12_18 = l_12_9 - l_12_13
  return l_12_17, l_12_18
end

local function l_0_3(l_13_0, l_13_1)
  local l_13_2 = {}
  local l_13_3 = {}
  local l_13_4 = GetRollingQueue(l_13_0)
  if l_13_4 == nil then
    return {}
  end
  for l_13_5 in pairs(l_13_4) do
    if l_13_1 < l_13_4[l_13_5].value then
      l_13_3[#l_13_3 + 1] = l_13_4[l_13_5].key
    else
      l_13_2[#l_13_2 + 1] = l_13_4[l_13_5].key
    end
  end
  return table.concat(l_13_3, ","), table.concat(l_13_2, ",")
end

function getToolsUsedBeforeAfter(l_14_0)
  if isFirstTimeATActive() == false then
    return false
  end
  local l_14_1 = l_0_0()
  local l_14_2 = MpCommon.GetCurrentTimeT()
  local l_14_3 = l_14_2 - l_14_0 * 60 * 60 * 24
  local l_14_4 = "FTAT_PC_LT"
  local l_14_5, l_14_6
  l_14_6, l_14_5 = l_0_3(l_14_4, l_14_3)
  local l_14_7 = IsKeyInRollingQueue("FTAT_STC", l_14_1, true)
  local l_14_8 = l_14_2 - l_14_7
  return l_14_8 .. "_" .. l_14_5 .. "_" .. l_14_6
end

function areTheseOrgsInThisCertChain(l_15_0, l_15_1)
  for l_15_2, l_15_3 in pairs(l_15_0) do
    if type(l_15_3) == "table" then
      if areTheseOrgsInThisCertChain(l_15_3, l_15_1) then
        return true
      end
    elseif type(l_15_3) == "string" and tostring(l_15_2) == "Organization" and l_15_1[mp.utf16to8(l_15_3)] then
      return true
    end
  end
  return false
end

function areTheseOrgInFileCertChain(l_16_0)
  local l_16_1 = mp.GetCertificateInfo()
  if l_16_1 == nil then
    return false
  end
  if areTheseOrgsInThisCertChain(l_16_1, l_16_0) then
    return true
  end
  return false
end

function isTamperProtectionOn(l_17_0)
  local l_17_1 = 60
  local l_17_2 = "MpTamperProtectionState"
  if l_17_0 == nil then
    l_17_0 = true
  end
  if l_17_0 then
    if MpCommon.QueryPersistContextNoPath(l_17_2, "off") then
      return false
    end
    if MpCommon.QueryPersistContextNoPath(l_17_2, "on") then
      return true
    end
  end
  local l_17_3 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features")
  if l_17_3 then
    local l_17_4 = sysio.GetRegValueAsDword(l_17_3, "TamperProtection")
    if l_17_4 then
      if mp.bitand(l_17_4, 1) == 1 then
        MpCommon.SetPersistContextNoPath(l_17_2, {"on"}, l_17_1)
        return l_17_4
      else
        MpCommon.SetPersistContextNoPath(l_17_2, {"off"}, l_17_1)
        return false
      end
    end
  end
  return false
end
