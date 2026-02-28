local L0_1, L1_1, L2_1, L3_1, L4_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = 1024
  L3_2 = 4
  L4_2 = 32
  L5_2 = string
  L5_2 = L5_2.len
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if L4_2 < L5_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = string
  L5_2 = L5_2.len
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  L5_2 = L3_2 <= L5_2
  return L5_2
end

validate_research_data = L0_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = validate_research_data
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 == false then
    L3_2 = false
    return L3_2
  end
  if A2_2 then
    L3_2 = bm
    L3_2 = L3_2.add_related_string
    L4_2 = A0_2
    L5_2 = A1_2
    L6_2 = bm
    L6_2 = L6_2.RelatedStringBMReport
    L3_2(L4_2, L5_2, L6_2)
  else
    L3_2 = "MpInternal_researchdata="
    L4_2 = L3_2
    L5_2 = A0_2
    L6_2 = "="
    L7_2 = A1_2
    L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2
    L5_2 = mp
    L5_2 = L5_2.set_mpattribute
    L6_2 = L4_2
    L5_2(L6_2)
  end
  L3_2 = true
  return L3_2
end

set_research_data = L0_1

function L0_1(...)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L3_2 = "MpInternal_researchdata="
  L4_2 = L3_2
  L5_2 = ipairs
  L6_2 = {}
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = ...
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L6_2[4] = L10_2
  L6_2[5] = L11_2
  L6_2[6] = L12_2
  L6_2[7] = L13_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    L10_2 = L8_2 % 2
    if L10_2 == 1 then
      L1_2 = L9_2
    else
      L2_2 = L9_2
      L10_2 = validate_research_data
      L11_2 = L1_2
      L12_2 = L2_2
      L10_2 = L10_2(L11_2, L12_2)
      if not L10_2 then
        L10_2 = false
        return L10_2
      end
      L10_2 = L1_2
      L11_2 = "="
      L12_2 = L2_2
      L10_2 = L10_2 .. L11_2 .. L12_2
      if L8_2 <= 2 then
        L11_2 = L4_2
        L12_2 = L10_2
        L4_2 = L11_2 .. L12_2
      else
        L11_2 = L4_2
        L12_2 = ","
        L13_2 = L10_2
        L4_2 = L11_2 .. L12_2 .. L13_2
      end
    end
  end
  L5_2 = mp
  L5_2 = L5_2.set_mpattribute
  L6_2 = L4_2
  L5_2(L6_2)
  L5_2 = true
  return L5_2
end

set_research_data_ex = L0_1

function L0_1()
  local L0_2, L1_2
  L0_2 = 4
  return L0_2
end

function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = "FTAT_STC"
  L1_2 = L0_1
  L1_2 = L1_2()
  L2_2 = GetRollingQueue
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  L3_2 = MpCommon
  L3_2 = L3_2.GetCurrentTimeT
  L3_2 = L3_2()
  if L2_2 == nil then
    L4_2 = 1
    L5_2 = L1_2
    L6_2 = 1
    for L7_2 = L4_2, L5_2, L6_2 do
      L8_2 = AppendToRollingQueue
      L9_2 = L0_2
      L10_2 = L7_2
      L11_2 = L3_2
      L12_2 = 157680000
      L13_2 = 300
      L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
    end
  else
    L4_2 = GetRollingQueueCount
    L5_2 = L0_2
    L4_2 = L4_2(L5_2)
    if L4_2 ~= L1_2 then
      L4_2 = {}
      L5_2 = pairs
      L6_2 = L2_2
      L5_2, L6_2, L7_2 = L5_2(L6_2)
      for L8_2 in L5_2, L6_2, L7_2 do
        L9_2 = L2_2[L8_2]
        L9_2 = L9_2.key
        L4_2[L9_2] = true
      end
      L5_2 = 1
      L6_2 = L1_2
      L7_2 = 1
      for L8_2 = L5_2, L6_2, L7_2 do
        L9_2 = L4_2[L8_2]
        if not L9_2 then
          L9_2 = AppendToRollingQueue
          L10_2 = L0_2
          L11_2 = L8_2
          L12_2 = L3_2
          L13_2 = 157680000
          L9_2(L10_2, L11_2, L12_2, L13_2)
        end
      end
    else
      L4_2 = L2_2[1]
      L4_2 = L4_2.insert_time
      L4_2 = L3_2 - L4_2
      if 94608000 < L4_2 then
        L4_2 = 1
        L5_2 = L1_2
        L6_2 = 1
        for L7_2 = L4_2, L5_2, L6_2 do
          L8_2 = L2_2[L7_2]
          L8_2 = L8_2.insert_time
          L9_2 = AppendToRollingQueue
          L10_2 = L0_2
          L11_2 = L7_2
          L12_2 = L8_2
          L13_2 = 157680000
          L9_2(L10_2, L11_2, L12_2, L13_2)
        end
      end
    end
  end
  return
end

initRQFTAT = L1_1

function L1_1()
  local L0_2, L1_2
  L0_2 = versioning
  L0_2 = L0_2.IsEnterprise
  L0_2 = L0_2()
  if not L0_2 then
    L0_2 = versioning
    L0_2 = L0_2.IsServer
    L0_2 = L0_2()
    if not L0_2 then
      L0_2 = versioning
      L0_2 = L0_2.IsSeville
      L0_2 = L0_2()
    end
  end
  return L0_2
end

isFirstTimeATActive = L1_1

function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = "FTAT_"
  L7_2 = A0_2
  L6_2 = L6_2 .. L7_2
  L7_2 = IsKeyInRollingQueue
  L8_2 = L6_2
  L9_2 = "_C"
  L8_2 = L8_2 .. L9_2
  L9_2 = A2_2
  L10_2 = true
  L7_2, L8_2 = L7_2(L8_2, L9_2, L10_2)
  L3_2 = L8_2
  L5_2 = L7_2
  if L5_2 == true then
    L3_2 = L3_2 + 1
  else
    L3_2 = 1
  end
  L7_2 = AppendToRollingQueue
  L8_2 = L6_2
  L9_2 = "_C"
  L8_2 = L8_2 .. L9_2
  L9_2 = A2_2
  L10_2 = L3_2
  L11_2 = 157680000
  L12_2 = 300
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  L7_2 = IsKeyInRollingQueue
  L8_2 = L6_2
  L9_2 = "_LT"
  L8_2 = L8_2 .. L9_2
  L9_2 = A2_2
  L10_2 = true
  L7_2, L8_2 = L7_2(L8_2, L9_2, L10_2)
  L4_2 = L8_2
  L5_2 = L7_2
  if L5_2 == false then
    L4_2 = 0
  end
  L7_2 = AppendToRollingQueue
  L8_2 = L6_2
  L9_2 = "_LT"
  L8_2 = L8_2 .. L9_2
  L9_2 = A2_2
  L10_2 = A1_2
  L11_2 = 157680000
  L12_2 = 300
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  L7_2 = L3_2
  L8_2 = L4_2
  return L7_2, L8_2
end

updateToolID = L1_1

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = {}
  L2_2 = GetRollingQueue
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 == nil then
    return L1_2
  end
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2 in L3_2, L4_2, L5_2 do
    L7_2 = #L1_2
    L7_2 = L7_2 + 1
    L8_2 = L2_2[L6_2]
    L8_2 = L8_2.key
    L1_2[L7_2] = L8_2
  end
  return L1_2
end

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L1_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == nil then
    L2_2 = ""
    return L2_2
  end
  L2_2 = table
  L2_2 = L2_2.concat
  L3_2 = L1_2
  L4_2 = ","
  return L2_2(L3_2, L4_2)
end

createToolsList = L2_1

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2 - 1
  while true do
    L3_2 = sigattr_tail
    L3_2 = L3_2[L2_2]
    L1_2 = L3_2.attribute
    if L1_2 ~= 16389 then
      L3_2 = sigattr_tail
      L3_2 = L3_2[L2_2]
      L3_2 = L3_2.utf8p1
      L4_2 = L3_2
      L3_2 = L3_2.lower
      L3_2 = L3_2(L4_2)
      L4_2 = sigattr_tail
      L4_2 = L4_2[A0_2]
      L4_2 = L4_2.utf8p1
      L5_2 = L4_2
      L4_2 = L4_2.lower
      L4_2 = L4_2(L5_2)
      if L3_2 == L4_2 then
        return L1_2
      end
    end
    L2_2 = L2_2 - 1
    if L2_2 <= 1 then
      L3_2 = nil
      return L3_2
    end
  end
  L3_2 = nil
  return L3_2
end

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = mp
  L1_2 = L1_2.SIGATTR_LOG_SZ
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 == "string" then
    L2_2 = L1_2
    L3_2 = 1
    L4_2 = -1
    for L5_2 = L2_2, L3_2, L4_2 do
      L6_2 = sigattr_tail
      L6_2 = L6_2[L5_2]
      L6_2 = L6_2.utf8p2
      if L6_2 == A0_2 then
        L6_2 = L2_1
        L7_2 = L5_2
        return L6_2(L7_2)
      end
    end
    L2_2 = nil
    return L2_2
  end
  L2_2 = nil
  return L2_2
end

whatEventGeneratedThisEvent = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2
  L3_2 = initRQFTAT
  L3_2()
  L3_2 = sysio
  L3_2 = L3_2.RegOpenKey
  L4_2 = "HKLM\\SYSTEM\\CurrentControlSet\\Control\\TimeZoneInformation"
  L3_2 = L3_2(L4_2)
  L4_2 = -1
  if L3_2 ~= nil then
    L5_2 = sysio
    L5_2 = L5_2.GetRegValueAsDword
    L6_2 = L3_2
    L7_2 = "ActiveTimeBias"
    L5_2 = L5_2(L6_2, L7_2)
    L4_2 = L5_2
    if L4_2 == nil then
      L4_2 = -1
    end
  end
  L5_2 = bm
  L5_2 = L5_2.get_current_process_startup_info
  L5_2 = L5_2()
  L6_2 = nil
  L7_2 = nil
  if L5_2 ~= nil then
    L8_2 = pcall
    L9_2 = MpCommon
    L9_2 = L9_2.QuerySessionInformationSession
    L10_2 = A2_2
    L11_2 = MpCommon
    L11_2 = L11_2.WTSUserName
    L8_2, L9_2 = L8_2(L9_2, L10_2, L11_2)
    L7_2 = L9_2
    L6_2 = L8_2
    if not L6_2 then
      L7_2 = "UserNameError"
    end
  end
  if L7_2 ~= nil then
    L9_2 = L7_2
    L8_2 = L7_2.len
    L8_2 = L8_2(L9_2)
    if L8_2 ~= 0 then
      goto lbl_44
    end
  end
  L7_2 = "UserNameError"
  ::lbl_44::
  L8_2 = #L7_2
  L9_2 = mp
  L9_2 = L9_2.crc32
  L10_2 = 0
  L11_2 = L7_2
  L12_2 = 1
  L13_2 = L8_2
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
  L7_2 = L9_2
  L9_2 = MpCommon
  L9_2 = L9_2.GetCurrentTimeT
  L9_2 = L9_2()
  if L9_2 == nil or L9_2 == 0 then
    L9_2 = 1604188800
  end
  L10_2 = IsKeyInRollingQueue
  L11_2 = "FTAT_STC"
  L12_2 = A0_2
  L13_2 = true
  L10_2, L11_2 = L10_2(L11_2, L12_2, L13_2)
  if L10_2 == false then
    L11_2 = L9_2
  end
  L12_2 = nil
  L13_2 = nil
  L14_2 = nil
  L15_2 = nil
  L16_2 = updateToolID
  L17_2 = L7_2
  L18_2 = L9_2
  L19_2 = A1_2
  L16_2, L17_2 = L16_2(L17_2, L18_2, L19_2)
  L13_2 = L17_2
  L12_2 = L16_2
  L16_2 = updateToolID
  L17_2 = "PC"
  L18_2 = L9_2
  L19_2 = A1_2
  L16_2, L17_2 = L16_2(L17_2, L18_2, L19_2)
  L15_2 = L17_2
  L14_2 = L16_2
  L16_2 = createToolsList
  L17_2 = "FTAT_PC_C"
  L16_2 = L16_2(L17_2)
  L17_2 = A1_2
  L18_2 = "_"
  L19_2 = L11_2
  L20_2 = "_"
  L21_2 = L9_2
  L22_2 = "_"
  L23_2 = L12_2
  L24_2 = "_"
  L25_2 = L13_2
  L26_2 = "_"
  L27_2 = L14_2
  L28_2 = "_"
  L29_2 = L15_2
  L30_2 = "_"
  L31_2 = L16_2
  L32_2 = "_"
  L33_2 = L4_2
  L17_2 = L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2 .. L26_2 .. L27_2 .. L28_2 .. L29_2 .. L30_2 .. L31_2 .. L32_2 .. L33_2
  L18_2 = L9_2 - L13_2
  L19_2 = L17_2
  L20_2 = L18_2
  return L19_2, L20_2
end

updateFTATData = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = {}
  L3_2 = {}
  L4_2 = GetRollingQueue
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if L4_2 == nil then
    L5_2 = {}
    return L5_2
  end
  L5_2 = pairs
  L6_2 = L4_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2 in L5_2, L6_2, L7_2 do
    L9_2 = L4_2[L8_2]
    L9_2 = L9_2.value
    if A1_2 < L9_2 then
      L9_2 = #L3_2
      L9_2 = L9_2 + 1
      L10_2 = L4_2[L8_2]
      L10_2 = L10_2.key
      L3_2[L9_2] = L10_2
    else
      L9_2 = #L2_2
      L9_2 = L9_2 + 1
      L10_2 = L4_2[L8_2]
      L10_2 = L10_2.key
      L2_2[L9_2] = L10_2
    end
  end
  L5_2 = table
  L5_2 = L5_2.concat
  L6_2 = L3_2
  L7_2 = ","
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = table
  L6_2 = L6_2.concat
  L7_2 = L2_2
  L8_2 = ","
  L6_2, L7_2, L8_2, L9_2, L10_2 = L6_2(L7_2, L8_2)
  return L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
end

function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = isFirstTimeATActive
  L1_2 = L1_2()
  if L1_2 == false then
    L1_2 = false
    return L1_2
  end
  L1_2 = L0_1
  L1_2 = L1_2()
  L2_2 = MpCommon
  L2_2 = L2_2.GetCurrentTimeT
  L2_2 = L2_2()
  L3_2 = A0_2 * 60
  L3_2 = L3_2 * 60
  L3_2 = L3_2 * 24
  L3_2 = L2_2 - L3_2
  L4_2 = "FTAT_PC_LT"
  L5_2 = nil
  L6_2 = nil
  L7_2 = L3_1
  L8_2 = L4_2
  L9_2 = L3_2
  L7_2, L8_2 = L7_2(L8_2, L9_2)
  L5_2 = L8_2
  L6_2 = L7_2
  L7_2 = IsKeyInRollingQueue
  L8_2 = "FTAT_STC"
  L9_2 = L1_2
  L10_2 = true
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = L2_2 - L7_2
  L9_2 = L8_2
  L10_2 = "_"
  L11_2 = L5_2
  L12_2 = "_"
  L13_2 = L6_2
  L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
  return L9_2
end

getToolsUsedBeforeAfter = L4_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = type
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 == "table" then
      L7_2 = areTheseOrgsInThisCertChain
      L8_2 = L6_2
      L9_2 = A1_2
      L7_2 = L7_2(L8_2, L9_2)
      if L7_2 then
        L7_2 = true
        return L7_2
      end
    else
      L7_2 = type
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if L7_2 == "string" then
        L7_2 = tostring
        L8_2 = L5_2
        L7_2 = L7_2(L8_2)
        if L7_2 == "Organization" then
          L7_2 = mp
          L7_2 = L7_2.utf16to8
          L8_2 = L6_2
          L7_2 = L7_2(L8_2)
          L7_2 = A1_2[L7_2]
          if L7_2 then
            L7_2 = true
            return L7_2
          end
        end
      end
    end
  end
  L2_2 = false
  return L2_2
end

areTheseOrgsInThisCertChain = L4_1

function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = mp
  L1_2 = L1_2.GetCertificateInfo
  L1_2 = L1_2()
  if L1_2 == nil then
    L2_2 = false
    return L2_2
  end
  L2_2 = areTheseOrgsInThisCertChain
  L3_2 = L1_2
  L4_2 = A0_2
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = true
    return L2_2
  end
  L2_2 = false
  return L2_2
end

areTheseOrgInFileCertChain = L4_1

function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = 60
  L2_2 = "MpTamperProtectionState"
  if A0_2 == nil then
    A0_2 = true
  end
  if A0_2 then
    L3_2 = MpCommon
    L3_2 = L3_2.QueryPersistContextNoPath
    L4_2 = L2_2
    L5_2 = "off"
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 then
      L3_2 = false
      return L3_2
    end
    L3_2 = MpCommon
    L3_2 = L3_2.QueryPersistContextNoPath
    L4_2 = L2_2
    L5_2 = "on"
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 then
      L3_2 = true
      return L3_2
    end
  end
  L3_2 = sysio
  L3_2 = L3_2.RegOpenKey
  L4_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features"
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = sysio
    L4_2 = L4_2.GetRegValueAsDword
    L5_2 = L3_2
    L6_2 = "TamperProtection"
    L4_2 = L4_2(L5_2, L6_2)
    if L4_2 then
      L5_2 = mp
      L5_2 = L5_2.bitand
      L6_2 = L4_2
      L7_2 = 1
      L5_2 = L5_2(L6_2, L7_2)
      if L5_2 == 1 then
        L5_2 = MpCommon
        L5_2 = L5_2.SetPersistContextNoPath
        L6_2 = L2_2
        L7_2 = {}
        L8_2 = "on"
        L7_2[1] = L8_2
        L8_2 = L1_2
        L5_2(L6_2, L7_2, L8_2)
        return L4_2
      else
        L5_2 = MpCommon
        L5_2 = L5_2.SetPersistContextNoPath
        L6_2 = L2_2
        L7_2 = {}
        L8_2 = "off"
        L7_2[1] = L8_2
        L8_2 = L1_2
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = false
        return L5_2
      end
    end
  end
  L4_2 = false
  return L4_2
end

isTamperProtectionOn = L4_1
