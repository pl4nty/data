local L0_1, L1_1

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

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A0_2 == nil then
    L2_2 = false
    return L2_2
  end
  if not A1_2 then
    A1_2 = false
  end
  if A1_2 then
    L2_2 = safeJsonSerialize
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 ~= nil then
      L3_2 = bm
      L3_2 = L3_2.add_related_string
      L4_2 = "TTData"
      L5_2 = L2_2
      L6_2 = bm
      L6_2 = L6_2.RelatedStringBMReport
      L3_2(L4_2, L5_2, L6_2)
    end
  else
    L2_2 = pairs
    L3_2 = A0_2
    L2_2, L3_2, L4_2 = L2_2(L3_2)
    for L5_2, L6_2 in L2_2, L3_2, L4_2 do
      L7_2 = string
      L7_2 = L7_2.format
      L8_2 = "MpInternal_researchdata=%s=%s"
      L9_2 = L5_2
      L10_2 = tostring
      L11_2 = L6_2
      L10_2, L11_2 = L10_2(L11_2)
      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
      L8_2 = mp
      L8_2 = L8_2.set_mpattribute
      L9_2 = L7_2
      L8_2(L9_2)
    end
  end
  L2_2 = true
  return L2_2
end

set_researchdata_fromtable = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A1_2 == ""
  return L2_2
end

StringEndsWith = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2 == ""
  return L2_2
end

StringStartsWith = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A1_2 == nil then
    A1_2 = "%s"
  end
  L2_2 = {}
  L3_2 = string
  L3_2 = L3_2.gmatch
  L4_2 = A0_2
  L5_2 = "([^"
  L6_2 = A1_2
  L7_2 = "]+)"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
  for L6_2 in L3_2, L4_2, L5_2 do
    L7_2 = table
    L7_2 = L7_2.insert
    L8_2 = L2_2
    L9_2 = L6_2
    L7_2(L8_2, L9_2)
  end
  return L2_2
end

StringSplit = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = IsTechniqueObservedGlobal
  L3_2 = A0_2
  L4_2 = true
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  L4_2 = 1
  if L2_2 then
    L5_2 = tonumber
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    L4_2 = L5_2 + L4_2
  end
  L5_2 = AppendToRollingQueue
  L6_2 = "gTechniquesTable"
  L7_2 = A0_2
  L8_2 = L4_2
  L9_2 = A1_2
  L10_2 = 100
  L11_2 = 1
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end

AddTechniqueGlobal = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = IsTacticObservedGlobal
  L3_2 = A0_2
  L4_2 = true
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  L4_2 = 1
  if L2_2 then
    L5_2 = tonumber
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    L4_2 = L5_2 + L4_2
  end
  L5_2 = AppendToRollingQueue
  L6_2 = "gTacticsTable"
  L7_2 = A0_2
  L8_2 = L4_2
  L9_2 = A1_2
  L10_2 = 100
  L11_2 = 1
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end

AddTacticGlobal = L0_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    return
  end
  if not A2_2 then
    A2_2 = 3600
  end
  L3_2 = GetRealPidForScenario
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  A0_2 = L3_2
  L3_2 = IsTechniqueObservedForPid
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2, L4_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L4_2 = L4_2 + 1
  else
    L4_2 = 1
  end
  L5_2 = AppendToRollingQueue
  L6_2 = "Tech-"
  L7_2 = A0_2
  L6_2 = L6_2 .. L7_2
  L7_2 = A1_2
  L8_2 = L4_2
  L9_2 = A2_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
end

AddTechniqueForPid = L0_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    return
  end
  if not A2_2 then
    A2_2 = 3600
  end
  L3_2 = GetRealPidForScenario
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  A0_2 = L3_2
  L3_2 = IsTacticObservedForPid
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2, L4_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L4_2 = L4_2 + 1
  else
    L4_2 = 1
  end
  L5_2 = AppendToRollingQueue
  L6_2 = "Tact-"
  L7_2 = A0_2
  L6_2 = L6_2 .. L7_2
  L7_2 = A1_2
  L8_2 = L4_2
  L9_2 = A2_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
end

AddTacticForPid = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = GetRealPidForScenario
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = AppendToRollingQueue
  L3_2 = "gPidsTable"
  L4_2 = A0_2
  L5_2 = 1
  L6_2 = A1_2
  L7_2 = 500
  L8_2 = 1
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
end

AddPidGlobal = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 == nil then
    L1_2 = A0_2
    L2_2 = A0_2
    return L1_2, L2_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = "pid:.+,ProcessStart:.+"
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L1_2 = A0_2
    L2_2 = A0_2
    return L1_2, L2_2
  end
  L1_2 = nil
  if A0_2 == "CMDHSTR" then
    L2_2 = pcall
    L3_2 = mp
    L3_2 = L3_2.GetParentProcInfo
    L2_2, L3_2 = L2_2(L3_2)
    if L2_2 and L3_2 ~= nil then
      L1_2 = L3_2.ppid
    else
      L4_2 = mp
      L4_2 = L4_2.GetScannedPPID
      L4_2 = L4_2()
      L1_2 = L4_2
    end
  elseif A0_2 == "BM" then
    L2_2 = pcall
    L3_2 = bm
    L3_2 = L3_2.get_current_process_startup_info
    L2_2, L3_2 = L2_2(L3_2)
    if L2_2 and L3_2 ~= nil then
      L1_2 = L3_2.ppid
    end
  elseif A0_2 == "AMSI" then
    L2_2 = pcall
    L3_2 = mp
    L3_2 = L3_2.get_contextdata
    L4_2 = mp
    L4_2 = L4_2.CONTEXT_DATA_AMSI_OPERATION_PPID
    L2_2, L3_2 = L2_2(L3_2, L4_2)
    if L2_2 and L3_2 ~= nil then
      L1_2 = L3_2
    end
  elseif A0_2 == "RTP" then
    L2_2 = pcall
    L3_2 = mp
    L3_2 = L3_2.get_contextdata
    L4_2 = mp
    L4_2 = L4_2.CONTEXT_DATA_PROCESS_PPID
    L2_2, L3_2 = L2_2(L3_2, L4_2)
    if L2_2 and L3_2 ~= nil then
      L1_2 = L3_2
    end
  end
  if L1_2 == nil then
    L1_2 = A0_2
  end
  L2_2 = L1_2
  L3_2 = A0_2
  return L2_2, L3_2
end

GetRealPidForScenario = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = GetRealPidForScenario
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = GetRollingQueueAsHashTable
  L2_2 = "Tech-"
  L3_2 = A0_2
  L2_2 = L2_2 .. L3_2
  return L1_2(L2_2)
end

GetTechniquesTableForPid = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = GetRealPidForScenario
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = GetRollingQueueAsHashTable
  L2_2 = "Tact-"
  L3_2 = A0_2
  L2_2 = L2_2 .. L3_2
  return L1_2(L2_2)
end

GetTacticsTableForPid = L0_1

function L0_1()
  local L0_2, L1_2
  L0_2 = GetRollingQueueAsHashTable
  L1_2 = "gTechniquesTable"
  return L0_2(L1_2)
end

GetTechniquesTableGlobal = L0_1

function L0_1()
  local L0_2, L1_2
  L0_2 = GetRollingQueueAsHashTable
  L1_2 = "gTacticsTable"
  return L0_2(L1_2)
end

GetTacticsTableGlobal = L0_1

function L0_1()
  local L0_2, L1_2
  L0_2 = GetRollingQueueAsHashTable
  L1_2 = "gPidsTable"
  return L0_2(L1_2)
end

GetPidsTableGlobal = L0_1

function L0_1()
  local L0_2, L1_2, L2_2
  L0_2 = pcall
  L1_2 = MpCommon
  L1_2 = L1_2.RollingQueueCount
  L2_2 = "gTechniquesTable"
  L0_2, L1_2 = L0_2(L1_2, L2_2)
  if L0_2 and L1_2 ~= nil then
    return L1_2
  end
  L2_2 = 0
  return L2_2
end

GetTechniquesCountGlobal = L0_1

function L0_1()
  local L0_2, L1_2, L2_2
  L0_2 = pcall
  L1_2 = MpCommon
  L1_2 = L1_2.RollingQueueCount
  L2_2 = "gTacticsTable"
  L0_2, L1_2 = L0_2(L1_2, L2_2)
  if L0_2 and L1_2 ~= nil then
    return L1_2
  end
  L2_2 = 0
  return L2_2
end

GetTacticsCountGlobal = L0_1

function L0_1()
  local L0_2, L1_2, L2_2
  L0_2 = pcall
  L1_2 = MpCommon
  L1_2 = L1_2.RollingQueueCount
  L2_2 = "gPidsTable"
  L0_2, L1_2 = L0_2(L1_2, L2_2)
  if L0_2 and L1_2 ~= nil then
    return L1_2
  end
  L2_2 = 0
  return L2_2
end

GetTrackedPidsCountGlobal = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = GetRealPidForScenario
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = pcall
  L2_2 = MpCommon
  L2_2 = L2_2.RollingQueueCount
  L3_2 = "Tech-"
  L4_2 = A0_2
  L3_2 = L3_2 .. L4_2
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  if L1_2 and L2_2 ~= nil then
    return L2_2
  end
  L3_2 = 0
  return L3_2
end

GetTechniquesCountForPid = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = GetRealPidForScenario
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = pcall
  L2_2 = MpCommon
  L2_2 = L2_2.RollingQueueCount
  L3_2 = "Tact-"
  L4_2 = A0_2
  L3_2 = L3_2 .. L4_2
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  if L1_2 and L2_2 ~= nil then
    return L2_2
  end
  L3_2 = 0
  return L3_2
end

GetTacticsCountForPid = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if not A1_2 then
    A1_2 = false
  end
  L2_2 = IsKeyInRollingQueue
  L3_2 = "gTechniquesTable"
  L4_2 = A0_2
  L5_2 = A1_2
  return L2_2(L3_2, L4_2, L5_2)
end

IsTechniqueObservedGlobal = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if not A1_2 then
    A1_2 = false
  end
  L2_2 = IsKeyInRollingQueue
  L3_2 = "gTacticsTable"
  L4_2 = A0_2
  L5_2 = A1_2
  return L2_2(L3_2, L4_2, L5_2)
end

IsTacticObservedGlobal = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = GetRealPidForScenario
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = IsKeyInRollingQueue
  L2_2 = "gPidsTable"
  L3_2 = A0_2
  L4_2 = true
  return L1_2(L2_2, L3_2, L4_2)
end

IsPidObservedGlobal = L0_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    L3_2 = false
    L4_2 = nil
    return L3_2, L4_2
  end
  L3_2 = GetRealPidForScenario
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  A0_2 = L3_2
  if not A2_2 then
    A2_2 = false
  end
  L3_2 = IsKeyInRollingQueue
  L4_2 = "Tech-"
  L5_2 = A0_2
  L4_2 = L4_2 .. L5_2
  L5_2 = A1_2
  L6_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2)
end

IsTechniqueObservedForPid = L0_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    L3_2 = false
    L4_2 = nil
    return L3_2, L4_2
  end
  L3_2 = GetRealPidForScenario
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  A0_2 = L3_2
  if not A2_2 then
    A2_2 = false
  end
  L3_2 = IsKeyInRollingQueue
  L4_2 = "Tact-"
  L5_2 = A0_2
  L4_2 = L4_2 .. L5_2
  L5_2 = A1_2
  L6_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2)
end

IsTacticObservedForPid = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = IsTacticObservedForPid
  L2_2 = A0_2
  L3_2 = "ttexclusion"
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L1_2 = IsTechniqueObservedForPid
    L2_2 = A0_2
    L3_2 = "ttexclusion"
    L1_2 = L1_2(L2_2, L3_2)
    if not L1_2 then
      goto lbl_15
    end
  end
  L1_2 = true
  do return L1_2 end
  ::lbl_15::
  L1_2 = IsLegacyOrgMachine
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = true
    return L1_2
  end
  L1_2 = false
  return L1_2
end

IsPidExcluded = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L5_2 = IsPidObservedGlobal
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L6_2 = false
  L7_2 = 0
  if L5_2 then
    L8_2 = GetTechniquesCountGlobal
    L8_2 = L8_2()
    L9_2 = GetTacticsCountGlobal
    L9_2 = L9_2()
    L10_2 = 0
    L11_2 = 0
    L12_2 = ""
    L13_2 = ""
    L14_2 = GetTacticsTableForPid
    L15_2 = A0_2
    L14_2 = L14_2(L15_2)
    L15_2 = GetTechniquesTableForPid
    L16_2 = A0_2
    L15_2 = L15_2(L16_2)
    if L14_2 == nil or L15_2 == nil then
      L16_2 = false
      L17_2 = 0
      return L16_2, L17_2
    end
    L16_2 = pairs
    L17_2 = L14_2
    L16_2, L17_2, L18_2 = L16_2(L17_2)
    for L19_2, L20_2 in L16_2, L17_2, L18_2 do
      if L19_2 ~= nil then
        L21_2 = string
        L21_2 = L21_2.format
        L22_2 = "%s%s%s"
        L23_2 = L13_2
        L24_2 = "|"
        L25_2 = L19_2
        L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2)
        L13_2 = L21_2
      end
      if L20_2 ~= nil then
        L21_2 = type
        L22_2 = L20_2
        L21_2 = L21_2(L22_2)
        if L21_2 == "number" then
          L11_2 = L11_2 + L20_2
        end
      end
    end
    L16_2 = string
    L16_2 = L16_2.lower
    L17_2 = L13_2
    L16_2 = L16_2(L17_2)
    L13_2 = L16_2
    L16_2 = pairs
    L17_2 = L15_2
    L16_2, L17_2, L18_2 = L16_2(L17_2)
    for L19_2, L20_2 in L16_2, L17_2, L18_2 do
      if L19_2 ~= nil then
        L21_2 = string
        L21_2 = L21_2.format
        L22_2 = "%s%s%s"
        L23_2 = L12_2
        L24_2 = "|"
        L25_2 = L19_2
        L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2)
        L12_2 = L21_2
      end
      if L20_2 ~= nil then
        L21_2 = type
        L22_2 = L20_2
        L21_2 = L21_2(L22_2)
        if L21_2 == "number" then
          L10_2 = L10_2 + L20_2
        end
      end
    end
    L16_2 = string
    L16_2 = L16_2.lower
    L17_2 = L12_2
    L16_2 = L16_2(L17_2)
    L12_2 = L16_2
    L17_2 = L13_2
    L16_2 = L13_2.find
    L18_2 = "ttexclusion"
    L19_2 = 1
    L20_2 = true
    L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
    if not L16_2 then
      L17_2 = L12_2
      L16_2 = L12_2.find
      L18_2 = "ttexclusion"
      L19_2 = 1
      L20_2 = true
      L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
      if not L16_2 then
        L16_2 = IsLegacyOrgMachine
        L16_2 = L16_2()
        if not L16_2 then
          goto lbl_111
        end
      end
    end
    L16_2 = mp
    L16_2 = L16_2.bitor
    L17_2 = L7_2
    L18_2 = 2147483648
    L16_2 = L16_2(L17_2, L18_2)
    L7_2 = L16_2
    ::lbl_111::
    L16_2 = GetTaintLevelHR
    L16_2 = L16_2()
    if L16_2 == "Medium" or L16_2 == "High" then
      L17_2 = mp
      L17_2 = L17_2.bitor
      L18_2 = L7_2
      L19_2 = 1
      L17_2 = L17_2(L18_2, L19_2)
      L7_2 = L17_2
    end
    L17_2 = GetTaintLevelML
    L17_2 = L17_2()
    if L17_2 == "High" then
      L18_2 = mp
      L18_2 = L18_2.bitor
      L19_2 = L7_2
      L20_2 = 1
      L18_2 = L18_2(L19_2, L20_2)
      L7_2 = L18_2
    end
    L19_2 = L13_2
    L18_2 = L13_2.find
    L20_2 = "processinjection_target"
    L21_2 = 1
    L22_2 = true
    L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
    if not L18_2 then
      L19_2 = L13_2
      L18_2 = L13_2.find
      L20_2 = "processhollowing_target"
      L21_2 = 1
      L22_2 = true
      L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
      if not L18_2 then
        goto lbl_153
      end
    end
    L18_2 = mp
    L18_2 = L18_2.bitor
    L19_2 = L7_2
    L20_2 = 2
    L18_2 = L18_2(L19_2, L20_2)
    L7_2 = L18_2
    ::lbl_153::
    L19_2 = L13_2
    L18_2 = L13_2.find
    L20_2 = "processinjection"
    L21_2 = 1
    L22_2 = true
    L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
    if L18_2 then
      L19_2 = L13_2
      L18_2 = L13_2.find
      L20_2 = "keylog"
      L21_2 = 1
      L22_2 = true
      L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
      if L18_2 then
        L18_2 = mp
        L18_2 = L18_2.bitor
        L19_2 = L7_2
        L20_2 = 4
        L18_2 = L18_2(L19_2, L20_2)
        L7_2 = L18_2
      end
    end
    L19_2 = L13_2
    L18_2 = L13_2.find
    L20_2 = "indirectcmdexec"
    L21_2 = 1
    L22_2 = true
    L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
    if L18_2 then
      L18_2 = mp
      L18_2 = L18_2.bitor
      L19_2 = L7_2
      L20_2 = 8
      L18_2 = L18_2(L19_2, L20_2)
      L7_2 = L18_2
    end
    L19_2 = L13_2
    L18_2 = L13_2.find
    L20_2 = "processinjection"
    L21_2 = 1
    L22_2 = true
    L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
    if L18_2 then
      L18_2 = IsTacticObservedGlobal
      L19_2 = "processdiscovery"
      L18_2 = L18_2(L19_2)
      if L18_2 then
        L18_2 = mp
        L18_2 = L18_2.bitor
        L19_2 = L7_2
        L20_2 = 16
        L18_2 = L18_2(L19_2, L20_2)
        L7_2 = L18_2
      end
    end
    L19_2 = L13_2
    L18_2 = L13_2.find
    L20_2 = "credentialdumping"
    L21_2 = 1
    L22_2 = true
    L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
    if L18_2 then
      L18_2 = mp
      L18_2 = L18_2.bitor
      L19_2 = L7_2
      L20_2 = 32
      L18_2 = L18_2(L19_2, L20_2)
      L7_2 = L18_2
    end
    L19_2 = L13_2
    L18_2 = L13_2.find
    L20_2 = "command_control_l"
    L21_2 = 1
    L22_2 = true
    L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
    if not L18_2 then
      L19_2 = L13_2
      L18_2 = L13_2.find
      L20_2 = "command_control_n"
      L21_2 = 1
      L22_2 = true
      L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
      if not L18_2 then
        goto lbl_237
      end
    end
    L18_2 = mp
    L18_2 = L18_2.bitor
    L19_2 = L7_2
    L20_2 = 1024
    L18_2 = L18_2(L19_2, L20_2)
    L7_2 = L18_2
    ::lbl_237::
    L19_2 = L12_2
    L18_2 = L12_2.find
    L20_2 = "T1036"
    L21_2 = 1
    L22_2 = true
    L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
    if L18_2 then
      L18_2 = mp
      L18_2 = L18_2.bitor
      L19_2 = L7_2
      L20_2 = 128
      L18_2 = L18_2(L19_2, L20_2)
      L7_2 = L18_2
    end
    L19_2 = L12_2
    L18_2 = L12_2.find
    L20_2 = "T1027.002"
    L21_2 = 1
    L22_2 = true
    L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
    if L18_2 then
      L18_2 = mp
      L18_2 = L18_2.bitor
      L19_2 = L7_2
      L20_2 = 256
      L18_2 = L18_2(L19_2, L20_2)
      L7_2 = L18_2
    end
    L19_2 = L12_2
    L18_2 = L12_2.find
    L20_2 = "T1505.003"
    L21_2 = 1
    L22_2 = true
    L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
    if L18_2 then
      L18_2 = mp
      L18_2 = L18_2.bitor
      L19_2 = L7_2
      L20_2 = 4096
      L18_2 = L18_2(L19_2, L20_2)
      L7_2 = L18_2
    end
    L19_2 = L13_2
    L18_2 = L13_2.find
    L20_2 = "_malware"
    L21_2 = 1
    L22_2 = true
    L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
    if not L18_2 then
      L19_2 = L12_2
      L18_2 = L12_2.find
      L20_2 = "tt-thresholdmet"
      L21_2 = 1
      L22_2 = true
      L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
      if not L18_2 then
        L19_2 = L13_2
        L18_2 = L13_2.find
        L20_2 = "tt-thresholdmet"
        L21_2 = 1
        L22_2 = true
        L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
        if not L18_2 then
          goto lbl_303
        end
      end
    end
    L18_2 = mp
    L18_2 = L18_2.bitor
    L19_2 = L7_2
    L20_2 = 2048
    L18_2 = L18_2(L19_2, L20_2)
    L7_2 = L18_2
  end
  ::lbl_303::
  if L7_2 ~= 0 then
    L6_2 = true
    L8_2 = mp
    L8_2 = L8_2.bitand
    L9_2 = L7_2
    L10_2 = 2147483648
    L8_2 = L8_2(L9_2, L10_2)
    if L8_2 ~= 0 then
      L6_2 = false
    end
  end
  L8_2 = L6_2
  L9_2 = L7_2
  return L8_2, L9_2
end

GetDetectionThresholdMetReason = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if not A1_2 then
    A1_2 = 0
  end
  if not A2_2 then
    A2_2 = 0
  end
  if not A3_2 then
    A3_2 = 0
  end
  if not A4_2 then
    A4_2 = 0
  end
  L5_2 = GetDetectionThresholdMetReason
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L9_2 = A3_2
  L10_2 = A4_2
  L5_2, L6_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  return L5_2
end

IsDetectionThresholdMet = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L5_2 = 0
  L6_2 = true
  L7_2 = nil
  L8_2 = false
  L9_2 = 0
  if L6_2 then
    L10_2 = GetTacticsTableForPid
    L11_2 = A0_2
    L10_2 = L10_2(L11_2)
    L11_2 = GetTechniquesTableForPid
    L12_2 = A0_2
    L11_2 = L11_2(L12_2)
    if L10_2 == nil or L11_2 == nil then
      L12_2 = false
      L13_2 = 0
      return L12_2, L13_2
    end
    L12_2 = GetTaintLevelHR
    L12_2 = L12_2()
    if L12_2 == "Medium" or L12_2 == "High" then
      L13_2 = mp
      L13_2 = L13_2.bitor
      L14_2 = L9_2
      L15_2 = 1
      L13_2 = L13_2(L14_2, L15_2)
      L9_2 = L13_2
    end
    L13_2 = GetTaintLevelML
    L13_2 = L13_2()
    if L13_2 == "High" then
      L14_2 = mp
      L14_2 = L14_2.bitor
      L15_2 = L9_2
      L16_2 = 1
      L14_2 = L14_2(L15_2, L16_2)
      L9_2 = L14_2
    end
    L14_2 = pairs
    L15_2 = L10_2
    L14_2, L15_2, L16_2 = L14_2(L15_2)
    for L17_2, L18_2 in L14_2, L15_2, L16_2 do
      if L17_2 ~= nil then
        if L7_2 == nil then
          L20_2 = L17_2
          L19_2 = L17_2.lower
          L19_2 = L19_2(L20_2)
          L7_2 = L19_2
        else
          L19_2 = L7_2
          L20_2 = " | "
          L22_2 = L17_2
          L21_2 = L17_2.lower
          L21_2 = L21_2(L22_2)
          L7_2 = L19_2 .. L20_2 .. L21_2
        end
      end
      if L18_2 ~= nil then
        L5_2 = L5_2 + L18_2
      end
    end
    if L7_2 ~= nil then
      L15_2 = L7_2
      L14_2 = L7_2.find
      L16_2 = "impact"
      L17_2 = 1
      L18_2 = true
      L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
      if L14_2 then
        L15_2 = L7_2
        L14_2 = L7_2.find
        L16_2 = "collection"
        L17_2 = 1
        L18_2 = true
        L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
        if L14_2 then
          L15_2 = L7_2
          L14_2 = L7_2.find
          L16_2 = "discovery"
          L17_2 = 1
          L18_2 = true
          L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
          if L14_2 then
            L14_2 = mp
            L14_2 = L14_2.bitor
            L15_2 = L9_2
            L16_2 = 2
            L14_2 = L14_2(L15_2, L16_2)
            L9_2 = L14_2
          end
        end
      end
      L15_2 = L7_2
      L14_2 = L7_2.find
      L16_2 = "execution"
      L17_2 = 1
      L18_2 = true
      L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
      if L14_2 then
        L15_2 = L7_2
        L14_2 = L7_2.find
        L16_2 = "persistence"
        L17_2 = 1
        L18_2 = true
        L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
        if L14_2 then
          L14_2 = mp
          L14_2 = L14_2.bitor
          L15_2 = L9_2
          L16_2 = 4
          L14_2 = L14_2(L15_2, L16_2)
          L9_2 = L14_2
        end
      end
      L15_2 = L7_2
      L14_2 = L7_2.find
      L16_2 = "collection"
      L17_2 = 1
      L18_2 = true
      L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
      if L14_2 then
        L15_2 = L7_2
        L14_2 = L7_2.find
        L16_2 = "impact"
        L17_2 = 1
        L18_2 = true
        L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
        if L14_2 then
          L15_2 = L7_2
          L14_2 = L7_2.find
          L16_2 = "credentialaccess"
          L17_2 = 1
          L18_2 = true
          L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
          if not L14_2 then
            L15_2 = L7_2
            L14_2 = L7_2.find
            L16_2 = "execution"
            L17_2 = 1
            L18_2 = true
            L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
            if not L14_2 then
              goto lbl_148
            end
          end
          L14_2 = mp
          L14_2 = L14_2.bitor
          L15_2 = L9_2
          L16_2 = 8
          L14_2 = L14_2(L15_2, L16_2)
          L9_2 = L14_2
        end
      end
      ::lbl_148::
      L15_2 = L7_2
      L14_2 = L7_2.find
      L16_2 = "defenseevasion"
      L17_2 = 1
      L18_2 = true
      L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
      if L14_2 then
        L15_2 = L7_2
        L14_2 = L7_2.find
        L16_2 = "lateralmovement"
        L17_2 = 1
        L18_2 = true
        L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
        if L14_2 then
          L15_2 = L7_2
          L14_2 = L7_2.find
          L16_2 = "collection"
          L17_2 = 1
          L18_2 = true
          L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
          if L14_2 then
            L14_2 = mp
            L14_2 = L14_2.bitor
            L15_2 = L9_2
            L16_2 = 16
            L14_2 = L14_2(L15_2, L16_2)
            L9_2 = L14_2
          end
        end
      end
      L15_2 = L7_2
      L14_2 = L7_2.find
      L16_2 = "credentialaccess"
      L17_2 = 1
      L18_2 = true
      L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
      if L14_2 then
        L15_2 = L7_2
        L14_2 = L7_2.find
        L16_2 = "impact"
        L17_2 = 1
        L18_2 = true
        L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
        if L14_2 then
          L15_2 = L7_2
          L14_2 = L7_2.find
          L16_2 = "collection"
          L17_2 = 1
          L18_2 = true
          L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
          if L14_2 then
            L15_2 = L7_2
            L14_2 = L7_2.find
            L16_2 = "exfil"
            L17_2 = 1
            L18_2 = true
            L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
            if L14_2 then
              L14_2 = mp
              L14_2 = L14_2.bitor
              L15_2 = L9_2
              L16_2 = 32
              L14_2 = L14_2(L15_2, L16_2)
              L9_2 = L14_2
            end
          end
        end
      end
      L15_2 = L7_2
      L14_2 = L7_2.find
      L16_2 = "accountdiscovery"
      L17_2 = 1
      L18_2 = true
      L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
      if L14_2 then
        L15_2 = L7_2
        L14_2 = L7_2.find
        L16_2 = "lateralmovement"
        L17_2 = 1
        L18_2 = true
        L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
        if L14_2 then
          L15_2 = L7_2
          L14_2 = L7_2.find
          L16_2 = "remotesystemdiscovery"
          L17_2 = 1
          L18_2 = true
          L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
          if L14_2 then
            L14_2 = mp
            L14_2 = L14_2.bitor
            L15_2 = L9_2
            L16_2 = 64
            L14_2 = L14_2(L15_2, L16_2)
            L9_2 = L14_2
          end
        end
      end
      L15_2 = L7_2
      L14_2 = L7_2.find
      L16_2 = "execution"
      L17_2 = 1
      L18_2 = true
      L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
      if L14_2 then
        L15_2 = L7_2
        L14_2 = L7_2.find
        L16_2 = "impact"
        L17_2 = 1
        L18_2 = true
        L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
        if L14_2 then
          L14_2 = mp
          L14_2 = L14_2.bitor
          L15_2 = L9_2
          L16_2 = 128
          L14_2 = L14_2(L15_2, L16_2)
          L9_2 = L14_2
        end
      end
      L15_2 = L7_2
      L14_2 = L7_2.find
      L16_2 = "collection"
      L17_2 = 1
      L18_2 = true
      L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
      if not L14_2 then
        L15_2 = L7_2
        L14_2 = L7_2.find
        L16_2 = "discovery"
        L17_2 = 1
        L18_2 = true
        L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
        if not L14_2 then
          goto lbl_283
        end
      end
      L15_2 = L7_2
      L14_2 = L7_2.find
      L16_2 = "exfiltration"
      L17_2 = 1
      L18_2 = true
      L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
      if L14_2 then
        L14_2 = mp
        L14_2 = L14_2.bitor
        L15_2 = L9_2
        L16_2 = 256
        L14_2 = L14_2(L15_2, L16_2)
        L9_2 = L14_2
      end
    end
  end
  ::lbl_283::
  if L9_2 ~= 0 then
    L8_2 = true
  end
  L10_2 = L8_2
  L11_2 = L9_2
  return L10_2, L11_2
end

GetDetectionThresholdMetLinuxReason = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if not A1_2 then
    A1_2 = 0
  end
  if not A2_2 then
    A2_2 = 0
  end
  if not A3_2 then
    A3_2 = 0
  end
  if not A4_2 then
    A4_2 = 0
  end
  L5_2 = GetDetectionThresholdMetLinuxReason
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L9_2 = A3_2
  L10_2 = A4_2
  L5_2, L6_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  return L5_2
end

IsDetectionThresholdMetLinux = L0_1

function L0_1()
  local L0_2, L1_2, L2_2
  L1_2 = MpCommon
  L1_2 = L1_2.GetPersistContextCountNoPath
  L2_2 = "TaintedMachine"
  L1_2 = L1_2(L2_2)
  if 0 < L1_2 then
    L1_2 = MpCommon
    L1_2 = L1_2.GetPersistContextCountNoPath
    L2_2 = "TaintedMachineHigh"
    L1_2 = L1_2(L2_2)
    if 0 < L1_2 then
      L0_2 = "High"
    else
      L1_2 = MpCommon
      L1_2 = L1_2.GetPersistContextCountNoPath
      L2_2 = "TaintedMachineMedium"
      L1_2 = L1_2(L2_2)
      if 0 < L1_2 then
        L0_2 = "Medium"
      else
        L1_2 = MpCommon
        L1_2 = L1_2.GetPersistContextCountNoPath
        L2_2 = "TaintedMachineLow"
        L1_2 = L1_2(L2_2)
        if 0 < L1_2 then
          L0_2 = "Low"
        end
      end
    end
  end
  return L0_2
end

GetTaintLevelHR = L0_1

function L0_1()
  local L0_2, L1_2, L2_2
  L1_2 = MpCommon
  L1_2 = L1_2.GetPersistContextCountNoPath
  L2_2 = "TaintedMachine"
  L1_2 = L1_2(L2_2)
  if 0 < L1_2 then
    L1_2 = MpCommon
    L1_2 = L1_2.GetPersistContextCountNoPath
    L2_2 = "TaintedMachineML_High"
    L1_2 = L1_2(L2_2)
    if 0 < L1_2 then
      L0_2 = "High"
    else
      L1_2 = MpCommon
      L1_2 = L1_2.GetPersistContextCountNoPath
      L2_2 = "TaintedMachineML_Medium"
      L1_2 = L1_2(L2_2)
      if 0 < L1_2 then
        L0_2 = "Medium"
      else
        L1_2 = MpCommon
        L1_2 = L1_2.GetPersistContextCountNoPath
        L2_2 = "TaintedMachineML_Low"
        L1_2 = L1_2(L2_2)
        if 0 < L1_2 then
          L0_2 = "Low"
        end
      end
    end
  end
  return L0_2
end

GetTaintLevelML = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = GetRealPidForScenario
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  A0_2 = L4_2
  if A0_2 ~= nil then
    if not A3_2 then
      A3_2 = 3600
    end
    L4_2 = AddPidGlobal
    L5_2 = A0_2
    L6_2 = A3_2
    L4_2(L5_2, L6_2)
    if A1_2 ~= nil and A1_2 ~= "" and A1_2 ~= "T0000" then
      L4_2 = AddTechniqueForPid
      L5_2 = A0_2
      L6_2 = A1_2
      L7_2 = A3_2
      L4_2(L5_2, L6_2, L7_2)
      L4_2 = AddTechniqueGlobal
      L5_2 = A1_2
      L6_2 = A3_2
      L4_2(L5_2, L6_2)
    end
    if A2_2 ~= nil and A2_2 ~= "" then
      L4_2 = AddTacticForPid
      L5_2 = A0_2
      L6_2 = A2_2
      L7_2 = A3_2
      L4_2(L5_2, L6_2, L7_2)
      L4_2 = AddTacticGlobal
      L5_2 = A2_2
      L6_2 = A3_2
      L4_2(L5_2, L6_2)
    end
  end
end

AddPidSpecificTechniqueAndTactic = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = GetRealPidForScenario
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  if not A1_2 then
    A1_2 = false
  end
  L2_2 = GetDetectionThresholdMetReason
  L3_2 = A0_2
  L2_2, L3_2 = L2_2(L3_2)
  L4_2 = {}
  L4_2.ttver = "0003"
  L4_2.TrackedPid = A0_2
  L5_2 = tostring
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  L4_2.IsThresholdMet = L5_2
  L5_2 = "000"
  L6_2 = tostring
  L7_2 = L3_2
  L6_2 = L6_2(L7_2)
  L5_2 = L5_2 .. L6_2
  L4_2.ThresholdMetReason = L5_2
  L5_2 = "000"
  L6_2 = tostring
  L7_2 = GetTrackedPidsCountGlobal
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L7_2()
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L5_2 = L5_2 .. L6_2
  L4_2.PidsCount = L5_2
  L5_2 = GetRollingQueueKeysAsString
  L6_2 = "Tech-"
  L7_2 = A0_2
  L6_2 = L6_2 .. L7_2
  L5_2 = L5_2(L6_2)
  if L5_2 == nil then
    L6_2 = A0_2
    L7_2 = " tech table missing"
    L5_2 = L6_2 .. L7_2
  end
  L4_2.TrackedPidTechniques = L5_2
  L6_2 = GetRollingQueueKeysAsString
  L7_2 = "Tact-"
  L8_2 = A0_2
  L7_2 = L7_2 .. L8_2
  L6_2 = L6_2(L7_2)
  if L6_2 == nil then
    L7_2 = A0_2
    L8_2 = " tact table missing"
    L6_2 = L7_2 .. L8_2
  end
  L4_2.TrackedPidTactics = L6_2
  L7_2 = GetRollingQueueHashTableAsString
  L8_2 = "InheritedTech-"
  L9_2 = A0_2
  L8_2 = L8_2 .. L9_2
  L7_2 = L7_2(L8_2)
  if L7_2 ~= nil then
    L8_2 = MpCommon
    L8_2 = L8_2.Base64Encode
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    L4_2.TrackedPidInheritedTechniques = L8_2
  end
  L8_2 = GetRollingQueueHashTableAsString
  L9_2 = "InheritedTact-"
  L10_2 = A0_2
  L9_2 = L9_2 .. L10_2
  L8_2 = L8_2(L9_2)
  if L8_2 ~= nil then
    L9_2 = MpCommon
    L9_2 = L9_2.Base64Encode
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    L4_2.TrackedPidInheritedTactics = L9_2
  end
  L9_2 = GetRollingQueueKeysAsString
  L10_2 = "gTechniquesTable"
  L9_2 = L9_2(L10_2)
  if L9_2 == nil then
    L9_2 = "gTechniquesTable table missing"
  end
  L4_2.AllTechniques = L9_2
  L10_2 = GetRollingQueueKeysAsString
  L11_2 = "gTacticsTable"
  L10_2 = L10_2(L11_2)
  if L10_2 == nil then
    L10_2 = "gTacticsTable table missing"
  end
  L4_2.AllTactics = L10_2
  L11_2 = MpCommon
  L11_2 = L11_2.GetPersistContextCountNoPath
  L12_2 = "TaintedMachine"
  L11_2 = L11_2(L12_2)
  if 1 <= L11_2 then
    L4_2.IsTainted = "true"
    L11_2 = MpCommon
    L11_2 = L11_2.GetPersistContextNoPath
    L12_2 = "TaintedMachine"
    L11_2 = L11_2(L12_2)
    if L11_2 then
      L12_2 = table
      L12_2 = L12_2.concat
      L13_2 = L11_2
      L14_2 = "|"
      L12_2 = L12_2(L13_2, L14_2)
      L4_2.TaintLevel = L12_2
    end
  else
    L4_2.IsTainted = "false"
  end
  L11_2 = GetAtomicCounter
  L12_2 = "TestMode_fde8"
  L11_2 = L11_2(L12_2)
  if L11_2 ~= nil then
    L12_2 = GetRollingQueueKeysAsString
    L13_2 = "SuspAttackServer"
    L12_2 = L12_2(L13_2)
    if L12_2 ~= nil then
      L4_2.AttackMachines = L12_2
    end
  end
  L12_2 = set_researchdata_fromtable
  L13_2 = L4_2
  L14_2 = A1_2
  L12_2(L13_2, L14_2)
end

AddResearchData = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = mp
  L4_2 = L4_2.ENGINEBUILD
  if L4_2 < 19900 then
    return
  end
  L4_2 = GetRealPidForScenario
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not A3_2 then
    A3_2 = 10
  end
  if L4_2 and A1_2 and A2_2 then
    L5_2 = string
    L5_2 = L5_2.lower
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = "%s|%s|%s"
    L8_2 = L4_2
    L9_2 = A1_2
    L10_2 = A2_2
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L6_2 = IsKeyInRollingQueue
    L7_2 = "tt-sigtriggers"
    L8_2 = L5_2
    L9_2 = true
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    if not L6_2 then
      L6_2 = pcall
      L7_2 = MpCommon
      L7_2 = L7_2.BmTriggerSig
      L8_2 = L4_2
      L9_2 = A1_2
      L10_2 = A2_2
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
      if L6_2 then
        L7_2 = AppendToRollingQueue
        L8_2 = "tt-sigtriggers"
        L9_2 = L5_2
        L10_2 = "1"
        L11_2 = A3_2
        L7_2(L8_2, L9_2, L10_2, L11_2)
      end
    end
  end
end

TT_SendBMSigTrigger = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    return
  end
  L5_2 = GetRealPidForScenario
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  A0_2 = L5_2
  if A3_2 == nil then
    A3_2 = 3600
  end
  L5_2 = AddPidSpecificTechniqueAndTactic
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L9_2 = A3_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
  if not A4_2 then
    A4_2 = false
  end
  if not A4_2 then
    L5_2 = AddResearchData
    L6_2 = A0_2
    L7_2 = false
    L5_2(L6_2, L7_2)
  end
  L6_2 = A0_2
  L5_2 = A0_2.sub
  L7_2 = 1
  L8_2 = 4
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if L5_2 == "pid:" then
    L5_2 = TT_SendBMSigTrigger
    L6_2 = A0_2
    L7_2 = A1_2
    L8_2 = A2_2
    L5_2(L6_2, L7_2, L8_2)
  end
end

TrackPidAndTechnique = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A0_2 and A0_2 ~= "" and A1_2 then
    L4_2 = type
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    if L4_2 == "table" then
      goto lbl_13
    end
  end
  do return end
  ::lbl_13::
  L4_2 = pairs
  L5_2 = A1_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    if L7_2 and L8_2 then
      L9_2 = TrackPidAndTechnique
      L10_2 = A0_2
      L11_2 = L7_2
      L12_2 = L8_2
      L13_2 = A2_2
      L14_2 = A3_2
      L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    end
  end
end

TrackPidAndMultipleTechniques = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    return
  end
  L5_2 = GetRealPidForScenario
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  A0_2 = L5_2
  if A3_2 == nil then
    A3_2 = 3600
  end
  L5_2 = AddPidSpecificTechniqueAndTactic
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L9_2 = A3_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
  if not A4_2 then
    A4_2 = false
  end
  if not A4_2 then
    L5_2 = AddResearchData
    L6_2 = A0_2
    L7_2 = true
    L5_2(L6_2, L7_2)
  end
  L6_2 = A0_2
  L5_2 = A0_2.sub
  L7_2 = 1
  L8_2 = 4
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if L5_2 == "pid:" and A2_2 ~= nil and A2_2 ~= "" then
    L5_2 = pcall
    L6_2 = bm
    L6_2 = L6_2.trigger_sig
    L7_2 = A1_2
    L8_2 = A2_2
    L9_2 = A0_2
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  end
end

TrackPidAndTechniqueBM = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A0_2 and A0_2 ~= "" and A1_2 then
    L4_2 = type
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    if L4_2 == "table" then
      goto lbl_13
    end
  end
  do return end
  ::lbl_13::
  L4_2 = pairs
  L5_2 = A1_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    if L7_2 and L8_2 then
      L9_2 = TrackPidAndTechniqueBM
      L10_2 = A0_2
      L11_2 = L7_2
      L12_2 = L8_2
      L13_2 = A2_2
      L14_2 = A3_2
      L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    end
  end
end

TrackPidAndMultipleTechniquesBM = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if A0_2 == nil then
    L1_2 = nil
    return L1_2
  end
  L1_2 = nil
  L3_2 = A0_2
  L2_2 = A0_2.lower
  L2_2 = L2_2(L3_2)
  if L2_2 == "cmdhstr" then
    L3_2 = mp
    L3_2 = L3_2.GetScannedPPID
    L3_2 = L3_2()
    L1_2 = L3_2
  elseif L2_2 == "bm" then
    L3_2 = pcall
    L4_2 = bm
    L4_2 = L4_2.get_current_process_startup_info
    L3_2, L4_2 = L3_2(L4_2)
    if L3_2 and L4_2 ~= nil then
      L1_2 = L4_2.ppid
    end
  elseif L2_2 == "amsi" then
    L3_2 = pcall
    L4_2 = mp
    L4_2 = L4_2.get_contextdata
    L5_2 = mp
    L5_2 = L5_2.CONTEXT_DATA_AMSI_OPERATION_PPID
    L3_2, L4_2 = L3_2(L4_2, L5_2)
    if L3_2 and L4_2 ~= nil then
      L1_2 = L4_2
    end
  elseif L2_2 == "rtp" then
    L3_2 = pcall
    L4_2 = mp
    L4_2 = L4_2.get_contextdata
    L5_2 = mp
    L5_2 = L5_2.CONTEXT_DATA_PROCESS_ID
    L3_2, L4_2 = L3_2(L4_2, L5_2)
    if L3_2 and L4_2 ~= nil then
      L1_2 = L4_2
    end
  end
  return L1_2
end

GetProcessPpidByScenario = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  if A0_2 == nil or A1_2 == nil or A2_2 == nil then
    L4_2 = nil
    return L4_2
  end
  L5_2 = A1_2
  L4_2 = A1_2.sub
  L6_2 = 1
  L7_2 = 4
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if L4_2 ~= "pid:" then
    L4_2 = GetProcessPpidByScenario
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    A1_2 = L4_2
  end
  if A1_2 == nil then
    L4_2 = nil
    return L4_2
  end
  L5_2 = A0_2
  L4_2 = A0_2.lower
  L4_2 = L4_2(L5_2)
  if L4_2 == "set" then
    if A3_2 == nil then
      A3_2 = 3600
    end
    L4_2 = MpCommon
    L4_2 = L4_2.AppendPersistContextNoPath
    L5_2 = A1_2
    L6_2 = A2_2
    L7_2 = A3_2
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = true
    return L4_2
  else
    L5_2 = A0_2
    L4_2 = A0_2.lower
    L4_2 = L4_2(L5_2)
    if L4_2 == "query" then
      L4_2 = MpCommon
      L4_2 = L4_2.QueryPersistContextNoPath
      L5_2 = A1_2
      L6_2 = A2_2
      return L4_2(L5_2, L6_2)
    else
      L4_2 = nil
      return L4_2
    end
  end
end

TrackCustomPersistContextNameByPPID = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 == nil then
    return
  end
  L1_2 = false
  L2_2 = ""
  L4_2 = A0_2
  L3_2 = A0_2.gmatch
  L5_2 = "."
  L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
  for L6_2 in L3_2, L4_2, L5_2 do
    L7_2 = string
    L7_2 = L7_2.byte
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 == 0 then
      if not L1_2 then
        L1_2 = true
      else
        L8_2 = L2_2
        L9_2 = " "
        L2_2 = L8_2 .. L9_2
        L1_2 = false
      end
    elseif 32 <= L7_2 and L7_2 <= 126 then
      L8_2 = L2_2
      L9_2 = L6_2
      L2_2 = L8_2 .. L9_2
      L1_2 = false
    else
      L1_2 = false
    end
  end
  return L2_2
end

normalize_unicode = L0_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  if A0_2 == nil or A1_2 == nil then
    L3_2 = false
    return L3_2
  end
  if A2_2 == nil then
    A2_2 = 0
  end
  L3_2 = MpCommon
  L3_2 = L3_2.QueryPersistContext
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L3_2 = MpCommon
    L3_2 = L3_2.AppendPersistContext
    L4_2 = A0_2
    L5_2 = A1_2
    L6_2 = A2_2
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = true
    return L3_2
  end
  L3_2 = false
  return L3_2
end

appendNotExistingFilePersistContext = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if A0_2 == nil or A1_2 == nil then
    L4_2 = false
    return L4_2
  end
  if A2_2 == nil then
    A2_2 = 0
  end
  L4_2 = false
  L5_2 = ipairs
  L6_2 = A1_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    if A3_2 ~= nil then
      L10_2 = mp
      L10_2 = L10_2.bitand
      L11_2 = A3_2
      L12_2 = 1
      L10_2 = L10_2(L11_2, L12_2)
      if L10_2 == 1 then
        L10_2 = MpCommon
        L10_2 = L10_2.AppendPersistContext
        L11_2 = A0_2
        L12_2 = L9_2
        L13_2 = A2_2
        L10_2(L11_2, L12_2, L13_2)
        L4_2 = true
    end
    else
      L10_2 = appendNotExistingFilePersistContext
      L11_2 = A0_2
      L12_2 = L9_2
      L10_2 = L10_2(L11_2, L12_2)
      if L10_2 then
        L4_2 = true
      end
    end
  end
  return L4_2
end

appendFilePersistContextFromList = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 ~= nil then
    L1_2 = type
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 == "string" then
      L1_2 = #A0_2
      if not (L1_2 <= 0) then
        goto lbl_12
      end
    end
  end
  do return end
  ::lbl_12::
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = string
  L2_2 = L2_2.format
  L3_2 = "0x%02X_0x%02X"
  L4_2 = mp
  L4_2 = L4_2.crc32
  L5_2 = -1
  L6_2 = A0_2
  L7_2 = 1
  L8_2 = #A0_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L5_2 = tostring
  L6_2 = #A0_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  if L1_2 ~= nil then
    L2_2 = #L1_2
    if not (L2_2 <= 10) then
      goto lbl_35
    end
  end
  do return end
  ::lbl_35::
  return L1_2
end

generateCustomStringHash = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if A0_2 ~= nil then
    L1_2 = type
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 == "string" then
      L1_2 = #A0_2
      if not (L1_2 <= 0) then
        goto lbl_12
      end
    end
  end
  do return end
  ::lbl_12::
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = string
  L2_2 = L2_2.gsub
  L3_2 = L1_2
  L4_2 = "\""
  L5_2 = ""
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2 = L2_2
  L2_2 = string
  L2_2 = L2_2.gsub
  L3_2 = L1_2
  L4_2 = " "
  L5_2 = ""
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2 = L2_2
  L2_2 = generateCustomStringHash
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = L1_2
  return L2_2, L3_2
end

getCustomStringHash = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A0_2 == nil then
    L2_2 = #A0_2
    if L2_2 <= 4 then
      return
    end
  end
  L2_2 = MpCommon
  L2_2 = L2_2.PathToWin32Path
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = sysio
  L2_2 = L2_2.IsFileExists
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L2_2 = sysio
  L2_2 = L2_2.GetFileLastWriteTime
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = sysio
  L3_2 = L3_2.GetLastResult
  L3_2 = L3_2()
  L3_2 = L3_2.Success
  if not L3_2 or L2_2 == 0 then
    return
  end
  L3_2 = L2_2 / 10000000
  L3_2 = L3_2 - 11644473600
  L4_2 = MpCommon
  L4_2 = L4_2.GetCurrentTimeT
  L4_2 = L4_2()
  L5_2 = L4_2 - L3_2
  if A1_2 ~= nil then
    L6_2 = false
    if L3_2 > L4_2 or A1_2 < L5_2 then
      L6_2 = true
    end
    L7_2 = L6_2
    L8_2 = L5_2
    L9_2 = L3_2
    L10_2 = L2_2
    L11_2 = L4_2
    return L7_2, L8_2, L9_2, L10_2, L11_2
  end
  L6_2 = L5_2
  L7_2 = L3_2
  L8_2 = L2_2
  L9_2 = L4_2
  return L6_2, L7_2, L8_2, L9_2
end

checkFileLastWriteTime = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = type
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  if L4_2 ~= "number" or A2_2 <= 0 or 15 < A2_2 or A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    L4_2 = false
    L5_2 = nil
    return L4_2, L5_2
  end
  L4_2 = mp
  L4_2 = L4_2.GetParentProcInfo
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if L4_2 ~= nil then
    L5_2 = IsTacticObservedForPid
    L6_2 = L4_2.ppid
    L7_2 = A1_2
    L8_2 = A3_2
    L5_2, L6_2 = L5_2(L6_2, L7_2, L8_2)
    if L5_2 then
      L7_2 = L5_2
      L8_2 = L6_2
      return L7_2, L8_2
    else
      L7_2 = IsTacticObservedForParents
      L8_2 = L4_2.ppid
      L9_2 = A1_2
      L10_2 = A2_2 - 1
      L11_2 = A3_2
      return L7_2(L8_2, L9_2, L10_2, L11_2)
    end
  else
    L5_2 = false
    L6_2 = nil
    return L5_2, L6_2
  end
end

IsTacticObservedForParents = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = type
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  if L4_2 ~= "number" or A2_2 <= 0 or 15 < A2_2 or A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    L4_2 = false
    L5_2 = nil
    return L4_2, L5_2
  end
  L4_2 = mp
  L4_2 = L4_2.GetParentProcInfo
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if L4_2 ~= nil then
    L5_2 = IsTechniqueObservedForPid
    L6_2 = L4_2.ppid
    L7_2 = A1_2
    L8_2 = A3_2
    L5_2, L6_2 = L5_2(L6_2, L7_2, L8_2)
    if L5_2 then
      L7_2 = L5_2
      L8_2 = L6_2
      return L7_2, L8_2
    else
      L7_2 = IsTechniqueObservedForParents
      L8_2 = L4_2.ppid
      L9_2 = A1_2
      L10_2 = A2_2 - 1
      L11_2 = A3_2
      return L7_2(L8_2, L9_2, L10_2, L11_2)
    end
  else
    L5_2 = false
    L6_2 = nil
    return L5_2, L6_2
  end
end

IsTechniqueObservedForParents = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A0_2 ~= nil then
    L2_2 = #A0_2
    if not (L2_2 <= 4) and A1_2 ~= nil then
      L2_2 = #A1_2
      if not (L2_2 <= 2) then
        goto lbl_12
      end
    end
  end
  do return end
  ::lbl_12::
  L2_2 = string
  L2_2 = L2_2.sub
  L3_2 = A0_2
  L4_2 = 1
  L5_2 = 3
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 ~= "..\\" then
    return
  end
  L2_2 = string
  L2_2 = L2_2.gsub
  L3_2 = A0_2
  L4_2 = "%.%.\\"
  L5_2 = ""
  L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2)
  if L3_2 == nil or L3_2 == 0 then
    return
  end
  L4_2 = string
  L4_2 = L4_2.gsub
  L5_2 = A1_2
  L6_2 = "\\"
  L7_2 = ""
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2)
  if L5_2 == nil or L5_2 == 0 then
    return
  end
  L5_2 = L5_2 + 1
  L6_2 = L5_2 - L3_2
  if L6_2 <= 0 then
    L6_2 = 1
  end
  L7_2 = string
  L7_2 = L7_2.gmatch
  L8_2 = A1_2
  L9_2 = "[^\\]+"
  L7_2 = L7_2(L8_2, L9_2)
  if L7_2 == nil then
    return
  end
  L8_2 = 1
  L9_2 = ""
  L10_2 = L7_2
  L11_2 = nil
  L12_2 = nil
  for L13_2 in L10_2, L11_2, L12_2 do
    L14_2 = L9_2
    L15_2 = L13_2
    L16_2 = "\\"
    L9_2 = L14_2 .. L15_2 .. L16_2
    if L6_2 <= L8_2 then
      break
    end
    L8_2 = L8_2 + 1
  end
  if L9_2 == "" then
    return
  end
  L10_2 = L9_2
  L11_2 = L2_2
  L10_2 = L10_2 .. L11_2
  return L10_2
end

expandRelativePath = L0_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    L3_2 = false
    L4_2 = nil
    return L3_2, L4_2
  end
  L3_2 = GetRealPidForScenario
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  A0_2 = L3_2
  if not A2_2 then
    A2_2 = false
  end
  L3_2 = IsKeyInRollingQueue
  L4_2 = "InheritedTech-"
  L5_2 = A0_2
  L4_2 = L4_2 .. L5_2
  L5_2 = A1_2
  L6_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2)
end

IsInheritedTechniqueObservedForPid = L0_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    L3_2 = false
    L4_2 = nil
    return L3_2, L4_2
  end
  L3_2 = GetRealPidForScenario
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  A0_2 = L3_2
  if not A2_2 then
    A2_2 = false
  end
  L3_2 = IsKeyInRollingQueue
  L4_2 = "InheritedTact-"
  L5_2 = A0_2
  L4_2 = L4_2 .. L5_2
  L5_2 = A1_2
  L6_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2)
end

IsInheritedTacticObservedForPid = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" or A2_2 == nil or A2_2 == "" then
    return
  end
  if not A3_2 then
    A3_2 = 3600
  end
  L4_2 = GetRealPidForScenario
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  A0_2 = L4_2
  L4_2 = IsInheritedTechniqueObservedForPid
  L5_2 = A0_2
  L6_2 = A2_2
  L4_2, L5_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L6_2 = L5_2
    L7_2 = ","
    L8_2 = A1_2
    L5_2 = L6_2 .. L7_2 .. L8_2
  else
    L5_2 = A1_2
  end
  L6_2 = AppendToRollingQueue
  L7_2 = "InheritedTech-"
  L8_2 = A0_2
  L7_2 = L7_2 .. L8_2
  L8_2 = A2_2
  L9_2 = L5_2
  L10_2 = A3_2
  L6_2(L7_2, L8_2, L9_2, L10_2)
end

AddInheritedTechniqueForPid = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" or A2_2 == nil or A2_2 == "" then
    return
  end
  if not A3_2 then
    A3_2 = 3600
  end
  L4_2 = GetRealPidForScenario
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  A0_2 = L4_2
  L4_2 = IsInheritedTacticObservedForPid
  L5_2 = A0_2
  L6_2 = A2_2
  L4_2, L5_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L6_2 = L5_2
    L7_2 = ","
    L8_2 = A1_2
    L5_2 = L6_2 .. L7_2 .. L8_2
  else
    L5_2 = A1_2
  end
  L6_2 = AppendToRollingQueue
  L7_2 = "InheritedTact-"
  L8_2 = A0_2
  L7_2 = L7_2 .. L8_2
  L8_2 = A2_2
  L9_2 = L5_2
  L10_2 = A3_2
  L6_2(L7_2, L8_2, L9_2, L10_2)
end

AddInheritedTacticForPid = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    return
  end
  L5_2 = GetRealPidForScenario
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  A0_2 = L5_2
  if not A4_2 then
    A4_2 = 3600
  end
  if A2_2 ~= nil and A2_2 ~= "" then
    L5_2 = AddInheritedTechniqueForPid
    L6_2 = A0_2
    L7_2 = A1_2
    L8_2 = A2_2
    L9_2 = A4_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  if A3_2 ~= nil and A3_2 ~= "" then
    L5_2 = AddInheritedTacticForPid
    L6_2 = A0_2
    L7_2 = A1_2
    L8_2 = A3_2
    L9_2 = A4_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
  end
end

AddInheritedTechniqueAndTacticToTargetPpid = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L6_2 = type
  L7_2 = A2_2
  L6_2 = L6_2(L7_2)
  if L6_2 == "number" and not (A2_2 <= 0) and not (15 < A2_2) and A0_2 ~= nil and A0_2 ~= "" and A1_2 ~= nil and A1_2 ~= "" then
    if A3_2 == nil then
      goto lbl_26
    end
    L6_2 = type
    L7_2 = A3_2
    L6_2 = L6_2(L7_2)
    if L6_2 == "table" then
      goto lbl_26
    end
  end
  do return end
  ::lbl_26::
  if A5_2 == nil then
    A5_2 = A0_2
  end
  L6_2 = mp
  L6_2 = L6_2.GetParentProcInfo
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if L6_2 ~= nil then
    L7_2 = L6_2.image_path
    if L7_2 ~= nil then
      goto lbl_39
    end
  end
  do return end
  ::lbl_39::
  if A3_2 ~= nil then
    L7_2 = ipairs
    L8_2 = A3_2
    L7_2, L8_2, L9_2 = L7_2(L8_2)
    for L10_2, L11_2 in L7_2, L8_2, L9_2 do
      L12_2 = string
      L12_2 = L12_2.find
      L13_2 = L6_2.image_path
      L14_2 = L11_2
      L15_2 = 1
      L16_2 = true
      L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
      if L12_2 then
        return
      end
    end
  end
  L7_2 = AddInheritedTechniqueForPid
  L8_2 = L6_2.ppid
  L9_2 = A5_2
  L10_2 = A1_2
  L11_2 = A4_2
  L7_2(L8_2, L9_2, L10_2, L11_2)
  L7_2 = AddTechniqueObservedToParents
  L8_2 = L6_2.ppid
  L9_2 = A1_2
  L10_2 = A2_2 - 1
  L11_2 = A3_2
  L12_2 = A4_2
  L13_2 = A5_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
end

AddTechniqueObservedToParents = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L6_2 = type
  L7_2 = A2_2
  L6_2 = L6_2(L7_2)
  if L6_2 == "number" and not (A2_2 <= 0) and not (15 < A2_2) and A0_2 ~= nil and A0_2 ~= "" and A1_2 ~= nil and A1_2 ~= "" then
    if A3_2 == nil then
      goto lbl_26
    end
    L6_2 = type
    L7_2 = A3_2
    L6_2 = L6_2(L7_2)
    if L6_2 == "table" then
      goto lbl_26
    end
  end
  do return end
  ::lbl_26::
  if A5_2 == nil then
    A5_2 = A0_2
  end
  L6_2 = mp
  L6_2 = L6_2.GetParentProcInfo
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if L6_2 ~= nil then
    L7_2 = L6_2.image_path
    if L7_2 ~= nil then
      goto lbl_39
    end
  end
  do return end
  ::lbl_39::
  if A3_2 ~= nil then
    L7_2 = ipairs
    L8_2 = A3_2
    L7_2, L8_2, L9_2 = L7_2(L8_2)
    for L10_2, L11_2 in L7_2, L8_2, L9_2 do
      L12_2 = string
      L12_2 = L12_2.find
      L13_2 = L6_2.image_path
      L14_2 = L11_2
      L15_2 = 1
      L16_2 = true
      L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
      if L12_2 then
        return
      end
    end
  end
  L7_2 = AddInheritedTacticForPid
  L8_2 = L6_2.ppid
  L9_2 = A5_2
  L10_2 = A1_2
  L11_2 = A4_2
  L7_2(L8_2, L9_2, L10_2, L11_2)
  L7_2 = AddTacticsObservedToParents
  L8_2 = L6_2.ppid
  L9_2 = A1_2
  L10_2 = A2_2 - 1
  L11_2 = A3_2
  L12_2 = A4_2
  L13_2 = A5_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
end

AddTacticsObservedToParents = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 == nil then
    return
  end
  if not A5_2 then
    A5_2 = 3600
  end
  if A1_2 ~= nil and A1_2 ~= "" then
    L6_2 = AddTechniqueObservedToParents
    L7_2 = A0_2
    L8_2 = A1_2
    L9_2 = A3_2
    L10_2 = A4_2
    L11_2 = A5_2
    L12_2 = A0_2
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
  if A2_2 ~= nil and A2_2 ~= "" then
    L6_2 = AddTacticsObservedToParents
    L7_2 = A0_2
    L8_2 = A2_2
    L9_2 = A3_2
    L10_2 = A4_2
    L11_2 = A5_2
    L12_2 = A0_2
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
end

AddTechniqueAndTacticToParents = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  
  function L4_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    if A0_3 == nil or A1_3 == nil or A2_3 == nil then
      return
    end
    L3_3 = "BM_M"
    L4_3 = nil
    L5_3 = string
    L5_3 = L5_3.sub
    L6_3 = A1_3
    L7_3 = 1
    L8_3 = #L3_3
    L5_3 = L5_3(L6_3, L7_3, L8_3)
    if L5_3 == L3_3 then
      L4_3 = A1_3
    else
      L5_3 = string
      L5_3 = L5_3.match
      L6_3 = A1_3
      L7_3 = "^[tT][0-9][0-9][0-9][0-9]"
      L5_3 = L5_3(L6_3, L7_3)
      if L5_3 then
        L5_3 = L3_3
        L6_3 = A1_3
        L4_3 = L5_3 .. L6_3
      end
    end
    if L4_3 ~= nil then
      L5_3 = MpCommon
      L5_3 = L5_3.AppendPersistContext
      L6_3 = A0_3
      L7_3 = L4_3
      L8_3 = A2_3
      L5_3(L6_3, L7_3, L8_3)
    end
    return L4_3
  end
  
  ValidateAddTechniqueInput = L4_2
  if A0_2 ~= nil then
    L4_2 = type
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    if L4_2 == "string" then
      L4_2 = #A0_2
      if not (L4_2 <= 4) then
        goto lbl_14
      end
    end
  end
  do return end
  ::lbl_14::
  if A1_2 == nil then
    return
  end
  if A2_2 == nil then
    A2_2 = 0
  end
  L4_2 = "FilePersistContextToMpAttribute.A"
  if A3_2 ~= nil then
    L4_2 = A3_2
  end
  L5_2 = "BM_M"
  L6_2 = nil
  L7_2 = type
  L8_2 = A1_2
  L7_2 = L7_2(L8_2)
  if L7_2 == "string" then
    L7_2 = ValidateAddTechniqueInput
    L8_2 = A0_2
    L9_2 = A1_2
    L10_2 = A2_2
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    if L7_2 ~= nil then
      L6_2 = true
    end
  else
    L7_2 = type
    L8_2 = A1_2
    L7_2 = L7_2(L8_2)
    if L7_2 == "table" then
      L7_2 = ipairs
      L8_2 = A1_2
      L7_2, L8_2, L9_2 = L7_2(L8_2)
      for L10_2, L11_2 in L7_2, L8_2, L9_2 do
        L12_2 = ValidateAddTechniqueInput
        L13_2 = A0_2
        L14_2 = L11_2
        L15_2 = A2_2
        L12_2 = L12_2(L13_2, L14_2, L15_2)
        if L12_2 ~= nil then
          L6_2 = true
        end
      end
    else
      return
    end
  end
  if L6_2 then
    L7_2 = MpCommon
    L7_2 = L7_2.AppendPersistContext
    L8_2 = A0_2
    L9_2 = L4_2
    L10_2 = A2_2
    L7_2(L8_2, L9_2, L10_2)
  end
  return L6_2
end

TrackFileAndTechnique = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 == nil or A1_2 == nil then
    return
  end
  L3_2 = A0_2
  L2_2 = A0_2.sub
  L4_2 = 1
  L5_2 = 4
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 ~= "pid:" then
    L2_2 = GetProcessPpidByScenario
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    A0_2 = L2_2
  end
  L2_2 = mp
  L2_2 = L2_2.GetParentProcInfo
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 == nil then
    return
  end
  L3_2 = string
  L3_2 = L3_2.lower
  L4_2 = L2_2.image_path
  L3_2 = L3_2(L4_2)
  L4_2 = string
  L4_2 = L4_2.match
  L5_2 = L3_2
  L6_2 = "([^\\]+)$"
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = false
  L6_2 = type
  L7_2 = A1_2
  L6_2 = L6_2(L7_2)
  if L6_2 == "table" then
    L6_2 = A1_2[L4_2]
    if L6_2 ~= nil then
      L5_2 = true
    end
  else
    L6_2 = type
    L7_2 = A1_2
    L6_2 = L6_2(L7_2)
    if L6_2 == "string" then
      L6_2 = string
      L6_2 = L6_2.find
      L7_2 = A1_2
      L8_2 = L4_2
      L9_2 = 1
      L10_2 = true
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
      if L6_2 ~= nil then
        L5_2 = true
      end
    end
  end
  L6_2 = L5_2
  L7_2 = L4_2
  return L6_2, L7_2
end

checkParentProcessNameFromListByPPID = L0_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  if A2_2 < 1 or A0_2 == nil or A1_2 == nil then
    return
  end
  L4_2 = A0_2
  L3_2 = A0_2.sub
  L5_2 = 1
  L6_2 = 4
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 ~= "pid:" then
    L3_2 = GetProcessPpidByScenario
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    A0_2 = L3_2
  end
  L3_2 = mp
  L3_2 = L3_2.GetParentProcInfo
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 == nil then
    return
  end
  L4_2 = {}
  L5_2 = L3_2
  L4_2[1] = L5_2
  L5_2 = L3_2
  L6_2 = 1
  L7_2 = A2_2 - 1
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = mp
    L10_2 = L10_2.GetParentProcInfo
    L11_2 = L5_2.ppid
    L10_2 = L10_2(L11_2)
    L5_2 = L10_2
    if L5_2 == nil then
      break
    end
    L10_2 = table
    L10_2 = L10_2.insert
    L11_2 = L4_2
    L12_2 = L5_2
    L10_2(L11_2, L12_2)
  end
  L6_2 = false
  L7_2 = ""
  L8_2 = ipairs
  L9_2 = L4_2
  L8_2, L9_2, L10_2 = L8_2(L9_2)
  for L11_2, L12_2 in L8_2, L9_2, L10_2 do
    L13_2 = string
    L13_2 = L13_2.lower
    L14_2 = L12_2.image_path
    L13_2 = L13_2(L14_2)
    L14_2 = string
    L14_2 = L14_2.match
    L15_2 = L13_2
    L16_2 = "([^\\]+)$"
    L14_2 = L14_2(L15_2, L16_2)
    L15_2 = type
    L16_2 = A1_2
    L15_2 = L15_2(L16_2)
    if L15_2 == "table" then
      L15_2 = A1_2[L14_2]
      if L15_2 ~= nil then
        L6_2 = true
        L15_2 = L7_2
        L16_2 = ";"
        L17_2 = L14_2
        L7_2 = L15_2 .. L16_2 .. L17_2
      end
    else
      L15_2 = type
      L16_2 = A1_2
      L15_2 = L15_2(L16_2)
      if L15_2 == "string" then
        L15_2 = string
        L15_2 = L15_2.find
        L16_2 = A1_2
        L17_2 = L14_2
        L18_2 = 1
        L19_2 = true
        L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2)
        if L15_2 ~= nil then
          L6_2 = true
          L15_2 = L7_2
          L16_2 = ";"
          L17_2 = L14_2
          L7_2 = L15_2 .. L16_2 .. L17_2
        end
      end
    end
  end
  L8_2 = L6_2
  L9_2 = L7_2
  return L8_2, L9_2
end

checkParentProcessNameFromListByPPIDRecursive = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = {}
  L0_2["9e8f722b-3aa1-4069-ab9f-fc8485ca4af9"] = true
  L0_2["e333e141-0df0-4d49-8334-ce4a3d2b51cf"] = true
  L0_2["a97898e3-0e7b-4c74-9c71-cf807c8a9eea"] = true
  L0_2["ebc2ebcb-43e4-4f76-8c75-2be36bdead88"] = true
  L0_2["fff415a5-d876-4e19-af91-a430fb7df00a"] = true
  L0_2["0b20fcfe-9850-4391-aff0-75075c0dbb1a"] = true
  L0_2["3b7984a2-ac4f-44ab-aefb-e0673362ee6a"] = true
  L0_2["0b11e29f-70a9-4c86-8858-55b9f37e3020"] = true
  L0_2["194c1c9f-90d1-40c8-9ba5-7fa5a43617f9"] = true
  L0_2["c1ed41b8-316f-4206-8655-2039a416ecf1"] = true
  L0_2["831aa694-4c12-49b5-9949-a4976dc1d67d"] = true
  L0_2["43a876e1-c5f3-4bcb-be8f-a0e405839830"] = true
  L0_2["93576e31-5469-4e26-a549-3a18220dc565"] = true
  L0_2["f3b27d4b-1c32-4f7a-b947-7a67617a319f"] = true
  L0_2["331f9d38-ce30-4a30-94c1-f70ab226d869"] = true
  L0_2["19361904-3386-43a8-961b-e86764aea86b"] = true
  L0_2["b49066f2-d2ca-44c6-a197-b75bb646b99f"] = true
  L0_2["66da7d04-65b9-4832-9cc1-5e9c5af5327c"] = true
  L0_2["4529e5c0-f3aa-4be7-a530-9ab6a3735062"] = true
  L0_2["0a7b537b-2304-49bf-b124-14194e13737b"] = true
  L0_2["23dc6e7f-39ea-45a4-a5b5-86d4223d3042"] = true
  L0_2["e0413d41-3502-4db1-9039-c88af24ead06"] = true
  L0_2["4574428d-d2dc-47e6-ae9f-9e24438c82e7"] = true
  L0_2["e17a58f3-7283-464c-a452-eb64ad83ec97"] = true
  L0_2["68521817-d140-4b74-a14f-eed29027e376"] = true
  L0_2["072b5815-bdf9-4765-bc12-6d049ae4efff"] = true
  L0_2["bcb207b2-cc60-4212-9043-d12afadb0fbc"] = true
  L0_2["49892dca-c126-4dac-95e7-f5757cccc16a"] = true
  L0_2["74e61dec-e6ab-4d90-91b1-ba372a703e06"] = true
  L0_2["2257c4e1-c3b0-439a-9119-fb2d0552bb43"] = true
  L0_2["3676a7b6-192c-4f13-a3ec-b0afab8f8d2b"] = true
  L0_2["fb85f5cc-d3fa-4d69-b25f-38f49233ef37"] = true
  L0_2["665a0743-4170-4383-b6ba-28935c57d01b"] = true
  L0_2["5ee978e9-163e-4d1e-b53a-61a36ba2b18a"] = true
  L0_2["7f050e73-5a3d-4813-85af-82422a793fad"] = true
  L0_2["9cc53ef5-7b0f-4aad-879c-8c7928b10dbe"] = true
  L0_2["94deb9b0-3515-48d3-8f59-0f596d5bb090"] = true
  L0_2["56dcd088-5605-4d08-b572-a504cf4dae65"] = true
  L0_2["174fa9ca-e8dd-4ae6-bcd8-8cb2f2204f95"] = true
  L0_2["932f5304-5c67-4d54-b103-b78bf287a2c3"] = true
  L0_2["a58b13d8-a8f3-4b11-b655-2d93970f6374"] = true
  L0_2["e53d4363-125e-4fdb-9135-f4bd0b35568e"] = true
  L0_2["d7c7c745-195f-4223-9c7a-99fb420fd000"] = true
  L0_2["5027d848-972a-4730-90b8-c684eff2122c"] = true
  L0_2["45575928-30c1-4b72-8bf9-0d19cc13e52c"] = true
  L0_2["50da504b-557b-4e97-beab-4c91dfb8c56d"] = true
  L0_2["0267a949-b82d-4347-b173-660c76e30da6"] = true
  L0_2["64032f4d-626a-4a92-ae42-d693ef078591"] = true
  L0_2["4a7a5002-cd9d-4b70-ad48-f8c53f86145b"] = true
  L0_2["8645a59d-7655-442b-9c39-bffe1294f8cb"] = true
  L0_2["ba8974ba-9b35-4ad0-8413-8ac01f765545"] = true
  L0_2["336876bb-1a0d-43f5-bf32-ce406f723b5e"] = true
  L0_2["02504642-40b7-40dd-bb23-d393ce4cc043"] = true
  L0_2["6d73cb3c-f9ca-4fd1-a357-695eb0fb8d5b"] = true
  L0_2["68c53d9c-8e07-4f7e-9b50-2b70499b95d0"] = true
  L0_2["d9390c80-4dad-4cc5-80c6-5da2bd33d673"] = true
  L0_2["4338bd78-8653-4e6f-b8cf-893b6b5dca63"] = true
  L0_2["238b89a1-be2f-4939-91dd-173c76c18095"] = true
  L0_2["0112e007-42b5-4355-ac50-01f8b6f60daa"] = true
  L0_2["6d4e7515-41ef-43fc-96f8-27e2fd492a19"] = true
  L0_2["f2c2c063-9ed1-4f73-a624-1d8fca3ee19e"] = true
  L0_2["b7f116fa-c0c0-4e37-aa6d-64790ea61007"] = true
  L0_2["109420d0-e127-480e-aad0-20bb832d9709"] = true
  L0_2["e2882248-03d6-4da2-87f7-da8967cf4672"] = true
  L0_2["d06d867f-fbea-4112-aec2-a437ff86bbfd"] = true
  L0_2["0ca80520-ab29-4a0a-86ae-e4f834611541"] = true
  L0_2["209400ca-9614-45e3-a14b-070d8d339b9e"] = true
  L0_2["26496fc8-a570-42b7-be89-a82840a08cbb"] = true
  L0_2["0b23e19e-541d-4cb3-89f4-419bc9c593a6"] = true
  L0_2["d0dc6b38-53fa-4bc6-949f-6d9dbe2d0024"] = true
  L0_2["6b763308-b0e7-415e-b1d6-4ed29c8d0155"] = true
  L0_2["864d05f5-3f47-4fb0-aecd-3d75ccd0de94"] = true
  L0_2["7b5315ed-6572-462d-8284-189038da8165"] = true
  L0_2["c7d04a61-5996-49a0-ae1b-f057623509c3"] = true
  L0_2["952d5943-138b-4d48-a5f3-078526a57c5d"] = true
  L0_2["c2cc1990-5094-4e7e-ab4f-65af1c52df24"] = true
  L0_2["aea7413a-28a8-48ef-a443-4c5c27161cb9"] = true
  L0_2["0831a921-cf12-4ecf-a3a2-0aeaba8ed268"] = true
  L0_2["f74b2f70-3ee6-4410-aca1-fa7f6696907a"] = true
  L0_2["fcfb1e78-be1a-45a2-b166-1e6c088ab4df"] = true
  L0_2["9d0004e6-2aeb-46ed-ac66-42719249fbfd"] = true
  L0_2["9e7cdd29-13c8-42c6-b852-6ad49cb47be6"] = true
  L0_2["7978aa21-cbb0-431f-8048-b6fe6a372187"] = true
  L0_2["51401eaf-db7b-410e-9830-aaf6170095d1"] = true
  L0_2["e8869022-0cda-47b4-98a0-2e481fa8bb39"] = true
  L0_2["9e2558e3-1b29-4bb1-9aa9-00f0bbf7df7a"] = true
  L0_2["229ff4d6-9334-4f5b-a766-b89c5cd7493a"] = true
  L0_2["48aa7ccc-e241-4c9c-8c74-2f60aac9f1af"] = true
  L0_2["e6d6bc19-a278-42e4-a2c9-de0dc3107cb1"] = true
  L0_2["e338937b-e3b8-4023-b9df-48372faa73b1"] = true
  L0_2["efa9c680-5281-4eeb-8760-fbe4a02c1cdf"] = true
  L0_2["a36f0250-09a4-4a6e-afc8-146c8d0f2523"] = true
  L0_2["2fb7ef2c-b321-471f-8f3f-def24ce84c96"] = true
  L0_2["8c450d96-3c8c-4fd7-b212-b194b86aeb0b"] = true
  L0_2["6aafad28-3462-4c54-9fa2-05525d654885"] = true
  L0_2["d7d1b4c2-d239-42be-aff7-f77bf22bc50a"] = true
  L0_2["84da20cd-3dad-4d27-b1a1-e4c2da9fe3de"] = true
  L0_2["d8c1a97c-1989-47f1-bad7-f61fc9fec10f"] = true
  L0_2["17c4f810-b36a-4b9b-b522-6ffa44933865"] = true
  L0_2["bf4cd6de-a593-46de-8705-e89a98a1a51b"] = true
  L0_2["c14ea10d-54bf-42d7-848c-cc9c895f8a0c"] = true
  L0_2["26b0eb5d-5020-4a63-b60f-16cabf0b5f50"] = true
  L0_2["f42f4b2b-f13a-4c8b-881a-6f1ffb1aa266"] = true
  L0_2["f11c8ce9-2021-4261-b39b-a1b99ca660d4"] = true
  L0_2["cdd251fe-9ff1-4da0-82f8-b2f559040782"] = true
  L0_2["0eb1e5d9-3dd3-4038-833e-834da63e8625"] = true
  L0_2["692555dd-b6cc-468f-9b4e-951f039ad383"] = true
  L0_2["06c1f48d-d514-415e-b385-713d1283a52d"] = true
  L0_2["1fa3fe7c-5db3-4537-9622-d1636572a18d"] = true
  L0_2["f16bd8a4-0f46-4633-aaae-048665ff9d56"] = true
  L0_2["207f432c-cb0c-483d-b407-2769b035f309"] = true
  L0_2["760925bc-cf36-40b7-bb44-c784fd7220c7"] = true
  L0_2["7742aae5-2519-4ec1-98e5-56c231438f79"] = true
  L0_2["629c1926-47fd-4a94-b2db-1f69647460ff"] = true
  L0_2["2a0e6866-eb55-4558-a3e6-9946ac41f870"] = true
  L0_2["29a97a64-bd43-4ce6-aaea-3982b1542e93"] = true
  L0_2["1e3b04c1-46c0-43e2-b456-d02c67cbfb6b"] = true
  L0_2["72c339fc-1375-4814-a4e3-f7fb7e8c8cf1"] = true
  L0_2["6b2d7646-e0df-42db-b5ee-4e228e0d6488"] = true
  L0_2["863e9bf6-e7c5-47e6-a63e-f94ef9f6ebe0"] = true
  L0_2["a62a1460-a7bd-4d81-87e4-f459245de4ad"] = true
  L0_2["bb58c89e-34d4-48eb-b965-8990bfab8d0f"] = true
  L0_2["fd0c1195-045d-48bf-92fc-0f241e525c3d"] = true
  L0_2["717551f8-5e59-45fe-aebe-eb3abd64cfec"] = true
  L0_2["7d32b9ed-c15f-486b-95bb-125216f5f7e7"] = true
  L0_2["a1984def-d4e6-476f-895f-6a6837704502"] = true
  L0_2["7eaf2863-7a12-4d95-8674-96407f926580"] = true
  L0_2["e89ae3b9-fa0c-43b2-b94a-61910e07d57d"] = true
  L0_2["583ad211-3e4b-4b8d-a903-9ef1cdfd8ff7"] = true
  L0_2["d9a18c49-7d30-4a5a-b58d-a0d124625781"] = true
  L0_2["df391576-f230-45b2-8d4f-03c3bacfabdd"] = true
  L0_2["52709bd7-7299-41a7-8b26-a0f6f80e1828"] = true
  L0_2["d884ee3c-20ae-4fee-b7be-719717882a61"] = true
  L0_2["89ece62e-abcc-49f3-9493-2e960aeddf09"] = true
  L0_2["7682190b-f1a4-494b-8bce-8854ab1f30ed"] = true
  L0_2["24a2479a-cecb-4c12-b83d-d5d6bc7d5c9a"] = true
  L0_2["7b003a1e-32d8-4d0c-b89e-b3f830ef9298"] = true
  L0_2["d33f1674-ec6e-4d30-9580-0f3a7fe9192d"] = true
  L0_2["482e5bc7-e3a3-470d-90df-5ae60e66de63"] = true
  L0_2["2fd18d75-7637-46c5-a38a-6fa157c323cd"] = true
  L0_2["dd03a6fe-556b-4162-aba3-1b967b71505c"] = true
  L0_2["a449ec79-829f-4a14-8ed4-c46d20cf7e98"] = true
  L0_2["73194067-7f1f-4f59-9a91-c513f9674595"] = true
  L0_2["142c86bb-2ee0-417d-8ebd-798e1b9168f1"] = true
  L0_2["bcdb10c5-56eb-47f4-a6b5-6c4b2dbeb995"] = true
  L0_2["557ac93d-2be7-43a5-a6a4-c58541c95d17"] = true
  L0_2["8eaddf99-40ac-499c-96bf-3f88d9729ed8"] = true
  L0_2["772b3e06-dce8-4c91-b82a-eb416497d1de"] = true
  L0_2["cc391f9b-f27c-41cb-ba4f-15e91c636b19"] = true
  L0_2["01fe0665-1ce5-4583-bafe-f2bf8a6a73d0"] = true
  L0_2["d5d90bec-2758-42d0-bf56-02d956bf135c"] = true
  L0_2["1bf8c75c-9326-4e7e-9dd3-5c1892c0ffc3"] = true
  L0_2["b0272ed6-629f-42e9-bef5-3b879cf44196"] = true
  L0_2["40a6c58e-df9e-46a2-b702-2f0e11c8470b"] = true
  L0_2["c0bd6124-45c1-4996-924c-46167a59a818"] = true
  L0_2["d3e3a858-f780-4d2c-b8e8-22d79d916ec1"] = true
  L0_2["4ade8f48-1ef2-47f8-b554-daacc40fd518"] = true
  L0_2["e3186a6e-fb5c-43b4-b5be-3d1ee0ebf674"] = true
  L0_2["c2773dc2-bddd-44a8-b797-e12e0e64cb8e"] = true
  L0_2["9022e75e-dfe8-4dcb-bd7a-df2a8168ac8d"] = true
  L0_2["277894f2-d95f-41b8-b7ac-9b9bc223031c"] = true
  L0_2["1b9d508b-eb79-4d91-9f66-dadb514ab39c"] = true
  L0_2["03812f4b-e4df-4e71-a7e9-02e02301c4b1"] = true
  L0_2["922ad644-d59b-4338-a818-0d6314a78536"] = true
  L0_2["f626ea2f-6a93-4850-bfa7-9018adb65582"] = true
  L0_2["86486b45-9fab-4b60-8ff6-d5477783a825"] = true
  L0_2["53e28208-6aac-4f9b-8d60-f4a9e05c8774"] = true
  L0_2["4cbb9f77-ea9f-41a0-b52a-960ac2dc5f01"] = true
  L0_2["c85a1588-d8b9-4c80-83a0-d6a87be9b712"] = true
  L0_2["ac94ef0a-20cd-43aa-8924-6bd156ecd6f0"] = true
  L0_2["27823e87-5194-40fa-a692-e3aefa2faa16"] = true
  L0_2["83d70c4c-fcb9-4de9-9880-2c34b95f0439"] = true
  L0_2["187d8278-def1-4813-8a1d-3614e9fcdbb4"] = true
  L0_2["e2741811-7cad-4941-a6d6-a090d7a11253"] = true
  L0_2["a9e4e1ae-044e-4b18-85ba-b1e40d43b511"] = true
  L0_2["f576af69-ad0b-4fef-ba5f-33a21773df43"] = true
  L0_2["8081f7dc-c79d-415d-8a14-dda42304d1a4"] = true
  L0_2["d148c7f3-45f0-4a78-8647-b46b2cac7b64"] = true
  L0_2["02781b2f-3388-4de3-ac1e-34d8a69b4b9d"] = true
  L0_2["a10a291b-4384-4161-98de-81e52f69df88"] = true
  L0_2["c31b3172-0a24-439d-9289-19a636ca8084"] = true
  L0_2["e5b09fc4-d1d9-42ff-a826-91792c600b87"] = true
  L0_2["f011ea84-bfc4-4e3a-b313-2eb3519586ec"] = true
  L0_2["d79e04ae-7499-4740-8bfa-a871fae7f415"] = true
  L0_2["0a22f1df-85ef-4b8e-ad38-641b33651e9d"] = true
  L0_2["fa9b0987-a412-4c68-9624-0909df6ee8c1"] = true
  L0_2["5df1c174-1f0f-4a02-b449-e1fc85d2370a"] = true
  L0_2["ec1154b2-d473-41a0-b914-d27b2bf64ac8"] = true
  L0_2["de8ad6e8-f9f2-45f4-b7dd-be2fda319016"] = true
  L0_2["e9cf8e43-27d7-47a9-a79d-2e04141762a7"] = true
  L0_2["50b7f255-6811-4f15-80ac-ffbab20c5878"] = true
  L0_2["551a8a43-bd4f-4ee0-82ac-0a3336533959"] = true
  L0_2["ae71b458-f29f-4887-9204-d01d649088bb"] = true
  L0_2["ecb93044-1c56-489a-a5cd-7a5acfbf53d5"] = true
  L0_2["5a324dde-dcb5-4e3a-b2c1-1fdc6c60d48e"] = true
  L0_2["a6454b24-1b9a-4dc0-974b-c3fe4bf71f2a"] = true
  L0_2["b001a172-4636-4058-82a4-88803b90eb08"] = true
  L0_2["67bad259-d464-44e7-b65c-83905665dd84"] = true
  L0_2["2a4e6c81-1a1e-4bee-9c8a-a7ac7b9e8d9e"] = true
  L0_2["457cf4d7-3847-4e71-9140-436a62db100c"] = true
  L0_2["b9d143cb-d802-43bb-a820-9790c501e286"] = true
  L0_2["07aebed2-fa9b-4da3-bde1-a4e53168030f"] = true
  L0_2["88598bde-cc7f-42cd-b32d-5423c5faf3ba"] = true
  L0_2["c7ec637c-878a-4f01-8c2c-b5cd6da7b836"] = true
  L0_2["1f14b09f-9477-4311-8aa0-4b103e996cdb"] = true
  L0_2["88409457-5141-4c6a-9654-386e5f9dfc7a"] = true
  L0_2["d45a1e7f-069a-44ce-863d-996b3afc8a32"] = true
  L0_2["b609c345-933c-4cfd-9dbf-4923a6e25f73"] = true
  L0_2["cf12250b-0606-4ccb-886a-0938c73de778"] = true
  L0_2["f3588a11-f071-4990-91be-1f99e816f9b6"] = true
  L0_2["b423ea88-8ed1-4b93-a7bd-04d80eb90ee1"] = true
  L0_2["73604805-290b-4930-b64d-c10694aca30c"] = true
  L0_2["da31a007-6033-43a1-bbc4-566981c87dbd"] = true
  L0_2["6c88703a-ff48-419b-a8f0-42effae4881b"] = true
  L0_2["81ffcd20-4c13-4353-94d6-885c1c96f4a1"] = true
  L0_2["a3906bc6-a3b6-4e49-bd0f-c0bff3e648e8"] = true
  L0_2["95034fa2-fe1f-489d-8ecc-827deb470cec"] = true
  L0_2["34f75caf-f95c-4149-bb5c-091730d4ade3"] = true
  L0_2["68420a91-f498-481c-9dc1-f957f15fcc65"] = true
  L0_2["efa6410a-b0a6-40be-9b26-69e397f22dd4"] = true
  L0_2["73e3f0fb-cebd-4d0d-b0a3-b82bcd7d7684"] = true
  L0_2["1ef3488a-db57-4847-abb5-a5b3aee8f942"] = true
  L0_2["367f773d-1bd7-4b11-9e2d-14248dce10e7"] = true
  L0_2["0ac1bd10-462e-43ba-9740-f12e7ba862ce"] = true
  L0_2["0ca6e27d-1eff-4640-af51-f60da7b266e0"] = true
  L0_2["e0c79e35-7c39-49f6-8650-edcc69aaba61"] = true
  L0_2["078d14d5-bba0-4c1e-86ea-fe726b17aa59"] = true
  L0_2["de48c3c7-1162-479d-b727-b9a7a1f27ebb"] = true
  L0_2["9f9ad922-1c9b-4b26-a2a7-b8fe2ce243b1"] = true
  L0_2["fa21229b-8de2-4e42-8176-23518d5fee8e"] = true
  L0_2["00767538-3aeb-47f5-b21e-068eaa2d3585"] = true
  L0_2["cda6a59a-bdd7-4269-a89a-cfe0cc035844"] = true
  L0_2["e0f54a9a-e7c7-4139-a528-7e616a808425"] = true
  L0_2["1cbdbd86-9676-4a69-8266-75550389e512"] = true
  L0_2["5240d2ad-529b-4ff2-be61-24c22e2dc223"] = true
  L0_2["9508acec-64bb-4c8b-b777-e4623ed552c4"] = true
  L0_2["2baef0fb-732b-48be-8b05-8378c32b3863"] = true
  L0_2["ec086568-3b10-43b7-acf7-4a2822fc8663"] = true
  L0_2["c9093900-b1d3-42c7-808b-5b7e0da66ca4"] = true
  L0_2["a3830578-0653-45ea-9095-97da11450d60"] = true
  L0_2["5ad249ba-02d7-4358-8475-a9c880d5ac2e"] = true
  L0_2["7c219fe2-6478-45bc-b1b3-5c6e782bdb91"] = true
  L0_2["3930f511-4397-44c1-aa4e-35bfc85b3412"] = true
  L0_2["9c692ae1-ba89-46b4-9917-6d9a4cbb12b3"] = true
  L0_2["f562fd84-a462-4425-a835-761be8c9d403"] = true
  L0_2["abae58f7-d355-46e7-9be3-c37a9b70bb5a"] = true
  L0_2["e18a8e9d-0168-4175-9f80-8886b3cd1316"] = true
  L0_2["083d3fb1-ce12-4ba4-ae1d-8efd37e2c0f4"] = true
  L0_2["5e25bb3b-ef5e-4757-97ca-7187daf43243"] = true
  L0_2["49739652-cc07-49c3-8b31-0c7eb0d0f4dc"] = true
  L0_2["add9e0a6-9239-4ceb-ac67-c7e9358f58e3"] = true
  L0_2["dd8fc33b-7a0f-4243-a4fa-5df4600bfcb6"] = true
  L0_2["d60f87ec-db7d-4372-bc31-c770b7382f93"] = true
  L0_2["f35d5ad5-45af-41b0-9d28-0f73e845187b"] = true
  L1_2 = true
  L0_2["1cf3c410-ef90-4f2d-b20d-a56b16de0e83"] = L1_2
  L1_2 = "090b3ee2-3ac6-46b9-ba96-7a3b8a81cd1f"
  L2_2 = true
  L0_2[L1_2] = L2_2
  L1_2 = "cfca059b-1611-4471-b00e-6670b6cc60ca"
  L2_2 = true
  L0_2[L1_2] = L2_2
  L1_2 = "c677c28d-2c94-49ef-a250-5099ed00cea8"
  L2_2 = true
  L0_2[L1_2] = L2_2
  L1_2 = "7d8df643-d167-4f22-bb7b-512e3fdbb275"
  L2_2 = true
  L0_2[L1_2] = L2_2
  L1_2 = "46449c61-d6a2-45fa-8851-5fa8a46d5ed2"
  L2_2 = true
  L0_2[L1_2] = L2_2
  L1_2 = "40222833-e511-47af-9324-40c4531ba777"
  L2_2 = true
  L0_2[L1_2] = L2_2
  L1_2 = "6d219195-ecf9-401b-9892-3568b7ee1833"
  L2_2 = true
  L0_2[L1_2] = L2_2
  L1_2 = "27d074db-bf2f-4c3d-a19d-498603494a51"
  L2_2 = true
  L0_2[L1_2] = L2_2
  L1_2 = "e0c103d7-e635-4e0e-b800-9b31892842f4"
  L2_2 = true
  L0_2[L1_2] = L2_2
  L1_2 = "e9323610-6354-4b09-a4aa-2307494bba43"
  L2_2 = true
  L0_2[L1_2] = L2_2
  L1_2 = "0e2eb614-0a43-4328-9264-41c261c891b6"
  L2_2 = true
  L0_2[L1_2] = L2_2
  L1_2 = versioning
  L2_2 = "GetOrgID"
  L1_2 = L1_2[L2_2]
  L1_2 = L1_2()
  L2_2 = false
  L3_2 = nil
  if L1_2 ~= L3_2 then
    L3_2 = L0_2[L1_2]
    L4_2 = true
    if L3_2 == L4_2 then
      L2_2 = true
    end
  end
  L3_2 = L2_2
  L4_2 = L1_2
  return L3_2, L4_2
end

IsLegacyOrgMachine = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = {}
  L1_2["cmd.exe"] = true
  L1_2["powershell.exe"] = true
  L1_2["wscript.exe"] = true
  L1_2["cscript.exe"] = true
  L1_2["mshta.exe"] = true
  L1_2["wmic.exe"] = true
  L1_2["bitsadmin.exe"] = true
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = A0_2
  L4_2 = "([^\\]+)$"
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = false
  L4_2 = L1_2[L2_2]
  if L4_2 then
    L3_2 = true
  end
  L4_2 = L3_2
  L5_2 = L2_2
  return L4_2, L5_2
end

isLolbinFilename = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = {}
  L2_2 = "\\system32\\cmd.exe"
  L3_2 = "\\system32\\windowspowershell\\v1.0\\powershell.exe"
  L4_2 = "\\system32\\wscript.exe"
  L5_2 = "\\system32\\cscript.exe"
  L6_2 = "\\system32\\mshta.exe"
  L7_2 = "\\system32\\wbem\\wmic.exe"
  L8_2 = "\\system32\\bitsadmin.exe"
  L9_2 = "\\system32\\mshta.exe"
  L10_2 = "\\system32\\rundll32.exe"
  L11_2 = "\\system32\\svchost.exe"
  L12_2 = "\\syswow64\\svchost.exe"
  L13_2 = "\\system32\\services.exe"
  L14_2 = "\\syswow64\\services.exe"
  L15_2 = "\\system32\\reg.exe"
  L16_2 = "\\windows\\regedit.exe"
  L17_2 = "\\system32\\userinit.exe"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L1_2[7] = L8_2
  L1_2[8] = L9_2
  L1_2[9] = L10_2
  L1_2[10] = L11_2
  L1_2[11] = L12_2
  L1_2[12] = L13_2
  L1_2[13] = L14_2
  L1_2[14] = L15_2
  L1_2[15] = L16_2
  L1_2[16] = L17_2
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = string
    L7_2 = L7_2.sub
    L8_2 = A0_2
    L9_2 = #L6_2
    L9_2 = -L9_2
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 == L6_2 then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = false
  return L2_2
end

isLolbinFile = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    if A0_3 ~= nil then
      L1_3 = #A0_3
      if not (L1_3 <= 3) then
        goto lbl_7
      end
    end
    do return end
    ::lbl_7::
    L1_3 = string
    L1_3 = L1_3.lower
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    L2_3 = "bm_m"
    L3_3 = string
    L3_3 = L3_3.sub
    L4_3 = L1_3
    L5_3 = 1
    L6_3 = 1
    L3_3 = L3_3(L4_3, L5_3, L6_3)
    if L3_3 == "t" then
      return A0_3
    else
      L3_3 = string
      L3_3 = L3_3.sub
      L4_3 = L1_3
      L5_3 = 1
      L6_3 = #L2_3
      L3_3 = L3_3(L4_3, L5_3, L6_3)
      if L3_3 == L2_3 then
        L3_3 = string
        L3_3 = L3_3.sub
        L4_3 = A0_3
        L5_3 = #L2_3
        L5_3 = L5_3 + 1
        L6_3 = #A0_3
        return L3_3(L4_3, L5_3, L6_3)
      end
    end
    return
  end
  
  validateTechnique = L4_2
  if A0_2 ~= nil then
    L4_2 = type
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    if L4_2 == "string" then
      L4_2 = #A0_2
      if not (L4_2 <= 1) and A1_2 ~= nil then
        goto lbl_16
      end
    end
  end
  do return end
  ::lbl_16::
  if A2_2 == nil then
    A2_2 = 0
  end
  L4_2 = "CommandLineCustomHash"
  if A3_2 ~= nil then
    L4_2 = A3_2
  end
  L5_2 = getCustomStringHash
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if L5_2 == nil then
    return
  end
  L6_2 = L4_2
  L7_2 = ":"
  L8_2 = L5_2
  L6_2 = L6_2 .. L7_2 .. L8_2
  L7_2 = false
  L8_2 = type
  L9_2 = A1_2
  L8_2 = L8_2(L9_2)
  if L8_2 == "string" then
    L8_2 = validateTechnique
    L9_2 = A1_2
    L8_2 = L8_2(L9_2)
    if L8_2 ~= nil then
      L9_2 = MpCommon
      L9_2 = L9_2.AppendPersistContextNoPath
      L10_2 = L6_2
      L11_2 = L8_2
      L12_2 = A2_2
      L9_2(L10_2, L11_2, L12_2)
      L7_2 = true
    end
  else
    L8_2 = type
    L9_2 = A1_2
    L8_2 = L8_2(L9_2)
    if L8_2 == "table" then
      L8_2 = ipairs
      L9_2 = A1_2
      L8_2, L9_2, L10_2 = L8_2(L9_2)
      for L11_2, L12_2 in L8_2, L9_2, L10_2 do
        L13_2 = validateTechnique
        L14_2 = L12_2
        L13_2 = L13_2(L14_2)
        if L13_2 ~= nil then
          L14_2 = MpCommon
          L14_2 = L14_2.AppendPersistContextNoPath
          L15_2 = L6_2
          L16_2 = L13_2
          L17_2 = A2_2
          L14_2(L15_2, L16_2, L17_2)
          L7_2 = true
        end
      end
    end
  end
  return L7_2
end

TrackCommandLineAndTechniqueMain = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if A0_2 ~= nil then
    L5_2 = type
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    if L5_2 == "string" then
      L5_2 = #A0_2
      if not (L5_2 <= 1) and A1_2 ~= nil then
        goto lbl_14
      end
    end
  end
  do return end
  ::lbl_14::
  if A4_2 == nil then
    A4_2 = true
  end
  L5_2 = nil
  L6_2 = nil
  L7_2 = TrackCommandLineAndTechniqueMain
  L8_2 = A0_2
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
  L5_2 = L7_2
  if L5_2 == true then
    L7_2 = TrackCommandLineAndTechniqueMain
    L8_2 = A0_2
    L9_2 = "T0000:track_cmdline"
    L10_2 = A2_2
    L11_2 = A3_2
    L7_2(L8_2, L9_2, L10_2, L11_2)
  end
  L7_2 = resolve_mainbinary_from_commandline
  L8_2 = A0_2
  L7_2, L8_2 = L7_2(L8_2)
  if A4_2 == true and L8_2 == true then
    L9_2 = TrackCommandLineAndTechniqueMain
    L10_2 = L7_2
    L11_2 = A1_2
    L12_2 = A2_2
    L13_2 = A3_2
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
    L6_2 = L9_2
    if L6_2 == true then
      L9_2 = TrackCommandLineAndTechniqueMain
      L10_2 = L7_2
      L11_2 = "T0000:track_cmdline"
      L12_2 = A2_2
      L13_2 = A3_2
      L9_2(L10_2, L11_2, L12_2, L13_2)
    end
  end
  L9_2 = L5_2
  L10_2 = L6_2
  return L9_2, L10_2
end

TrackCommandLineAndTechnique = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if A0_2 ~= nil then
    L1_2 = #A0_2
    if not (L1_2 <= 1) then
      goto lbl_7
    end
  end
  do return end
  ::lbl_7::
  L1_2 = {}
  L1_2.cmd = "%windir%\\system32\\cmd.exe"
  L1_2.powershell = "%windir%\\system32\\windowspowershell\\v1.0\\powershell.exe"
  L1_2.wscript = "%windir%\\system32\\wscript.exe"
  L1_2.cscript = "%windir%\\system32\\cscript.exe"
  L1_2.mshta = "%windir%\\system32\\mshta.exe"
  L1_2.wmic = "%windir%\\system32\\wbem\\wmic.exe"
  L1_2.bitsadmin = "%windir%\\system32\\bitsadmin.exe"
  L1_2.rundll32 = "%windir%\\system32\\rundll32.exe"
  L1_2.svchost = "%windir%\\system32\\svchost.exe"
  L1_2.services = "%windir%\\system32\\services.exe"
  L1_2.reg = "%windir%\\system32\\reg.exe"
  L1_2.regsvr32 = "%windir%\\system32\\regsvr32.exe"
  L1_2.regedit = "%windir%\\regedit.exe"
  L1_2.schtasks = "%windir%\\system32\\schtasks.exe"
  L1_2["%comspec%"] = "%windir%\\system32\\cmd.exe"
  L2_2 = #A0_2
  if 4 < L2_2 then
    L2_2 = string
    L2_2 = L2_2.sub
    L3_2 = A0_2
    L4_2 = -4
    L2_2 = L2_2(L3_2, L4_2)
    if L2_2 == ".exe" then
      L2_2 = string
      L2_2 = L2_2.sub
      L3_2 = A0_2
      L4_2 = 1
      L5_2 = #A0_2
      L5_2 = L5_2 - 4
      L2_2 = L2_2(L3_2, L4_2, L5_2)
      A0_2 = L2_2
    end
  end
  L2_2 = string
  L2_2 = L2_2.lower
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = L1_2[A0_2]
  if L2_2 ~= nil then
    L3_2 = mp
    L3_2 = L3_2.ContextualExpandEnvironmentVariables
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L2_2 = L3_2
  end
  return L2_2
end

resolve_command_fullpath = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A0_2 ~= nil then
    L1_2 = #A0_2
    if not (L1_2 <= 4) then
      L1_2 = string
      L1_2 = L1_2.sub
      L2_2 = A0_2
      L3_2 = 1
      L4_2 = 2
      L1_2 = L1_2(L2_2, L3_2, L4_2)
      if L1_2 ~= "\\\\" then
        L1_2 = string
        L1_2 = L1_2.sub
        L2_2 = A0_2
        L3_2 = 2
        L4_2 = 3
        L1_2 = L1_2(L2_2, L3_2, L4_2)
        if L1_2 ~= ":\\" then
          L1_2 = string
          L1_2 = L1_2.find
          L2_2 = A0_2
          L3_2 = " "
          L4_2 = 1
          L5_2 = true
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          if L1_2 ~= nil then
            goto lbl_34
          end
        end
      end
    end
  end
  L1_2 = A0_2
  L2_2 = false
  do return L1_2, L2_2 end
  ::lbl_34::
  L1_2 = string
  L1_2 = L1_2.match
  L2_2 = A0_2
  L3_2 = "^(.-)%s"
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 == nil then
    L2_2 = A0_2
    L3_2 = false
    return L2_2, L3_2
  end
  L2_2 = resolve_command_fullpath
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 == nil then
    L3_2 = A0_2
    L4_2 = false
    return L3_2, L4_2
  end
  L3_2 = L2_2
  L4_2 = string
  L4_2 = L4_2.sub
  L5_2 = A0_2
  L6_2 = #L1_2
  L6_2 = L6_2 + 1
  L7_2 = #A0_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2 = L3_2 .. L4_2
  L4_2 = L3_2
  L5_2 = true
  return L4_2, L5_2
end

resolve_mainbinary_from_commandline = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 == nil then
    return
  end
  L2_2 = "CommandLineCustomHash"
  if A1_2 ~= nil then
    L2_2 = A1_2
  end
  L3_2 = getCustomStringHash
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 == nil then
    return
  end
  L4_2 = L2_2
  L5_2 = ":"
  L6_2 = L3_2
  L4_2 = L4_2 .. L5_2 .. L6_2
  L5_2 = MpCommon
  L5_2 = L5_2.GetPersistContextCountNoPath
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if 1 <= L5_2 then
    L5_2 = MpCommon
    L5_2 = L5_2.GetPersistContextNoPath
    L6_2 = L4_2
    return L5_2(L6_2)
  end
  return
end

GetTechniquesFromTrackedCommandLine = L0_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 == nil then
    return
  end
  if A2_2 == nil then
    A2_2 = true
  end
  L3_2 = GetTechniquesFromTrackedCommandLine
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 ~= nil then
    L4_2 = true
    L5_2 = L3_2
    L6_2 = A0_2
    return L4_2, L5_2, L6_2
  end
  L4_2 = resolve_mainbinary_from_commandline
  L5_2 = A0_2
  L4_2, L5_2 = L4_2(L5_2)
  if A2_2 == true and L5_2 == true then
    L6_2 = GetTechniquesFromTrackedCommandLine
    L7_2 = L4_2
    L8_2 = A1_2
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 ~= nil then
      L7_2 = true
      L8_2 = L6_2
      L9_2 = L4_2
      return L7_2, L8_2, L9_2
    end
  end
  L6_2 = false
  return L6_2
end

IsCommandLineTracked = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  
  function L4_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    if A0_3 ~= nil and A1_3 ~= nil then
      L2_3 = type
      L3_3 = A1_3
      L2_3 = L2_3(L3_3)
      if L2_3 == "table" then
        goto lbl_11
      end
    end
    do return end
    ::lbl_11::
    L2_3 = string
    L2_3 = L2_3.lower
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    L3_3 = ipairs
    L4_3 = A1_3
    L3_3, L4_3, L5_3 = L3_3(L4_3)
    for L6_3, L7_3 in L3_3, L4_3, L5_3 do
      L8_3 = string
      L8_3 = L8_3.lower
      L9_3 = L7_3
      L8_3 = L8_3(L9_3)
      L9_3 = string
      L9_3 = L9_3.find
      L10_3 = L8_3
      L11_3 = L2_3
      L12_3 = 1
      L13_3 = true
      L9_3 = L9_3(L10_3, L11_3, L12_3, L13_3)
      if L9_3 then
        L9_3 = true
        L10_3 = L7_3
        return L9_3, L10_3
      end
    end
    L3_3 = false
    return L3_3
  end
  
  FindStringInTable = L4_2
  if A0_2 == nil or A1_2 == nil then
    return
  end
  if A3_2 == nil then
    A3_2 = true
  end
  L4_2 = GetTechniquesFromTrackedCommandLine
  L5_2 = A0_2
  L6_2 = A2_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 ~= nil then
    L5_2 = FindStringInTable
    L6_2 = A1_2
    L7_2 = L4_2
    L5_2, L6_2 = L5_2(L6_2, L7_2)
    if L5_2 == true then
      L7_2 = true
      L8_2 = L6_2
      L9_2 = A0_2
      return L7_2, L8_2, L9_2
    end
  end
  L5_2 = resolve_mainbinary_from_commandline
  L6_2 = A0_2
  L5_2, L6_2 = L5_2(L6_2)
  if A3_2 == true and L6_2 == true then
    L7_2 = GetTechniquesFromTrackedCommandLine
    L8_2 = L5_2
    L9_2 = A2_2
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 ~= nil then
      L8_2 = FindStringInTable
      L9_2 = A1_2
      L10_2 = L7_2
      L8_2, L9_2 = L8_2(L9_2, L10_2)
      if L8_2 == true then
        L10_2 = true
        L11_2 = L9_2
        L12_2 = L5_2
        return L10_2, L11_2, L12_2
      end
    end
  end
  L7_2 = false
  return L7_2
end

IsCommandLineTrackedForTechnique = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 ~= nil then
    L1_2 = #A0_2
    if L1_2 ~= nil then
      L1_2 = #A0_2
      if not (L1_2 <= 1) then
        goto lbl_10
      end
    end
  end
  do return A0_2 end
  ::lbl_10::
  L1_2 = {}
  L2_2 = table
  L2_2 = L2_2.sort
  L3_2 = A0_2
  L2_2(L3_2)
  L2_2 = ipairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = L5_2 + 1
    L7_2 = A0_2[L7_2]
    if L6_2 ~= L7_2 then
      L7_2 = table
      L7_2 = L7_2.insert
      L8_2 = L1_2
      L9_2 = L6_2
      L7_2(L8_2, L9_2)
    end
  end
  return L1_2
end

table_distinct_values = L0_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  if A0_2 ~= nil then
    L3_2 = type
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "string" then
      L3_2 = #A0_2
      if not (L3_2 <= 3) then
        goto lbl_12
      end
    end
  end
  do return end
  ::lbl_12::
  L3_2 = string
  L3_2 = L3_2.lower
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  A0_2 = L3_2
  L3_2 = mp
  L3_2 = L3_2.GetExecutablesFromCommandLine
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil then
    L4_2 = type
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 == "table" then
      goto lbl_30
    end
  end
  L4_2 = {}
  L3_2 = L4_2
  ::lbl_30::
  L4_2 = string
  L4_2 = L4_2.gmatch
  L5_2 = A0_2
  L6_2 = "(.:\\.-%.[a-z]+)"
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L4_2
  L6_2 = nil
  L7_2 = nil
  for L8_2 in L5_2, L6_2, L7_2 do
    L9_2 = table
    L9_2 = L9_2.insert
    L10_2 = L3_2
    L11_2 = L8_2
    L9_2(L10_2, L11_2)
  end
  L5_2 = string
  L5_2 = L5_2.gmatch
  L6_2 = A0_2
  L7_2 = "(%%.-%.[a-z]+)"
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L5_2
  L7_2 = nil
  L8_2 = nil
  for L9_2 in L6_2, L7_2, L8_2 do
    L10_2 = pcall
    L11_2 = mp
    L11_2 = L11_2.ContextualExpandEnvironmentVariables
    L12_2 = L9_2
    L10_2, L11_2 = L10_2(L11_2, L12_2)
    if not L10_2 then
      L12_2 = MpCommon
      L12_2 = L12_2.ExpandEnvironmentVariables
      L13_2 = L9_2
      L12_2 = L12_2(L13_2)
      L11_2 = L12_2
    end
    if L11_2 ~= nil then
      L12_2 = table
      L12_2 = L12_2.insert
      L13_2 = L3_2
      L14_2 = L11_2
      L12_2(L13_2, L14_2)
    end
  end
  L6_2 = string
  L6_2 = L6_2.find
  L7_2 = A0_2
  L8_2 = "cmd.exe"
  L9_2 = 1
  L10_2 = true
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  if L6_2 then
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = A0_2
    L8_2 = " /d "
    L9_2 = 1
    L10_2 = true
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    if L6_2 then
      L7_2 = A0_2
      L6_2 = A0_2.match
      L8_2 = "/d%s+\"([^\"]+)\""
      L6_2 = L6_2(L7_2, L8_2)
      A1_2 = L6_2 or A1_2
      if not L6_2 then
        L7_2 = A0_2
        L6_2 = A0_2.match
        L8_2 = "/d%s+([^%s\"]+)"
        L6_2 = L6_2(L7_2, L8_2)
        A1_2 = L6_2
      end
      L7_2 = A1_2
      L6_2 = A1_2.gsub
      L8_2 = "[\"']"
      L9_2 = ""
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      A1_2 = L6_2
  end
  else
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = A0_2
    L8_2 = "powershell.exe"
    L9_2 = 1
    L10_2 = true
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    if L6_2 then
      L6_2 = string
      L6_2 = L6_2.find
      L7_2 = A0_2
      L8_2 = " -workingdirectory "
      L9_2 = 1
      L10_2 = true
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
      if L6_2 then
        L7_2 = A0_2
        L6_2 = A0_2.match
        L8_2 = "%-workingdirectory%s+\"([^\"]+)\""
        L6_2 = L6_2(L7_2, L8_2)
        A1_2 = L6_2 or A1_2
        if not L6_2 then
          L7_2 = A0_2
          L6_2 = A0_2.match
          L8_2 = "%-workingdirectory%s+([^%s]+)"
          L6_2 = L6_2(L7_2, L8_2)
          A1_2 = L6_2
        end
        L7_2 = A1_2
        L6_2 = A1_2.gsub
        L8_2 = "[\"']"
        L9_2 = ""
        L6_2 = L6_2(L7_2, L8_2, L9_2)
        A1_2 = L6_2
      end
    end
  end
  L6_2 = false
  L7_2 = false
  if A1_2 ~= nil then
    L8_2 = #A1_2
    if 3 < L8_2 then
      L6_2 = true
      L8_2 = string
      L8_2 = L8_2.find
      L9_2 = A1_2
      L10_2 = "%"
      L11_2 = 1
      L12_2 = true
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
      if L8_2 then
        L8_2 = MpCommon
        L8_2 = L8_2.ExpandEnvironmentVariables
        L9_2 = A1_2
        L8_2 = L8_2(L9_2)
        A1_2 = L8_2
      end
      L8_2 = string
      L8_2 = L8_2.sub
      L9_2 = A1_2
      L10_2 = -1
      L8_2 = L8_2(L9_2, L10_2)
      L7_2 = L8_2 == "\\"
    end
  end
  L8_2 = string
  L8_2 = L8_2.find
  L9_2 = A0_2
  L10_2 = "node.exe ."
  L11_2 = 1
  L12_2 = true
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
  if not L8_2 then
    L8_2 = string
    L8_2 = L8_2.find
    L9_2 = A0_2
    L10_2 = "node ."
    L11_2 = 1
    L12_2 = true
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    if not L8_2 then
      L8_2 = string
      L8_2 = L8_2.find
      L9_2 = A0_2
      L10_2 = "node"
      L11_2 = 1
      L12_2 = true
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
      if not L8_2 then
        goto lbl_218
      end
      L8_2 = string
      L8_2 = L8_2.find
      L9_2 = A0_2
      L10_2 = " -argumentlist '.'"
      L11_2 = 1
      L12_2 = true
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
      if not L8_2 then
        L8_2 = string
        L8_2 = L8_2.find
        L9_2 = A0_2
        L10_2 = " -argumentlist \".\""
        L11_2 = 1
        L12_2 = true
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
        if not L8_2 then
          goto lbl_218
        end
      end
    end
  end
  L8_2 = A0_2
  L9_2 = " index.js "
  A0_2 = L8_2 .. L9_2
  ::lbl_218::
  L8_2 = string
  L8_2 = L8_2.gmatch
  L9_2 = A0_2
  L10_2 = "['\"%s,]?([^\"'%s,]-%.%a+)[%\"'%s,]?"
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = MpCommon
  L9_2 = L9_2.ExpandEnvironmentVariables
  L10_2 = "%windir%"
  L9_2 = L9_2(L10_2)
  L10_2 = L8_2
  L11_2 = nil
  L12_2 = nil
  for L13_2 in L10_2, L11_2, L12_2 do
    L14_2 = string
    L14_2 = L14_2.find
    L15_2 = L13_2
    L16_2 = "\\"
    L17_2 = 1
    L18_2 = true
    L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
    if L14_2 == nil then
      if A2_2 ~= true then
        L14_2 = L9_2
        L15_2 = "\\system32\\"
        L16_2 = L13_2
        L14_2 = L14_2 .. L15_2 .. L16_2
        L15_2 = table
        L15_2 = L15_2.insert
        L16_2 = L3_2
        L17_2 = L14_2
        L15_2(L16_2, L17_2)
        L15_2 = L9_2
        L16_2 = "\\"
        L17_2 = L13_2
        L15_2 = L15_2 .. L16_2 .. L17_2
        L16_2 = table
        L16_2 = L16_2.insert
        L17_2 = L3_2
        L18_2 = L15_2
        L16_2(L17_2, L18_2)
        L16_2 = L9_2
        L17_2 = "\\system32\\wbem\\"
        L18_2 = L13_2
        L16_2 = L16_2 .. L17_2 .. L18_2
        L17_2 = table
        L17_2 = L17_2.insert
        L18_2 = L3_2
        L19_2 = L16_2
        L17_2(L18_2, L19_2)
        L17_2 = L9_2
        L18_2 = "\\system32\\windowspowershell\\v1.0\\"
        L19_2 = L13_2
        L17_2 = L17_2 .. L18_2 .. L19_2
        L18_2 = table
        L18_2 = L18_2.insert
        L19_2 = L3_2
        L20_2 = L17_2
        L18_2(L19_2, L20_2)
        L18_2 = L9_2
        L19_2 = "\\syswow64\\"
        L20_2 = L13_2
        L18_2 = L18_2 .. L19_2 .. L20_2
        L19_2 = table
        L19_2 = L19_2.insert
        L20_2 = L3_2
        L21_2 = L18_2
        L19_2(L20_2, L21_2)
      end
      if L6_2 == true then
        if L7_2 == true then
          L14_2 = A1_2
          L15_2 = L13_2
          L14_2 = L14_2 .. L15_2
          L15_2 = table
          L15_2 = L15_2.insert
          L16_2 = L3_2
          L17_2 = L14_2
          L15_2(L16_2, L17_2)
        else
          L14_2 = A1_2
          L15_2 = "\\"
          L16_2 = L13_2
          L14_2 = L14_2 .. L15_2 .. L16_2
          L15_2 = table
          L15_2 = L15_2.insert
          L16_2 = L3_2
          L17_2 = L14_2
          L15_2(L16_2, L17_2)
        end
      end
    end
  end
  return L3_2
end

get_filepaths_from_string = L0_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  if A0_2 == nil or A1_2 == nil then
    return
  end
  L3_2 = A0_2
  L5_2 = A0_2
  L4_2 = A0_2.sub
  L6_2 = 1
  L7_2 = 4
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if L4_2 ~= "pid:" then
    L4_2 = GetProcessPpidByScenario
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    A0_2 = L4_2
  end
  if A0_2 == nil then
    L4_2 = nil
    return L4_2
  end
  if A2_2 == nil then
    A2_2 = 5
  end
  L4_2 = A0_2
  L5_2 = 1
  L6_2 = A2_2
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = mp
    L9_2 = L9_2.GetParentProcInfo
    L10_2 = L4_2
    L9_2 = L9_2(L10_2)
    if L8_2 == 1 then
      L10_2 = string
      L10_2 = L10_2.lower
      L11_2 = L3_2
      L10_2 = L10_2(L11_2)
      if L10_2 == "cmdhstr" then
        L10_2 = mp
        L10_2 = L10_2.GetParentProcInfo
        L10_2 = L10_2()
        L9_2 = L10_2
      end
    end
    if L9_2 == nil then
      break
    end
    L4_2 = L9_2.ppid
    if L4_2 == nil then
      break
    end
    L10_2 = L9_2.image_path
    if L10_2 ~= nil then
      L10_2 = string
      L10_2 = L10_2.lower
      L11_2 = L9_2.image_path
      L10_2 = L10_2(L11_2)
      L11_2 = type
      L12_2 = A1_2
      L11_2 = L11_2(L12_2)
      if L11_2 == "string" then
        L11_2 = string
        L11_2 = L11_2.sub
        L12_2 = L10_2
        L13_2 = #A1_2
        L13_2 = -L13_2
        L11_2 = L11_2(L12_2, L13_2)
        if L11_2 == A1_2 then
          L11_2 = true
          L12_2 = L4_2
          L13_2 = L10_2
          L14_2 = A1_2
          L15_2 = L8_2
          return L11_2, L12_2, L13_2, L14_2, L15_2
        end
      else
        L11_2 = type
        L12_2 = A1_2
        L11_2 = L11_2(L12_2)
        if L11_2 == "table" then
          L11_2 = ipairs
          L12_2 = A1_2
          L11_2, L12_2, L13_2 = L11_2(L12_2)
          for L14_2, L15_2 in L11_2, L12_2, L13_2 do
            L16_2 = string
            L16_2 = L16_2.sub
            L17_2 = L10_2
            L18_2 = #L15_2
            L18_2 = -L18_2
            L16_2 = L16_2(L17_2, L18_2)
            if L16_2 == L15_2 then
              L16_2 = true
              L17_2 = L4_2
              L18_2 = L10_2
              L19_2 = L15_2
              L20_2 = L8_2
              return L16_2, L17_2, L18_2, L19_2, L20_2
            end
          end
        end
      end
    end
  end
  L5_2 = false
  return L5_2
end

IsProcNameInParentProcessTree = L0_1

function L0_1(A0_2)
  local L1_2, L2_2
  if A0_2 == nil or A0_2 == "" then
    L1_2 = true
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.lower
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = {}
  L1_2["encrypted-tbn0.gstatic.com"] = true
  L1_2["img.freepik.com"] = true
  L1_2["api.engage.cloud.microsoft"] = true
  L1_2["image.shutterstock.com"] = true
  L1_2["cdn-icons-png.flaticon.com"] = true
  L1_2["loop.cloud.microsoft"] = true
  L1_2[";lanmanredirector"] = true
  L1_2["login.microsoftonline.com"] = true
  L1_2["login.live.com"] = true
  L1_2["about:internet"] = true
  L1_2["google.com"] = true
  L2_2 = L1_2[A0_2]
  return L2_2
end

IsExcludedHostCheck = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if not A1_2 then
    A1_2 = 3600
  end
  L2_2 = ExtractPartsFromUri
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2.host
  if L3_2 then
    L3_2 = L2_2.host
    if L3_2 ~= "" then
      L3_2 = GetRollingQueueKeyValue
      L4_2 = "SuspAttackServer"
      L5_2 = L2_2.host
      L3_2 = L3_2(L4_2, L5_2)
      if L3_2 == nil then
        L4_2 = tostring
        L5_2 = L2_2.path
        L4_2 = L4_2(L5_2)
        L3_2 = L4_2
      else
        L4_2 = L3_2
        L5_2 = "|"
        L6_2 = tostring
        L7_2 = L2_2.path
        L6_2 = L6_2(L7_2)
        L3_2 = L4_2 .. L5_2 .. L6_2
      end
      L4_2 = AppendToRollingQueue
      L5_2 = "SuspAttackServer"
      L6_2 = L2_2.host
      L7_2 = L3_2
      L8_2 = 3600
      L4_2(L5_2, L6_2, L7_2, L8_2)
    end
  end
end

TrackAttackerServer = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if not A0_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = ExtractPartsFromUri
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L6_2 = L5_2.host
  if L6_2 then
    L6_2 = L5_2.host
    if L6_2 ~= "" then
      A0_2 = L5_2.host
    end
  end
  L6_2 = IsKeyInRollingQueue
  L7_2 = "CleanHostCache"
  L8_2 = A0_2
  L6_2 = L6_2(L7_2, L8_2)
  if L6_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = IsExcludedHostCheck
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if L6_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = IsKeyInRollingQueue
  L7_2 = "SuspAttackServer"
  L8_2 = L5_2.host
  L9_2 = false
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  if L6_2 then
    return L6_2
  end
  L7_2 = {}
  L7_2.SIG_CONTEXT = "ATTACKSERVER"
  L7_2.TAG = "NOLOOKUP"
  if A1_2 ~= nil and A1_2 ~= "" then
    L7_2.CONTENT_SOURCE = A1_2
  end
  if A2_2 ~= nil and A2_2 ~= "" then
    L7_2.PROCESS_CONTEXT = A2_2
  end
  if A3_2 ~= nil and A3_2 ~= "" then
    L7_2.PROCESS_CMDLINE = A3_2
  end
  if A4_2 ~= nil and A4_2 ~= "" then
    L7_2.SCENARIO = A4_2
  end
  L8_2 = SafeGetUrlReputation
  L9_2 = {}
  L10_2 = A0_2
  L9_2[1] = L10_2
  L10_2 = L7_2
  L11_2 = false
  L12_2 = 2000
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
  L9_2 = L8_2.urls
  L9_2 = L9_2[A0_2]
  if L9_2 then
    L9_2 = L8_2.urls
    L9_2 = L9_2[A0_2]
    L9_2 = L9_2.determination
    if L9_2 == 2 then
      L9_2 = TrackAttackerServer
      L10_2 = A0_2
      L9_2(L10_2)
      L9_2 = true
      return L9_2
  end
  else
    L9_2 = AppendToRollingQueue
    L10_2 = "CleanHostCache"
    L11_2 = A0_2
    L12_2 = true
    L13_2 = 36000
    L9_2(L10_2, L11_2, L12_2, L13_2)
  end
  L9_2 = false
  return L9_2
end

IsHostAttackServerCloudChk = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = false
  if not A1_2 then
    A1_2 = false
  end
  L3_2 = ExtractPartsFromUri
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2.host
  if L4_2 then
    L4_2 = L3_2.host
    if L4_2 ~= "" then
      if not A1_2 then
        A1_2 = false
      end
      L4_2 = IsExcludedHostCheck
      L5_2 = L3_2.host
      L4_2 = L4_2(L5_2)
      if L4_2 then
        L4_2 = false
        return L4_2
      end
      L4_2 = IsKeyInRollingQueue
      L5_2 = "SuspAttackServer"
      L6_2 = L3_2.host
      L7_2 = A1_2
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      L2_2 = L4_2
      return L2_2
    end
  end
  L4_2 = false
  return L4_2
end

IsHostAttackServer = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 == nil then
    L1_2 = false
    return L1_2
  end
  L1_2 = 0
  L2_2 = 45
  L3_2 = 100
  L4_2 = IsTechniqueObservedForPid
  L5_2 = A0_2
  L6_2 = "T1057"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = IsTacticObservedForPid
    L5_2 = A0_2
    L6_2 = "Discovery_Process"
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      goto lbl_21
    end
  end
  L1_2 = L1_2 + 15
  ::lbl_21::
  L4_2 = IsTechniqueObservedForPid
  L5_2 = A0_2
  L6_2 = "T1552"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = IsTacticObservedForPid
    L5_2 = A0_2
    L6_2 = "CredentialAccess"
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      goto lbl_34
    end
  end
  L1_2 = L1_2 + 16
  ::lbl_34::
  L4_2 = IsTechniqueObservedForPid
  L5_2 = A0_2
  L6_2 = "T1083"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = IsTacticObservedForPid
    L5_2 = A0_2
    L6_2 = "Discovery_FileAndDirectoryDiscovery"
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      goto lbl_47
    end
  end
  L1_2 = L1_2 + 15
  ::lbl_47::
  L4_2 = IsTechniqueObservedForPid
  L5_2 = A0_2
  L6_2 = "T1074"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = IsTacticObservedForPid
    L5_2 = A0_2
    L6_2 = "Collection_DataStaged"
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      goto lbl_60
    end
  end
  L1_2 = L1_2 + 15
  ::lbl_60::
  L4_2 = IsTechniqueObservedForPid
  L5_2 = A0_2
  L6_2 = "T1049"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = IsTacticObservedForPid
    L5_2 = A0_2
    L6_2 = "Discovery_NetworkConnectionsDiscovery"
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      goto lbl_73
    end
  end
  L1_2 = L1_2 + 15
  ::lbl_73::
  L4_2 = IsTechniqueObservedForPid
  L5_2 = A0_2
  L6_2 = "T1033"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = IsTacticObservedForPid
    L5_2 = A0_2
    L6_2 = "Discovery_SystemOwnerUserDiscovery"
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      goto lbl_86
    end
  end
  L1_2 = L1_2 + 8
  ::lbl_86::
  L4_2 = IsTechniqueObservedForPid
  L5_2 = A0_2
  L6_2 = "T1518"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = IsTacticObservedForPid
    L5_2 = A0_2
    L6_2 = "Discovery_SoftwareDiscovery"
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      goto lbl_99
    end
  end
  L1_2 = L1_2 + 8
  ::lbl_99::
  L4_2 = IsTechniqueObservedForPid
  L5_2 = A0_2
  L6_2 = "T1082"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = IsTacticObservedForPid
    L5_2 = A0_2
    L6_2 = "Discovery_SystemInfoDiscovery"
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      goto lbl_112
    end
  end
  L1_2 = L1_2 + 8
  ::lbl_112::
  if L2_2 <= L1_2 and L3_2 >= L1_2 then
    L4_2 = true
    return L4_2
  end
  L4_2 = false
  return L4_2
end

IsDiscoveryCollectionThresholdMetLinux = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L5_2 = 0
  L6_2 = true
  L7_2 = nil
  L8_2 = IsDetectionThresholdMetLinux
  L9_2 = A0_2
  L8_2 = L8_2(L9_2)
  if L8_2 then
    L8_2 = true
    return L8_2
  end
  if L6_2 then
    L8_2 = GetTacticsTableForPid
    L9_2 = A0_2
    L8_2 = L8_2(L9_2)
    L9_2 = GetTechniquesTableForPid
    L10_2 = A0_2
    L9_2 = L9_2(L10_2)
    if L8_2 == nil or L9_2 == nil then
      L10_2 = false
      return L10_2
    end
    L10_2 = pairs
    L11_2 = L8_2
    L10_2, L11_2, L12_2 = L10_2(L11_2)
    for L13_2, L14_2 in L10_2, L11_2, L12_2 do
      if L13_2 ~= nil then
        if L7_2 == nil then
          L16_2 = L13_2
          L15_2 = L13_2.lower
          L15_2 = L15_2(L16_2)
          L7_2 = L15_2
        else
          L15_2 = L7_2
          L16_2 = " | "
          L18_2 = L13_2
          L17_2 = L13_2.lower
          L17_2 = L17_2(L18_2)
          L7_2 = L15_2 .. L16_2 .. L17_2
        end
      end
      if L14_2 ~= nil then
        L5_2 = L5_2 + L14_2
      end
    end
    if L7_2 ~= nil then
      L11_2 = L7_2
      L10_2 = L7_2.find
      L12_2 = "collection"
      L13_2 = 1
      L14_2 = true
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
      if L10_2 then
        L11_2 = L7_2
        L10_2 = L7_2.find
        L12_2 = "discovery"
        L13_2 = 1
        L14_2 = true
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
        if L10_2 then
          L11_2 = L7_2
          L10_2 = L7_2.find
          L12_2 = "exfiltration"
          L13_2 = 1
          L14_2 = true
          L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
          if L10_2 then
            L10_2 = true
            return L10_2
          end
        end
      end
      L11_2 = L7_2
      L10_2 = L7_2.find
      L12_2 = "initialaccess"
      L13_2 = 1
      L14_2 = true
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
      if not L10_2 then
        L11_2 = L7_2
        L10_2 = L7_2.find
        L12_2 = "collection"
        L13_2 = 1
        L14_2 = true
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
        if not L10_2 then
          L11_2 = L7_2
          L10_2 = L7_2.find
          L12_2 = "discovery"
          L13_2 = 1
          L14_2 = true
          L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
          if not L10_2 then
            L11_2 = L7_2
            L10_2 = L7_2.find
            L12_2 = "execution"
            L13_2 = 1
            L14_2 = true
            L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
            if not L10_2 then
              L11_2 = L7_2
              L10_2 = L7_2.find
              L12_2 = "credentialaccess"
              L13_2 = 1
              L14_2 = true
              L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
              if not L10_2 then
                L11_2 = L7_2
                L10_2 = L7_2.find
                L12_2 = "defenseevasion"
                L13_2 = 1
                L14_2 = true
                L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
                if not L10_2 then
                  L11_2 = L7_2
                  L10_2 = L7_2.find
                  L12_2 = "lateralmovement"
                  L13_2 = 1
                  L14_2 = true
                  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
                  if not L10_2 then
                    L11_2 = L7_2
                    L10_2 = L7_2.find
                    L12_2 = "privilegeescalation"
                    L13_2 = 1
                    L14_2 = true
                    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
                    if not L10_2 then
                      goto lbl_151
                    end
                  end
                end
              end
            end
          end
        end
      end
      L11_2 = L7_2
      L10_2 = L7_2.find
      L12_2 = "persistence"
      L13_2 = 1
      L14_2 = true
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
      if L10_2 then
        L11_2 = L7_2
        L10_2 = L7_2.find
        L12_2 = "exfiltration"
        L13_2 = 1
        L14_2 = true
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
        if not L10_2 then
          L11_2 = L7_2
          L10_2 = L7_2.find
          L12_2 = "commandandcontrol"
          L13_2 = 1
          L14_2 = true
          L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
          if not L10_2 then
            goto lbl_151
          end
        end
        L10_2 = true
        return L10_2
      end
      ::lbl_151::
      L11_2 = L7_2
      L10_2 = L7_2.find
      L12_2 = "collection"
      L13_2 = 1
      L14_2 = true
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
      if not L10_2 then
        L11_2 = L7_2
        L10_2 = L7_2.find
        L12_2 = "discovery"
        L13_2 = 1
        L14_2 = true
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
        if not L10_2 then
          L11_2 = L7_2
          L10_2 = L7_2.find
          L12_2 = "execution"
          L13_2 = 1
          L14_2 = true
          L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
          if not L10_2 then
            goto lbl_216
          end
        end
      end
      L11_2 = L7_2
      L10_2 = L7_2.find
      L12_2 = "credentialaccess"
      L13_2 = 1
      L14_2 = true
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
      if not L10_2 then
        L11_2 = L7_2
        L10_2 = L7_2.find
        L12_2 = "defenseevasion"
        L13_2 = 1
        L14_2 = true
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
        if not L10_2 then
          L11_2 = L7_2
          L10_2 = L7_2.find
          L12_2 = "lateralmovement"
          L13_2 = 1
          L14_2 = true
          L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
          if not L10_2 then
            goto lbl_216
          end
        end
      end
      L11_2 = L7_2
      L10_2 = L7_2.find
      L12_2 = "persistence"
      L13_2 = 1
      L14_2 = true
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
      if not L10_2 then
        L11_2 = L7_2
        L10_2 = L7_2.find
        L12_2 = "exfiltration"
        L13_2 = 1
        L14_2 = true
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
        if not L10_2 then
          L11_2 = L7_2
          L10_2 = L7_2.find
          L12_2 = "commandandcontrol"
          L13_2 = 1
          L14_2 = true
          L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
          if not L10_2 then
            goto lbl_216
          end
        end
      end
      L10_2 = true
      do return L10_2 end
      ::lbl_216::
      L11_2 = L7_2
      L10_2 = L7_2.find
      L12_2 = "initialaccess"
      L13_2 = 1
      L14_2 = true
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
      if not L10_2 then
        L11_2 = L7_2
        L10_2 = L7_2.find
        L12_2 = "collection"
        L13_2 = 1
        L14_2 = true
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
        if not L10_2 then
          L11_2 = L7_2
          L10_2 = L7_2.find
          L12_2 = "discovery"
          L13_2 = 1
          L14_2 = true
          L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
          if not L10_2 then
            L11_2 = L7_2
            L10_2 = L7_2.find
            L12_2 = "execution"
            L13_2 = 1
            L14_2 = true
            L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
            if not L10_2 then
              L11_2 = L7_2
              L10_2 = L7_2.find
              L12_2 = "credentialaccess"
              L13_2 = 1
              L14_2 = true
              L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
              if not L10_2 then
                L11_2 = L7_2
                L10_2 = L7_2.find
                L12_2 = "defenseevasion"
                L13_2 = 1
                L14_2 = true
                L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
                if not L10_2 then
                  L11_2 = L7_2
                  L10_2 = L7_2.find
                  L12_2 = "lateralmovement"
                  L13_2 = 1
                  L14_2 = true
                  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
                  if not L10_2 then
                    L11_2 = L7_2
                    L10_2 = L7_2.find
                    L12_2 = "privilegeescalation"
                    L13_2 = 1
                    L14_2 = true
                    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
                    if not L10_2 then
                      goto lbl_288
                    end
                  end
                end
              end
            end
          end
        end
      end
      L11_2 = L7_2
      L10_2 = L7_2.find
      L12_2 = "exfiltration"
      L13_2 = 1
      L14_2 = true
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
      if L10_2 then
        L11_2 = L7_2
        L10_2 = L7_2.find
        L12_2 = "commandandcontrol"
        L13_2 = 1
        L14_2 = true
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
        if L10_2 then
          L10_2 = true
          return L10_2
        end
      end
    end
    ::lbl_288::
    L10_2 = 0
    L11_2 = 4
    L12_2 = 17
    L14_2 = L7_2
    L13_2 = L7_2.find
    L15_2 = "initialaccess"
    L16_2 = 1
    L17_2 = true
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    if L13_2 then
      L10_2 = L10_2 + 1
    end
    L14_2 = L7_2
    L13_2 = L7_2.find
    L15_2 = "execution"
    L16_2 = 1
    L17_2 = true
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    if L13_2 then
      L10_2 = L10_2 + 1
    end
    L14_2 = L7_2
    L13_2 = L7_2.find
    L15_2 = "persistence"
    L16_2 = 1
    L17_2 = true
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    if L13_2 then
      L10_2 = L10_2 + 2
    end
    L14_2 = L7_2
    L13_2 = L7_2.find
    L15_2 = "privilegeescalation"
    L16_2 = 1
    L17_2 = true
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    if L13_2 then
      L10_2 = L10_2 + 1
    end
    L14_2 = L7_2
    L13_2 = L7_2.find
    L15_2 = "defenseevasion"
    L16_2 = 1
    L17_2 = true
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    if L13_2 then
      L10_2 = L10_2 + 1
    end
    L14_2 = L7_2
    L13_2 = L7_2.find
    L15_2 = "credentialaccess"
    L16_2 = 1
    L17_2 = true
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    if L13_2 then
      L10_2 = L10_2 + 1
    end
    L14_2 = L7_2
    L13_2 = L7_2.find
    L15_2 = "discovery"
    L16_2 = 1
    L17_2 = true
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    if L13_2 then
      L10_2 = L10_2 + 1
    end
    L14_2 = L7_2
    L13_2 = L7_2.find
    L15_2 = "lateralmovement"
    L16_2 = 1
    L17_2 = true
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    if L13_2 then
      L10_2 = L10_2 + 2
    end
    L14_2 = L7_2
    L13_2 = L7_2.find
    L15_2 = "collection"
    L16_2 = 1
    L17_2 = true
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    if L13_2 then
      L10_2 = L10_2 + 1
    end
    L14_2 = L7_2
    L13_2 = L7_2.find
    L15_2 = "commandandcontrol"
    L16_2 = 1
    L17_2 = true
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    if L13_2 then
      L10_2 = L10_2 + 2
    end
    L14_2 = L7_2
    L13_2 = L7_2.find
    L15_2 = "exfiltration"
    L16_2 = 1
    L17_2 = true
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    if L13_2 then
      L10_2 = L10_2 + 2
    end
    L14_2 = L7_2
    L13_2 = L7_2.find
    L15_2 = "impact"
    L16_2 = 1
    L17_2 = true
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    if L13_2 then
      L10_2 = L10_2 + 2
    end
    if L11_2 <= L10_2 and L12_2 >= L10_2 then
      L13_2 = true
      return L13_2
    end
  end
  L8_2 = false
  return L8_2
end

IsDetectionThresholdMetLinuxWrapper = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = TT_SendBMSigTrigger
  L2_2 = A0_2
  L3_2 = "send_ttdata"
  L4_2 = "send_ttdata"
  L5_2 = 30
  L1_2(L2_2, L3_2, L4_2, L5_2)
end

TT_SendTechniqueIntents = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2
  L1_2 = A0_2.find
  L3_2 = "veeam.backup"
  L4_2 = 1
  L5_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if not L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.find
    L3_2 = "backupexec"
    L4_2 = 1
    L5_2 = true
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    if not L1_2 then
      L2_2 = A0_2
      L1_2 = A0_2.find
      L3_2 = "netbackup"
      L4_2 = 1
      L5_2 = true
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      if not L1_2 then
        goto lbl_24
      end
    end
  end
  L1_2 = true
  do return L1_2 end
  ::lbl_24::
  L2_2 = A0_2
  L1_2 = A0_2.find
  L3_2 = "msexchange"
  L4_2 = 1
  L5_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if not L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.find
    L3_2 = "microsoft.exchange"
    L4_2 = 1
    L5_2 = true
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    if not L1_2 then
      L2_2 = A0_2
      L1_2 = A0_2.find
      L3_2 = "acronis"
      L4_2 = 1
      L5_2 = true
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      if not L1_2 then
        goto lbl_47
      end
    end
  end
  L1_2 = true
  do return L1_2 end
  ::lbl_47::
  L2_2 = A0_2
  L1_2 = A0_2.find
  L3_2 = "veeamenterprise"
  L4_2 = 1
  L5_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if not L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.find
    L3_2 = "oracle"
    L4_2 = 1
    L5_2 = true
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    if not L1_2 then
      L2_2 = A0_2
      L1_2 = A0_2.find
      L3_2 = "sqlagent"
      L4_2 = 1
      L5_2 = true
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      if not L1_2 then
        goto lbl_70
      end
    end
  end
  L1_2 = true
  do return L1_2 end
  ::lbl_70::
  L1_2 = {}
  L1_2.acronisagent = true
  L1_2.acrsch2svc = true
  L1_2.avpsus = true
  L1_2["bmr boot service"] = true
  L1_2["bmr mtftp service"] = true
  L1_2.caarcupdatesvc = true
  L1_2.casad2dwebsvc = true
  L1_2.ccevtmgr = true
  L1_2.ccsetmgr = true
  L1_2.defwatch = true
  L1_2.dns = true
  L1_2.dnssvc = true
  L1_2.eventlog = true
  L1_2.gxblr = true
  L1_2.gxcimgr = true
  L1_2.gxcvd = true
  L1_2.gxfwd = true
  L1_2.gxvss = true
  L1_2.intuit = true
  L1_2["intuit.quickbooks.fcs"] = true
  L1_2.mcafeedlpagentservice = true
  L1_2.memtas = true
  L1_2.mepocs = true
  L1_2.mfewc = true
  L1_2.mpssvc = true
  L1_2["msdtc.exe"] = true
  L1_2.msdtc = true
  L1_2["msexchange transport logsearch"] = true
  L1_2.msexchangeantispamupdate = true
  L1_2.msexchangecompliance = true
  L1_2.msexchangedagmgmt = true
  L1_2.msexchangedelivery = true
  L1_2.msexchangediagnostics = true
  L1_2.msexchangeedgesync = true
  L1_2.msexchangefastsearch = true
  L1_2.msexchangefrontendtransport = true
  L1_2.msexchangehm = true
  L1_2.msexchangehmrecovery = true
  L1_2.msexchangeimap4 = true
  L1_2.msexchangeimap4be = true
  L1_2.msexchangeis = true
  L1_2.msexchangemailboxassistants = true
  L1_2.msexchangemailboxreplication = true
  L1_2.msexchangenotificationsbroker = true
  L1_2.msexchangepop3 = true
  L1_2.msexchangepop3be = true
  L1_2.msexchangerepl = true
  L1_2.msexchangerpc = true
  L1_2.msexchangeservicehost = true
  L1_2.msexchangesubmission = true
  L1_2.msexchangethrottling = true
  L1_2.msexchangetransport = true
  L1_2.msexchangeum = true
  L1_2.msexchangeumcr = true
  L1_2.msmpeng = true
  L1_2.mssense = true
  L1_2.mspub = true
  L1_2.mssqlserver = true
  L1_2.mssqlsvc = true
  L1_2.mysql = true
  L1_2.mysql80 = true
  L1_2.pdvfsservice = true
  L1_2.perfhost = true
  L1_2.pop3svc = true
  L1_2.profsvc = true
  L1_2.qbcfmonitorservice = true
  L1_2.qbfcservice = true
  L1_2.qbidpservice = true
  L1_2.rtvscan = true
  L1_2.samss = true
  L1_2["sacsvr.exe"] = true
  L1_2.savroam = true
  L1_2["savservice.exe"] = true
  L1_2.sdrsvc = true
  L1_2.sense = true
  L1_2.sophos = true
  L1_2.sql = true
  L1_2["sqlagent.exe"] = true
  L1_2["sqlbrowser.exe"] = true
  L1_2.sqlbrowser = true
  L1_2["sqlceip.exe"] = true
  L1_2.sqlserveragent = true
  L1_2["sqlservr.exe"] = true
  L1_2.sqltelemetry = true
  L1_2["sqlwriter.exe"] = true
  L1_2.sqlwriter = true
  L1_2.stc_raw_agent = true
  L1_2.usermanager = true
  L1_2.vboxdrv = true
  L1_2.vds = true
  L1_2["veeam.guest.interaction.proxy.exe"] = true
  L1_2.veeam = true
  L1_2.veeamcatalogsvc = true
  L1_2.veeamcloudsvc = true
  L1_2.veeamdeploymentservice = true
  L1_2["veeamdeploymentsvc.exe"] = true
  L1_2.veeamdeploysvc = true
  L1_2["veeamfilesysvsssvc.exe"] = true
  L1_2["veeamnfssvc.exe"] = true
  L1_2.veeamnfssvc = true
  L1_2["veeamtransportsvc.exe"] = true
  L1_2.veeamtransportsvc = true
  L1_2.vmcompute = true
  L1_2.vmms = true
  L1_2["vmwp.exe"] = true
  L1_2.vsnapvss = true
  L1_2.vss = true
  L1_2.vsssvc = true
  L1_2.webthreatdefsvc = true
  L1_2.wecsvc = true
  L1_2.wer = true
  L1_2.wersvc = true
  L1_2.windefend = true
  L1_2.w3svc = true
  L1_2["w3wp.exe"] = true
  L1_2.yoobackup = true
  L1_2.yooit = true
  L2_2 = L1_2[A0_2]
  if L2_2 then
    L2_2 = true
    return L2_2
  end
  L2_2 = false
  return L2_2
end

TT_IsProdCriticalService = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if not A0_2 then
    A0_2 = false
  end
  L1_2 = GetRollingQueue
  L2_2 = "has_networklogonsuccess"
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  if A0_2 then
    L2_2 = safeJsonSerialize
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 ~= nil then
      L3_2 = MpCommon
      L3_2 = L3_2.Base64Encode
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
      L3_2 = bm
      L3_2 = L3_2.add_related_string
      L4_2 = "NetworkLogonSuccess"
      L5_2 = L2_2
      L6_2 = bm
      L6_2 = L6_2.RelatedStringBMReport
      L3_2(L4_2, L5_2, L6_2)
    end
  else
    L2_2 = safeJsonSerialize
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 ~= nil then
      L3_2 = MpCommon
      L3_2 = L3_2.Base64Encode
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
      L3_2 = set_research_data
      L4_2 = "NetworkLogonSuccess"
      L5_2 = L2_2
      L6_2 = false
      L3_2(L4_2, L5_2, L6_2)
    end
  end
  L2_2 = true
  return L2_2
end

Has_NetworkLogonSuccess = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 ~= nil then
    L2_2 = #A0_2
    if not (L2_2 <= 5) then
      goto lbl_7
    end
  end
  do return end
  ::lbl_7::
  L2_2 = string
  L2_2 = L2_2.lower
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = {}
  L2_2["addinutil.exe"] = "binaries"
  L2_2["appinstaller.exe"] = "binaries"
  L2_2["aspnet_compiler.exe"] = "binaries"
  L2_2["at.exe"] = "binaries"
  L2_2["atbroker.exe"] = "binaries"
  L2_2["bash.exe"] = "binaries"
  L2_2["bitsadmin.exe"] = "binaries"
  L2_2["certoc.exe"] = "binaries"
  L2_2["certreq.exe"] = "binaries"
  L2_2["certutil.exe"] = "binaries"
  L2_2["cmd.exe"] = "binaries"
  L2_2["cmdkey.exe"] = "binaries"
  L2_2["cmdl32.exe"] = "binaries"
  L2_2["cmstp.exe"] = "binaries"
  L2_2["colorcpl.exe"] = "binaries"
  L2_2["computerdefaults.exe"] = "binaries"
  L2_2["configsecuritypolicy.exe"] = "binaries"
  L2_2["conhost.exe"] = "binaries"
  L2_2["control.exe"] = "binaries"
  L2_2["csc.exe"] = "binaries"
  L2_2["cscript.exe"] = "binaries"
  L2_2["customshellhost.exe"] = "binaries"
  L2_2["datasvcutil.exe"] = "binaries"
  L2_2["desktopimgdownldr.exe"] = "binaries"
  L2_2["devicecredentialdeployment.exe"] = "binaries"
  L2_2["dfsvc.exe"] = "binaries"
  L2_2["diantz.exe"] = "binaries"
  L2_2["diskshadow.exe"] = "binaries"
  L2_2["dnscmd.exe"] = "binaries"
  L2_2["esentutl.exe"] = "binaries"
  L2_2["eventvwr.exe"] = "binaries"
  L2_2["expand.exe"] = "binaries"
  L2_2["explorer.exe"] = "binaries"
  L2_2["extexport.exe"] = "binaries"
  L2_2["extrac32.exe"] = "binaries"
  L2_2["findstr.exe"] = "binaries"
  L2_2["finger.exe"] = "binaries"
  L2_2["fltmc.exe"] = "binaries"
  L2_2["forfiles.exe"] = "binaries"
  L2_2["fsutil.exe"] = "binaries"
  L2_2["ftp.exe"] = "binaries"
  L2_2["gpscript.exe"] = "binaries"
  L2_2["hh.exe"] = "binaries"
  L2_2["imewdbld.exe"] = "binaries"
  L2_2["ie4uinit.exe"] = "binaries"
  L2_2["iediagcmd.exe"] = "binaries"
  L2_2["ieexec.exe"] = "binaries"
  L2_2["ilasm.exe"] = "binaries"
  L2_2["infdefaultinstall.exe"] = "binaries"
  L2_2["installutil.exe"] = "binaries"
  L2_2["jsc.exe"] = "binaries"
  L2_2["ldifde.exe"] = "binaries"
  L2_2["makecab.exe"] = "binaries"
  L2_2["mavinject.exe"] = "binaries"
  L2_2["microsoft.workflow.compiler.exe"] = "binaries"
  L2_2["mmc.exe"] = "binaries"
  L2_2["mpcmdrun.exe"] = "binaries"
  L2_2["msbuild.exe"] = "binaries"
  L2_2["msconfig.exe"] = "binaries"
  L2_2["msdt.exe"] = "binaries"
  L2_2["msedge.exe"] = "binaries"
  L2_2["mshta.exe"] = "binaries"
  L2_2["msiexec.exe"] = "binaries"
  L2_2["netsh.exe"] = "binaries"
  L2_2["ngen.exe"] = "binaries"
  L2_2["odbcconf.exe"] = "binaries"
  L2_2["offlinescannershell.exe"] = "binaries"
  L2_2["onedrivestandaloneupdater.exe"] = "binaries"
  L2_2["pcalua.exe"] = "binaries"
  L2_2["pcwrun.exe"] = "binaries"
  L2_2["pktmon.exe"] = "binaries"
  L2_2["pnputil.exe"] = "binaries"
  L2_2["presentationhost.exe"] = "binaries"
  L2_2["print.exe"] = "binaries"
  L2_2["printbrm.exe"] = "binaries"
  L2_2["provlaunch.exe"] = "binaries"
  L2_2["psr.exe"] = "binaries"
  L2_2["rasautou.exe"] = "binaries"
  L2_2["rdrleakdiag.exe"] = "binaries"
  L2_2["reg.exe"] = "binaries"
  L2_2["regasm.exe"] = "binaries"
  L2_2["regedit.exe"] = "binaries"
  L2_2["regini.exe"] = "binaries"
  L2_2["register-cimprovider.exe"] = "binaries"
  L2_2["regsvcs.exe"] = "binaries"
  L2_2["regsvr32.exe"] = "binaries"
  L2_2["replace.exe"] = "binaries"
  L2_2["rpcping.exe"] = "binaries"
  L2_2["rundll32.exe"] = "binaries"
  L2_2["runexehelper.exe"] = "binaries"
  L2_2["runonce.exe"] = "binaries"
  L2_2["runscripthelper.exe"] = "binaries"
  L2_2["sc.exe"] = "binaries"
  L2_2["schtasks.exe"] = "binaries"
  L2_2["scriptrunner.exe"] = "binaries"
  L2_2["setres.exe"] = "binaries"
  L2_2["settingsynchost.exe"] = "binaries"
  L2_2["ssh.exe"] = "binaries"
  L2_2["stordiag.exe"] = "binaries"
  L2_2["syncappvpublishingserver.exe"] = "binaries"
  L2_2["tar.exe"] = "binaries"
  L2_2["ttdinject.exe"] = "binaries"
  L2_2["tttracer.exe"] = "binaries"
  L2_2["unregmp2.exe"] = "binaries"
  L2_2["vbc.exe"] = "binaries"
  L2_2["verclsid.exe"] = "binaries"
  L2_2["wab.exe"] = "binaries"
  L2_2["wbadmin.exe"] = "binaries"
  L2_2["winget.exe"] = "binaries"
  L2_2["wlrmdr.exe"] = "binaries"
  L2_2["wmic.exe"] = "binaries"
  L2_2["workfolders.exe"] = "binaries"
  L2_2["wscript.exe"] = "binaries"
  L2_2["wsreset.exe"] = "binaries"
  L2_2["wuauclt.exe"] = "binaries"
  L2_2["xwizard.exe"] = "binaries"
  L2_2["msedge_proxy.exe"] = "binaries"
  L2_2["msedgewebview2.exe"] = "binaries"
  L2_2["wt.exe"] = "binaries"
  L2_2["advpack.dll"] = "libraries"
  L2_2["desk.cpl"] = "libraries"
  L2_2["dfshim.dll"] = "libraries"
  L2_2["ieadvpack.dll"] = "libraries"
  L2_2["ieframe.dll"] = "libraries"
  L2_2["mshtml.dll"] = "libraries"
  L2_2["pcwutl.dll"] = "libraries"
  L2_2["scrobj.dll"] = "libraries"
  L2_2["setupapi.dll"] = "libraries"
  L2_2["shdocvw.dll"] = "libraries"
  L2_2["shell32.dll"] = "libraries"
  L2_2["shimgvw.dll"] = "libraries"
  L2_2["syssetup.dll"] = "libraries"
  L2_2["url.dll"] = "libraries"
  L2_2["zipfldr.dll"] = "libraries"
  L2_2["comsvcs.dll"] = "libraries"
  L2_2["acccheckconsole.exe"] = "othermsbinaries"
  L2_2["adplus.exe"] = "othermsbinaries"
  L2_2["agentexecutor.exe"] = "othermsbinaries"
  L2_2["appcert.exe"] = "othermsbinaries"
  L2_2["appvlp.exe"] = "othermsbinaries"
  L2_2["bginfo.exe"] = "othermsbinaries"
  L2_2["cdb.exe"] = "othermsbinaries"
  L2_2["coregen.exe"] = "othermsbinaries"
  L2_2["createdump.exe"] = "othermsbinaries"
  L2_2["csi.exe"] = "othermsbinaries"
  L2_2["defaultpack.exe"] = "othermsbinaries"
  L2_2["devinit.exe"] = "othermsbinaries"
  L2_2["devtoolslauncher.exe"] = "othermsbinaries"
  L2_2["dnx.exe"] = "othermsbinaries"
  L2_2["dotnet.exe"] = "othermsbinaries"
  L2_2["dsdbutil.exe"] = "othermsbinaries"
  L2_2["dtutil.exe"] = "othermsbinaries"
  L2_2["dump64.exe"] = "othermsbinaries"
  L2_2["dumpminitool.exe"] = "othermsbinaries"
  L2_2["dxcap.exe"] = "othermsbinaries"
  L2_2["excel.exe"] = "othermsbinaries"
  L2_2["fsi.exe"] = "othermsbinaries"
  L2_2["fsianycpu.exe"] = "othermsbinaries"
  L2_2["mftrace.exe"] = "othermsbinaries"
  L2_2["microsoft.nodejstools.pressanykey.exe"] = "othermsbinaries"
  L2_2["msaccess.exe"] = "othermsbinaries"
  L2_2["msdeploy.exe"] = "othermsbinaries"
  L2_2["msohtmed.exe"] = "othermsbinaries"
  L2_2["mspub.exe"] = "othermsbinaries"
  L2_2["msxsl.exe"] = "othermsbinaries"
  L2_2["ntdsutil.exe"] = "othermsbinaries"
  L2_2["openconsole.exe"] = "othermsbinaries"
  L2_2["powerpnt.exe"] = "othermsbinaries"
  L2_2["procdump.exe"] = "othermsbinaries"
  L2_2["protocolhandler.exe"] = "othermsbinaries"
  L2_2["rcsi.exe"] = "othermsbinaries"
  L2_2["remote.exe"] = "othermsbinaries"
  L2_2["sqldumper.exe"] = "othermsbinaries"
  L2_2["sqlps.exe"] = "othermsbinaries"
  L2_2["sqltoolsps.exe"] = "othermsbinaries"
  L2_2["squirrel.exe"] = "othermsbinaries"
  L2_2["te.exe"] = "othermsbinaries"
  L2_2["teams.exe"] = "othermsbinaries"
  L2_2["testwindowremoteagent.exe"] = "othermsbinaries"
  L2_2["tracker.exe"] = "othermsbinaries"
  L2_2["update.exe"] = "othermsbinaries"
  L2_2["vsdiagnostics.exe"] = "othermsbinaries"
  L2_2["vsiisexelauncher.exe"] = "othermsbinaries"
  L2_2["visio.exe"] = "othermsbinaries"
  L2_2["visualuiaverifynative.exe"] = "othermsbinaries"
  L2_2["vslaunchbrowser.exe"] = "othermsbinaries"
  L2_2["vshadow.exe"] = "othermsbinaries"
  L2_2["vsjitdebugger.exe"] = "othermsbinaries"
  L2_2["wfc.exe"] = "othermsbinaries"
  L2_2["winproj.exe"] = "othermsbinaries"
  L2_2["winword.exe"] = "othermsbinaries"
  L2_2["wsl.exe"] = "othermsbinaries"
  L2_2["devtunnel.exe"] = "othermsbinaries"
  L2_2["vsls-agent.exe"] = "othermsbinaries"
  L2_2["vstest.console.exe"] = "othermsbinaries"
  L2_2["winfile.exe"] = "othermsbinaries"
  L2_2["xsd.exe"] = "othermsbinaries"
  L2_2["cl_loadassembly.ps1"] = "scripts"
  L2_2["cl_mutexverifiers.ps1"] = "scripts"
  L2_2["cl_invocation.ps1"] = "scripts"
  L2_2["launch-vsdevshell.ps1"] = "scripts"
  L2_2["manage-bde.wsf"] = "scripts"
  L2_2["pubprn.vbs"] = "scripts"
  L2_2["syncappvpublishingserver.vbs"] = "scripts"
  L2_2["utilityfunctions.ps1"] = "scripts"
  L2_2["winrm.vbs"] = "scripts"
  L2_2["pester.bat"] = "scripts"
  L3_2 = L2_2[A0_2]
  if L3_2 == nil then
    L4_2 = false
    return L4_2
  end
  if A1_2 == nil then
    L4_2 = true
    L5_2 = L3_2
    return L4_2, L5_2
  end
  L4_2 = string
  L4_2 = L4_2.lower
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  A1_2 = L4_2
  if A1_2 == L3_2 then
    L4_2 = true
    return L4_2
  end
  L4_2 = false
  return L4_2
end

isLolBasFilename = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = versioning
  L0_2 = L0_2.GetOrgID
  L0_2 = L0_2()
  if L0_2 ~= nil then
    L1_2 = #L0_2
    if 20 < L1_2 then
      L1_2 = "PII_"
      L2_2 = string
      L2_2 = L2_2.lower
      L3_2 = L0_2
      L2_2 = L2_2(L3_2)
      L1_2 = L1_2 .. L2_2
      return L1_2
    end
  end
  return
end

getOrgIdScrubbed = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 == nil then
    return
  end
  L1_2 = normalize_path
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == nil then
    return
  end
  L2_2 = string
  L2_2 = L2_2.lower
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  L2_2 = {}
  L3_2 = "c:\\programdata\\microsoft\\windows defender"
  L4_2 = "c:\\program files\\windows defender"
  L5_2 = "c:\\program files\\windows defender advanced threat protection"
  L6_2 = "c:\\program files\\windows security"
  L7_2 = "c:\\windows\\system32\\securityhealthservice.exe"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = string
    L8_2 = L8_2.find
    L9_2 = L1_2
    L10_2 = L7_2
    L11_2 = 1
    L12_2 = true
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    if L8_2 then
      L8_2 = true
      return L8_2
    end
  end
  L3_2 = false
  return L3_2
end

isDefenderPath = L0_1

function L0_1(A0_2)
  local L1_2, L2_2
  if A0_2 ~= nil then
    L1_2 = #A0_2
    if not (L1_2 <= 2) then
      goto lbl_7
    end
  end
  do return end
  ::lbl_7::
  L1_2 = {}
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["goopdate.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["mpsvc.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["mpclient.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["mpgear.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["iphlpapi.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["libcef.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["activeds.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["qclite.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["msimg32.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["aclmgr.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["rcdll.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["iscsiexe.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["iviewers.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["mscoree.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["version.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["cryptsp.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["msvcp140.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["d3dx9_43.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["atom.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["foxsdku32w.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["anydatarecoverysdk.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["libiomp5md.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["vcomp110.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["cmdres.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["vcl120.bpl"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["msedgeupdate.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["msedge_elf.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["chrome_elf.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["midlrtmd.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["duser.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["dllsafecheck.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["userenv.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["k7sysmn1.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["cryptbase.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["ncrypt.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["edputil.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["dbgeng.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["faultrep.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["wsock32.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["wintthp.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["dismcore.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["hccutils.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["x32bridge.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["wdsync.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["wdlocal.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["cnqmutil.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["hd-common.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["imobiehelper.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["toolsbag.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["mvvm.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["textshaping.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["mcvsocfg.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["netapi32.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["dsrole.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["sspicli.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["msftedit.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["format.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["webview2loader.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["winmm.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["brmod104.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["facesdk.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["dokan1.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["vdfvm17.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["dvusb.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["drivespan.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["gswdll32.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["vivaldi_elf.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["protectwow64.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["ceiinfolog.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["waveedit.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["mpamedia.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["coreclr.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["scanimageui.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["hpcustpartui.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["vina-cav3.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["mozglue.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["ccl80u.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["corefoundation.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["wtsapi32.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["ualapi.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["propsys.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["profapi.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["winmde.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["colorui.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["dui70.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["mi.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["winhttp.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["esent.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["wbemcomm.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["sxshared.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["winsync.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["ncobjapi.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["wlbsctrl.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["wmiclnt.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["vcruntime140.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["wwlib.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["vgauth.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["secur32.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["hpqhvsei.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["tosbtkbd.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["delevator64.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["vixdisklib.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["sbiedll.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["d3d8.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["sensapi.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["dxgi.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["fszwd.dat"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["radcui.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["nethost.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["printui.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["wscapi.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["wininet.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["clink_dll_x86.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["ahni2t.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["safestore64.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["wchook.dkll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["libcurl.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["mspgimme.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["oledlg.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["systemsettings.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["printdialog.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["iumbase.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["avcodec-61.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["heif.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["libde265.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["xmllite.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["uevmonitor.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["cnmpaui.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["sentinelagentcore.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["log.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["appvisvsubsystems64.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["windowscodecs.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.INFECTED
  L1_2["python310.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.LOWFI
  L1_2["sqlite.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.LOWFI
  L1_2["sqlite3.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.LOWFI
  L1_2["glib-2.0.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.LOWFI
  L1_2["crashrpt1403.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.LOWFI
  L1_2["ffmpeg.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.LOWFI
  L1_2["libvlc.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.LOWFI
  L1_2["jli.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.LOWFI
  L1_2["asus_wmi.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.LOWFI
  L1_2["wptsextensions.dll"] = L2_2
  L2_2 = mp
  L2_2 = L2_2.LOWFI
  L1_2["soldier.dll"] = L2_2
  L2_2 = L1_2[A0_2]
  return L2_2
end

isFilenameInSideLoadIndicators = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A0_2 ~= nil then
    L1_2 = #A0_2
    if not (L1_2 <= 5) then
      goto lbl_7
    end
  end
  do return end
  ::lbl_7::
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = {}
  L2_2 = {}
  L3_2 = " /ua /installsource scheduler"
  L4_2 = " /c"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L1_2["\\microsoft\\edgeupdate\\microsoftedgeupdate.exe"] = L2_2
  L2_2 = {}
  L3_2 = " /target:computer"
  L4_2 = " /target:user"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L1_2["C:\\Windows\\System32\\gpupdate.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\taskhostw.exe"] = L2_2
  L2_2 = {}
  L3_2 = " -upload"
  L2_2[1] = L3_2
  L1_2["C:\\Windows\\System32\\wermgr.exe"] = L2_2
  L2_2 = {}
  L3_2 = " --wake --system"
  L2_2[1] = L3_2
  L1_2["\\Google\\GoogleUpdater\\"] = L2_2
  L2_2 = {}
  L1_2["\\Microsoft Intune Management Extension\\ClientCertCheck.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\wsqmcons.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\appidcertstorecheck.exe"] = L2_2
  L2_2 = {}
  L3_2 = " /checkin"
  L2_2[1] = L3_2
  L1_2["\\Common Files\\microsoft shared\\ClickToRun\\officesvcmgr.exe"] = L2_2
  L2_2 = {}
  L3_2 = " ReportPolicies"
  L4_2 = " StartScan"
  L5_2 = " StartWork"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L1_2["C:\\Windows\\System32\\UsoClient.exe"] = L2_2
  L2_2 = {}
  L3_2 = " /frequentupdate SCHEDULEDTASK "
  L4_2 = " /WatchService"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L1_2["\\Common Files\\microsoft shared\\ClickToRun\\OfficeC2RClient.exe"] = L2_2
  L2_2 = {}
  L1_2["\\Common Files\\Adobe\\ARM\\1.0\\AdobeARM.exe"] = L2_2
  L2_2 = {}
  L3_2 = " /offerraupdate"
  L2_2[1] = L3_2
  L1_2["C:\\Windows\\System32\\raserver.exe"] = L2_2
  L2_2 = {}
  L1_2["\\Microsoft Office\\root\\Office16\\SDXHelper.exe"] = L2_2
  L2_2 = {}
  L3_2 = " C:\\WINDOWS\\system32\\PcaSvc.dll,PcaPatchSdbTask"
  L4_2 = " C:\\WINDOWS\\system32\\Windows.StateRepositoryClient.dll,StateRepositoryDoMaintenanceTasks"
  L5_2 = " C:\\WINDOWS\\system32\\CapabilityAccessManager.dll,CapabilityAccessManagerDoStoreMaintenance"
  L6_2 = " Startupscan.dll,SusRunTask"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L1_2["C:\\Windows\\System32\\rundll32.exe"] = L2_2
  L2_2 = {}
  L3_2 = " $(Arg0) $(Arg1) $(Arg2)"
  L2_2[1] = L3_2
  L1_2["C:\\Windows\\System32\\dsregcmd.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\AppHostRegistrationVerifier.exe"] = L2_2
  L2_2 = {}
  L3_2 = " start InventorySvc"
  L4_2 = " start pushtoinstall registration"
  L5_2 = " start w32time task_started"
  L6_2 = " start wuauserv"
  L7_2 = " start pushtoinstall login"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L1_2["C:\\Windows\\System32\\sc.exe"] = L2_2
  L2_2 = {}
  L1_2["\\appdata\\local\\microsoft\\onedrive\\onedrivestandaloneupdater.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\UCPDMgr.exe"] = L2_2
  L2_2 = {}
  L3_2 = " SystemCxt"
  L4_2 = " UserCxt"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L1_2["C:\\Windows\\System32\\DeviceCensus.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\dstokenclean.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\appidpolicyconverter.exe"] = L2_2
  L2_2 = {}
  L3_2 = " -z"
  L2_2[1] = L3_2
  L1_2["C:\\Windows\\System32\\DiskSnapshot.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\Speech_OneCore\\common\\SpeechModelDownload.exe"] = L2_2
  L2_2 = {}
  L3_2 = " poll"
  L2_2[1] = L3_2
  L1_2["\\Windows Autopatch Client Broker\\ClientBroker\\ClientBroker.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\dmclient.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\ClipRenew.exe"] = L2_2
  L2_2 = {}
  L3_2 = " -IdleTask -TaskName WdVerification"
  L4_2 = " -IdleTask -TaskName WdCacheMaintenance"
  L5_2 = " -IdleTask -TaskName WdCleanup"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L1_2["C:\\ProgramData\\Microsoft\\Windows Defender\\Platform\\"] = L2_2
  L2_2 = {}
  L3_2 = " /SendHeartbeat"
  L2_2[1] = L3_2
  L1_2["C:\\Windows\\System32\\UIEOrchestrator.exe"] = L2_2
  L2_2 = {}
  L3_2 = " CSP"
  L2_2[1] = L3_2
  L1_2["C:\\Windows\\System32\\hvsievaluator.exe"] = L2_2
  L2_2 = {}
  L1_2["\\Microsoft Intune Management Extension\\ClientHealthEval.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\CCM\\CcmEval.exe"] = L2_2
  L2_2 = {}
  L3_2 = "windowsdefenderatponboardingscript.cmd"
  L4_2 = "defenderatponboarding.cmd"
  L5_2 = "\\Utility\\GPODATA\\"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L1_2["C:\\Windows\\System32\\cmd.exe"] = L2_2
  L2_2 = {}
  L3_2 = " /autocleanstoragesense /d C:"
  L2_2[1] = L3_2
  L1_2["C:\\Windows\\System32\\cleanmgr.exe"] = L2_2
  L2_2 = {}
  L3_2 = " /pushregistration"
  L2_2[1] = L3_2
  L1_2["\\Microsoft Office\\root\\vfs\\ProgramFilesCommonX64\\Microsoft Shared\\Office16\\opushutil.exe"] = L2_2
  L2_2 = {}
  L1_2["\\Microsoft OneDrive\\OneDriveStandaloneUpdater.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\Microsoft.Data.UsageAndQualityInsights.MaintenanceTask.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\MusNotification.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\lpremove.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\LocationNotificationWindows.exe"] = L2_2
  L2_2 = {}
  L1_2["\\RUXIM\\PLUGScheduler.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\UCConfigTask.exe"] = L2_2
  L2_2 = {}
  L3_2 = " sync"
  L2_2[1] = L3_2
  L1_2["C:\\Windows\\System32\\msfeedssync.exe"] = L2_2
  L2_2 = {}
  L3_2 = "\\Cloud\\DSREGCMD' ; $DPath = $RPath.Replace('HKEY_LOCAL_MACHINE','HKLM:') ; Remove-Item -Path $DPath -Recurse -EA 0 ; $pattern = ' *[A-z]+ : [A-z0-9\\{\\}]+ *' ; $dsregcmd = dsregcmd /status "
  L4_2 = "\\Cloud\\Intune' ; $DPath = $RPath.Replace('HKEY_LOCAL_MACHINE','HKLM:') ; Remove-ItemProperty -Path $DPath -Name '*' -EA 0 ; $QPath = 'HKLM:\\SOFTWARE\\Microsoft\\Enrollments'"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L1_2["C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"] = L2_2
  L2_2 = {}
  L3_2 = " ExecuteScheduledSPPCreation"
  L2_2[1] = L3_2
  L1_2["C:\\Windows\\System32\\SrTasks.exe"] = L2_2
  L2_2 = {}
  L3_2 = "http://localhost/WebAPI/Utilities/support/DefenderDatUpdate"
  L2_2[1] = L3_2
  L1_2["\\util\\ServiceExecution.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\dxgiadaptercache.exe"] = L2_2
  L2_2 = {}
  L1_2["\\Bin\\EpicHyperdriveTempDataCleanup.exe"] = L2_2
  L2_2 = {}
  L3_2 = " wacheck"
  L2_2[1] = L3_2
  L1_2["\\Microsoft Office\\root\\vfs\\ProgramFilesCommonX64\\Microsoft Shared\\Office16\\ActionsServer\\ActionsServer.exe"] = L2_2
  L2_2 = {}
  L1_2["C:\\Windows\\System32\\CompatTelRunner.exe"] = L2_2
  L2_2 = {}
  L3_2 = " GenericMessagingAddin_Pulsation"
  L2_2[1] = L3_2
  L1_2["\\ScheduleEventAction.exe"] = L2_2
  L2_2 = {}
  L3_2 = "/turn 5 /source LogonIdleTask"
  L2_2[1] = L3_2
  L1_2["C:\\Windows\\System32\\provtool.exe"] = L2_2
  L2_2 = {}
  L3_2 = " /ItemId:db9484d4-5488-4a63-98a1-368bd3b988e8 /DelayForMax:7200"
  L2_2[1] = L3_2
  L1_2["\\Thycotic\\Agents\\Agent\\TaskExecutor.exe"] = L2_2
  L2_2 = {}
  L3_2 = "C:\\Windows\\Packagelogs\\AADBrokerPlugIn_Remediation\\"
  L2_2[1] = L3_2
  L1_2["C:\\Windows\\System32\\wscript.exe"] = L2_2
  L2_2 = {}
  L3_2 = " Task"
  L2_2[1] = L3_2
  L1_2["\\ManageEngine\\UEMS_Agent\\bin\\dcagentupgrader.exe"] = L2_2
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    if L5_2 ~= nil then
      L7_2 = string
      L7_2 = L7_2.find
      L8_2 = A0_2
      L9_2 = string
      L9_2 = L9_2.lower
      L10_2 = L5_2
      L9_2 = L9_2(L10_2)
      L10_2 = 1
      L11_2 = true
      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
      if L7_2 then
        L7_2 = #L6_2
        if L7_2 == 0 then
          L7_2 = true
          return L7_2
        else
          L7_2 = ipairs
          L8_2 = L6_2
          L7_2, L8_2, L9_2 = L7_2(L8_2)
          for L10_2, L11_2 in L7_2, L8_2, L9_2 do
            if L11_2 ~= nil then
              L12_2 = string
              L12_2 = L12_2.find
              L13_2 = A0_2
              L14_2 = string
              L14_2 = L14_2.lower
              L15_2 = L11_2
              L14_2 = L14_2(L15_2)
              L15_2 = 1
              L16_2 = true
              L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
              if L12_2 then
                L12_2 = true
                return L12_2
              end
            end
          end
          L7_2 = false
          return L7_2
        end
      end
    end
  end
  L2_2 = false
  return L2_2
end

isCommonScheduledTaskCommand = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A0_2 ~= nil then
    L1_2 = #A0_2
    if not (L1_2 <= 5) then
      goto lbl_7
    end
  end
  do return end
  ::lbl_7::
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = StringEndsWith
  L2_2 = A0_2
  L3_2 = "defenderatponboardingscript.cmd"
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L1_2 = StringEndsWith
    L2_2 = A0_2
    L3_2 = "defenderatponboarding.cmd"
    L1_2 = L1_2(L2_2, L3_2)
    if not L1_2 then
      L1_2 = StringEndsWith
      L2_2 = A0_2
      L3_2 = "\\programdata\\airwatch\\cache\\disable_netbios.ps1"
      L1_2 = L1_2(L2_2, L3_2)
      if not L1_2 then
        L1_2 = StringEndsWith
        L2_2 = A0_2
        L3_2 = "\\windows\\ise\\ise_add_profile.bat"
        L1_2 = L1_2(L2_2, L3_2)
        if not L1_2 then
          L1_2 = StringEndsWith
          L2_2 = A0_2
          L3_2 = "\\temp\\clientcert.ps1"
          L1_2 = L1_2(L2_2, L3_2)
          if not L1_2 then
            L1_2 = StringEndsWith
            L2_2 = A0_2
            L3_2 = "\\program files\\wpdf\\scripts\\tsuserex.dll"
            L1_2 = L1_2(L2_2, L3_2)
            if not L1_2 then
              L1_2 = StringEndsWith
              L2_2 = A0_2
              L3_2 = "\\windows\\disable-usbhubsleep.ps1"
              L1_2 = L1_2(L2_2, L3_2)
              if not L1_2 then
                L1_2 = StringEndsWith
                L2_2 = A0_2
                L3_2 = "\\windows\\logs\\defender-onboard-startupscript.ps1"
                L1_2 = L1_2(L2_2, L3_2)
                if not L1_2 then
                  L1_2 = StringEndsWith
                  L2_2 = A0_2
                  L3_2 = "\\vf\\vf-removechat.ps1"
                  L1_2 = L1_2(L2_2, L3_2)
                  if not L1_2 then
                    L1_2 = StringEndsWith
                    L2_2 = A0_2
                    L3_2 = "w11migration\\dot1svc.ps1"
                    L1_2 = L1_2(L2_2, L3_2)
                    if not L1_2 then
                      L1_2 = StringEndsWith
                      L2_2 = A0_2
                      L3_2 = "\\pcdiag_m365\\run.ps1"
                      L1_2 = L1_2(L2_2, L3_2)
                      if not L1_2 then
                        L1_2 = StringEndsWith
                        L2_2 = A0_2
                        L3_2 = "\\support\\utils\\session\\bat\\unlockevent.bat"
                        L1_2 = L1_2(L2_2, L3_2)
                        if not L1_2 then
                          L1_2 = StringEndsWith
                          L2_2 = A0_2
                          L3_2 = "\\yvapps\\unlock.bat"
                          L1_2 = L1_2(L2_2, L3_2)
                          if not L1_2 then
                            L1_2 = StringEndsWith
                            L2_2 = A0_2
                            L3_2 = "\\anima-scripts\\delete_logs.bat"
                            L1_2 = L1_2(L2_2, L3_2)
                            if not L1_2 then
                              L1_2 = StringEndsWith
                              L2_2 = A0_2
                              L3_2 = "\\package-deploy\\enabledefender.cmd"
                              L1_2 = L1_2(L2_2, L3_2)
                              if not L1_2 then
                                L1_2 = StringEndsWith
                                L2_2 = A0_2
                                L3_2 = "\\temp\\lansweeper\\install.cmd"
                                L1_2 = L1_2(L2_2, L3_2)
                                if not L1_2 then
                                  L1_2 = StringEndsWith
                                  L2_2 = A0_2
                                  L3_2 = "\\it\\lockscreen\\lockscreen.ps1"
                                  L1_2 = L1_2(L2_2, L3_2)
                                  if not L1_2 then
                                    L1_2 = StringEndsWith
                                    L2_2 = A0_2
                                    L3_2 = "\\wdf\\cfr.ps1"
                                    L1_2 = L1_2(L2_2, L3_2)
                                    if not L1_2 then
                                      goto lbl_122
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L1_2 = true
  do return L1_2 end
  ::lbl_122::
  L1_2 = {}
  L2_2 = "windowsdefenderatponboardingpackage"
  L3_2 = "windowsdefenderatponboardingscript"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = string
    L7_2 = L7_2.find
    L8_2 = A0_2
    L9_2 = L6_2
    L10_2 = 1
    L11_2 = true
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
    if L7_2 then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = A0_2
  L4_2 = "([^\\]+)$"
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L2_2 = A0_2
  end
  if L2_2 ~= nil then
    L3_2 = #L2_2
    if not (L3_2 <= 4) then
      goto lbl_157
    end
  end
  do return end
  ::lbl_157::
  L3_2 = {}
  L3_2["ws1_health_utility.ps1"] = true
  L3_2["configmgrclienthealth.ps1"] = true
  L3_2["enable-hybridazureadscheduletasks.ps1"] = true
  L3_2["psappdeploytoolkit-executeasuser.vbs"] = true
  L3_2["mdm_dsmcheck.ps1"] = true
  L3_2["noahbu.cmd"] = true
  L3_2["pslogcleanup.ps1"] = true
  L3_2["uemslogcollector.exe"] = true
  L3_2["map-paw-share.ps1"] = true
  L3_2["deploy-osicfromgpo.ps1"] = true
  L3_2["configmgrclienthealth.exe"] = true
  L3_2["sccm_client_install_v2.4.ps1"] = true
  L3_2["lock.bat"] = true
  L3_2["rungpresultreport.vbs"] = true
  L3_2["bitsadmin_change_to_no_proxy.bat"] = true
  L3_2["devicecomplianceonboardingscript.cmd"] = true
  L3_2["smime_auto_installation.vbs"] = true
  L3_2["manage.dla.ps1"] = true
  L3_2["invoke-mdesetup.ps1"] = true
  L3_2["enable-bitlocker.ps1"] = true
  L3_2["backup-log_v0.33.ps1"] = true
  L3_2["migrate-client.cmd"] = true
  L3_2["zd_nimda_cockpit_pw.ps1"] = true
  L3_2["dnswinsconfig.exe"] = true
  L3_2["setmcafeecustomprops.ps1"] = true
  L3_2["enableinheritance_final.ps1"] = true
  L3_2["vf-wdatp_registry.xml"] = true
  L3_2["windowsdefenderatponboardingscript.cmd"] = true
  L3_2["runtoasthidden.cmd"] = true
  L3_2["citrixvda_modreg.bat"] = true
  L3_2["win32agentipc.exe"] = true
  L3_2["set-ahcbitlockersequence.ps1"] = true
  L3_2["wudu.vbs"] = true
  L3_2["sccmclienteval_new.ps1"] = true
  L3_2["outlooksmime.vbs"] = true
  L3_2["get-newteamsversion.ps1"] = true
  L3_2["java_deployment.ps1"] = true
  L3_2["pxs_bvalidation.ps1"] = true
  L3_2["saverecoverykey.ps1"] = true
  L3_2["check-gpo.ps1"] = true
  L3_2["lockevent.bat"] = true
  L3_2["gporunpsscriptsilent.vbs"] = true
  L3_2["removelocalprofiles.ps1"] = true
  L3_2["configmgrstartup.vbs"] = true
  L3_2["clean-usertemp.ps1"] = true
  L3_2["ubsremoteassistendtasks.ps1"] = true
  L3_2["rac.exe"] = true
  L3_2["firstlaunch_teams.ps1"] = true
  L3_2["cer_automation.bat"] = true
  L3_2["launchdeployapps.vbs"] = true
  L3_2["intunescript-imageinformation-user.ps1"] = true
  L3_2["configupdater.ps1"] = true
  L3_2["addskypemeetingsplugintofirewall.ps1"] = true
  L3_2["users_fw.ps1"] = true
  L3_2["get-usersession-logoff-old-v1.ps1"] = true
  L3_2["user_logging_final.ps1"] = true
  L3_2["optumscriptswitchupdate.bat"] = true
  L3_2["reboot_check_updated.ps1"] = true
  L3_2["pcm-ucheck.ps1"] = true
  L3_2["remove-intunecurrentenrollment.ps1"] = true
  L3_2["browsercacheremoval.bat"] = true
  L3_2["workstationmanager-privilegerevocation.ps1"] = true
  L3_2["discovery-windows.exe"] = true
  L3_2["chama_ps1_configpatch.vbs"] = true
  L3_2["wudu_rollback.vbs"] = true
  L3_2["mugshotv2.bat"] = true
  L3_2["802.1x_authentication_settings.xml"] = true
  L3_2["docusnapscript-run.ps1"] = true
  L3_2["auditposte.exe"] = true
  L3_2["launchpsscript.vbs"] = true
  L3_2["itunes_stop.vbs"] = true
  L3_2["updatecertificat.ps1"] = true
  L3_2["windowsdefenderatplocalonboardingscript.cmd"] = true
  L3_2["n5start.ps1"] = true
  L3_2["winget-upgrade.ps1"] = true
  L3_2["dateprofile.ps1"] = true
  L3_2["setwin10smoptions.cmd"] = true
  L3_2["qualyscloudagentinstallation.bat"] = true
  L3_2["deployirtk.cmd"] = true
  L3_2["helios_it_zd_inventarisierung_ocs.ps1"] = true
  L3_2["monitor-nexthinkservice.ps1"] = true
  L3_2["readingrjpolicy.ps1"] = true
  L3_2["mdm_edgeupdatehelper.ps1"] = true
  L3_2["unlockevent.bat"] = true
  L3_2["corporatebranding.bat"] = true
  L3_2["vf-mde-enable.ps1"] = true
  L3_2["migrate-user.vbs"] = true
  L3_2["iemode_update.bat"] = true
  L3_2["configmgrstartup_schedtask.wsf"] = true
  L3_2["uploadappjson.ps1"] = true
  L3_2["ecm-nl-live.js"] = true
  L3_2["1096notify.ps1"] = true
  L3_2["idleuserlogoff-8hours.ps1"] = true
  L3_2["zscaler_audit.ps1"] = true
  L3_2["disable-windowsfirewalllocalsmbrules.ps1"] = true
  L3_2["update_win_features.bat"] = true
  L3_2["chrome_bku_install.exe"] = true
  L3_2["lockscreensaver.exe"] = true
  L3_2["hivenightmarefix.ps1"] = true
  L3_2["automatic_pagefile_tuning.ps1"] = true
  L3_2["xmlchecker.ps1"] = true
  L3_2["cleanup.ps1"] = true
  L3_2["lockscreenbranding.ps1"] = true
  L3_2["print_disable.bat"] = true
  L3_2["sp_poshacme_renewal.ps1"] = true
  L3_2["healthcheckmdatp.ps1"] = true
  L3_2["delprof_adm.log"] = true
  L3_2["526-get-mcgtcpconnections.ps1"] = true
  L3_2["createczlocadmin.ps1"] = true
  L3_2["karmakvpnping.cmd"] = true
  L3_2["configbackgroundsync.ps1"] = true
  L3_2["push-ordrepattributes.ps1"] = true
  L3_2["mbamcheckstatus.vbs"] = true
  L3_2["get_csv_certificate.vbs"] = true
  L3_2["scheduleclientshutdowncommand.ps1"] = true
  L3_2["wwan_info_to_reg.ps1"] = true
  L3_2["removelocalwinrm.ps1"] = true
  L3_2["casvc-install.exe"] = true
  L3_2["checkmecm.bat"] = true
  L3_2["clear-printerdefaults.vbs"] = true
  L3_2["rebootlogging.ps1"] = true
  L3_2["nettoyagearchiveslogsec.ps1"] = true
  L3_2["wfdv_printers_local.vbs"] = true
  L3_2["alwaysonvpn_device.ps1"] = true
  L3_2["hwinventory.ps1"] = true
  L3_2["appdatafirewallrules.ps1"] = true
  L3_2["eyextensioninstallforcelist.exe"] = true
  L3_2["chrome_bku_tray.exe"] = true
  L3_2["sp_removejob.cmd"] = true
  L3_2["startupevent.bat"] = true
  L3_2["installskysea.vbe"] = true
  L3_2["skyseasetup.bat"] = true
  L3_2["AuditCopyCATsForAppVapps-ng.ps1"] = true
  L3_2["QuickAssistRemoval.ps1"] = true
  L3_2["java8uninstall.ps1"] = true
  L3_2["dsregcmd-leave.log"] = true
  L3_2["getPcInfo.ps1"] = true
  L3_2["prelude_fake_disk_mount.txt"] = true
  L3_2["eyofficetargetedsettings.exe"] = true
  L3_2["sp_audit_poshacme_certs_v2.ps1"] = true
  L3_2["auditcopycatsforappvapps-ng.ps1"] = true
  L3_2["quickassistremoval.ps1"] = true
  L3_2["acrlogin.log"] = true
  L3_2["set-script.ps1"] = true
  L3_2["random_reboot.ps1"] = true
  L3_2["wfdv_meditech_local.vbs"] = true
  L3_2["setpermissions.cmd"] = true
  L3_2["print_enable.bat"] = true
  L3_2["onboarding.bat"] = true
  L3_2["disable_netbios.ps1"] = true
  L3_2["uninstall_solarwinds_client_components.ps1"] = true
  L3_2["defaultimappregistrysettings.ps1"] = true
  L3_2["runhidden.vbs"] = true
  L3_2["pulizia.bat"] = true
  L3_2["qaw.proxcardcredprov.log"] = true
  L3_2["!!flash-uninstall-anddeletefiles.bat"] = true
  L3_2["backrunarg.vbs"] = true
  L3_2["controlproxy.ps1"] = true
  L3_2["pcut_upgrade.ps1"] = true
  L3_2["gp.vbs"] = true
  L3_2["audio_driver_remove.bat"] = true
  L3_2["eas delete.ps1"] = true
  L3_2["rebootwithdelay.vbs"] = true
  L3_2["sophoscentral-disinstalla-agent.ps1"] = true
  L3_2["checknetworkandteams_dnsdomain.ps1"] = true
  L3_2["disableflightmode.ps1"] = true
  L3_2["cpdloginscript.bat"] = true
  L3_2["dash-file-dist_bootstrapper.ps1"] = true
  L3_2["loghealthcentrally.ps1"] = true
  L3_2["retail-biosmanagement.ps1"] = true
  L3_2["bitlocker-enrollment.cmd"] = true
  L3_2["ciphersuite.ps1"] = true
  L3_2["onboard-device.cmd"] = true
  L3_2["set-disabledomaincreds.ps1"] = true
  L3_2["mdeonboardingwin10-11.cmd"] = true
  L3_2["exsynclauncher.vbs"] = true
  L3_2["windows-os-mmg_services_hostfile_update.bat"] = true
  L3_2["registerdns.ps1"] = true
  L3_2["cyberhavenmanager.exe"] = true
  L3_2["heartbeat.vbs"] = true
  L3_2["flex_sched_runinventory.bat"] = true
  L3_2["installagentscript.vbs"] = true
  L3_2["launchedgechromels.vbs"] = true
  L3_2["kiosk_reboot.vbs"] = true
  L3_2["sccm_metered_fix.ps1"] = true
  L3_2["desktop.ini"] = true
  L3_2["appxpackage_removal.vbs"] = true
  L3_2["gpo-scheduledtask-islhd-filesync.bat"] = true
  L3_2["fixunquotedserviceuninstall.ps1"] = true
  L3_2["invoke-setdevicetimestamp.ps1"] = true
  L3_2["deploymma2019.cmd"] = true
  L3_2["print_delete.bat"] = true
  L3_2["deleteprofiles-90days.ps1"] = true
  L3_2["loginreporttosql.exe"] = true
  L3_2["autosetup.vbe"] = true
  L3_2["mappadischi.vbs"] = true
  L3_2["set-processmitigation.ps1"] = true
  L3_2["cra_wifi_ecaw.cmd"] = true
  L3_2["windowsdefenderatp-gpo-onboarding.cmd"] = true
  L3_2["onedrivepcmover_scheduledtask.vbs"] = true
  L3_2["sendteamslogs.ps1"] = true
  L3_2["analyze-my-home-drive.vbs"] = true
  L3_2["install-eduroam-wlan-profile-8021xteapauthcheck.ps1"] = true
  L3_2["checkreboot.ps1"] = true
  L3_2["report.vbs"] = true
  L3_2["logonalert_win11.vbs"] = true
  L3_2["hide-console.vbs"] = true
  L3_2["regcmdstarthidden.exe"] = true
  L3_2["mappadischi.exe"] = true
  L3_2["karmakfusionbranchserver.ps1"] = true
  L3_2["delete_old_archived_winevent_logs.ps1"] = true
  L3_2["rem_everyone.ps1"] = true
  L3_2["selfscan.exe"] = true
  L3_2["updatewlapps-system.ps1"] = true
  L4_2 = L3_2[L2_2]
  if L4_2 ~= nil then
    L4_2 = true
    return L4_2
  end
  L4_2 = false
  return L4_2
end

isCommonScheduledTaskFile = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  if A0_2 then
    L1_2 = #A0_2
    if not (L1_2 <= 3) then
      goto lbl_8
    end
  end
  L1_2 = nil
  L2_2 = nil
  do return L1_2, L2_2 end
  ::lbl_8::
  L2_2 = A0_2
  L1_2 = A0_2.lower
  L1_2 = L1_2(L2_2)
  L2_2 = {}
  L3_2 = {}
  L3_2.key = "node.exe"
  L3_2.type = "nodejs"
  L3_2.gentype = "script"
  L4_2 = {}
  L4_2.key = "node "
  L4_2.type = "nodejs"
  L4_2.gentype = "script"
  L5_2 = {}
  L5_2.key = "wscript"
  L5_2.type = "wsh"
  L5_2.gentype = "script"
  L6_2 = {}
  L6_2.key = "cscript"
  L6_2.type = "wsh"
  L6_2.gentype = "script"
  L7_2 = {}
  L7_2.key = "mshta"
  L7_2.type = "mshta"
  L7_2.gentype = "script"
  L8_2 = {}
  L8_2.key = "python.exe"
  L8_2.type = "python"
  L8_2.gentype = "script"
  L9_2 = {}
  L9_2.key = "python "
  L9_2.type = "python"
  L9_2.gentype = "script"
  L10_2 = {}
  L10_2.key = "java.exe"
  L10_2.type = "java"
  L10_2.gentype = "script"
  L11_2 = {}
  L11_2.key = "java "
  L11_2.type = "java"
  L11_2.gentype = "script"
  L12_2 = {}
  L12_2.key = "rundll32"
  L12_2.type = "rundll32"
  L12_2.gentype = "dll_loader"
  L13_2 = {}
  L13_2.key = "regsvr32"
  L13_2.type = "regsvr32"
  L13_2.gentype = "dll_loader"
  L14_2 = {}
  L14_2.key = "curl"
  L14_2.type = "curl"
  L14_2.gentype = "downloader"
  L15_2 = {}
  L15_2.key = "wget"
  L15_2.type = "wget"
  L15_2.gentype = "downloader"
  L16_2 = {}
  L16_2.key = "certutil"
  L16_2.type = "certutil"
  L16_2.gentype = "downloader"
  L17_2 = {}
  L17_2.key = "msiexec"
  L17_2.type = "msi"
  L17_2.gentype = "script"
  L18_2 = {}
  L18_2.key = "powershell_ise"
  L18_2.type = "powershell"
  L18_2.gentype = "script"
  L19_2 = {}
  L19_2.key = "pwsh"
  L19_2.type = "powershell"
  L19_2.gentype = "script"
  L20_2 = {}
  L20_2.key = "powershell"
  L20_2.type = "powershell"
  L20_2.gentype = "script"
  L21_2 = {}
  L21_2.key = "wmic"
  L21_2.type = "wmic"
  L21_2.gentype = "wmi"
  L22_2 = {}
  L22_2.key = "cmd.exe"
  L22_2.type = "cmd"
  L22_2.gentype = "shell"
  L23_2 = {}
  L23_2.key = "cmd "
  L23_2.type = "cmd"
  L23_2.gentype = "shell"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L2_2[7] = L9_2
  L2_2[8] = L10_2
  L2_2[9] = L11_2
  L2_2[10] = L12_2
  L2_2[11] = L13_2
  L2_2[12] = L14_2
  L2_2[13] = L15_2
  L2_2[14] = L16_2
  L2_2[15] = L17_2
  L2_2[16] = L18_2
  L2_2[17] = L19_2
  L2_2[18] = L20_2
  L2_2[19] = L21_2
  L2_2[20] = L22_2
  L2_2[21] = L23_2
  L3_2 = 1
  L4_2 = #L2_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L2_2[L6_2]
    L9_2 = L1_2
    L8_2 = L1_2.find
    L10_2 = L7_2.key
    L11_2 = 1
    L12_2 = true
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    if L8_2 then
      L8_2 = L7_2.type
      L9_2 = L7_2.gentype
      return L8_2, L9_2
    end
  end
  L3_2 = nil
  L4_2 = nil
  return L3_2, L4_2
end

getCommandLineType = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if A0_2 ~= nil then
    L1_2 = #A0_2
    if not (L1_2 <= 3) then
      goto lbl_7
    end
  end
  do return end
  ::lbl_7::
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = normalize_path
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  A0_2 = L1_2
  L1_2 = string
  L1_2 = L1_2.sub
  L2_2 = A0_2
  L3_2 = 1
  L4_2 = 1
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  if L1_2 ~= "c" then
    L1_2 = true
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.find
  L2_2 = A0_2
  L3_2 = "\\program files"
  L4_2 = 1
  L5_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if L1_2 == nil then
    L1_2 = string
    L1_2 = L1_2.find
    L2_2 = A0_2
    L3_2 = "c:\\windows\\system32\\"
    L4_2 = 1
    L5_2 = true
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    if L1_2 == nil then
      L1_2 = string
      L1_2 = L1_2.find
      L2_2 = A0_2
      L3_2 = "c:\\windows\\syswow64\\"
      L4_2 = 1
      L5_2 = true
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      if L1_2 == nil then
        L1_2 = string
        L1_2 = L1_2.find
        L2_2 = A0_2
        L3_2 = "windows\\winsxs"
        L4_2 = 1
        L5_2 = true
        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
        if L1_2 == nil then
          L1_2 = string
          L1_2 = L1_2.find
          L2_2 = A0_2
          L3_2 = "windows\\assembly"
          L4_2 = 1
          L5_2 = true
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          if L1_2 == nil then
            L1_2 = string
            L1_2 = L1_2.find
            L2_2 = A0_2
            L3_2 = "windows\\microsoft.net"
            L4_2 = 1
            L5_2 = true
            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
            if L1_2 == nil then
              L1_2 = string
              L1_2 = L1_2.find
              L2_2 = A0_2
              L3_2 = "\\$windows.\\"
              L4_2 = 1
              L5_2 = true
              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
              if L1_2 == nil then
                L1_2 = string
                L1_2 = L1_2.find
                L2_2 = A0_2
                L3_2 = "\\windows.\\"
                L4_2 = 1
                L5_2 = true
                L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                if L1_2 == nil then
                  L1_2 = string
                  L1_2 = L1_2.find
                  L2_2 = A0_2
                  L3_2 = "\\winpe\\windows\\"
                  L4_2 = 1
                  L5_2 = true
                  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                  if L1_2 == nil then
                    L1_2 = string
                    L1_2 = L1_2.find
                    L2_2 = A0_2
                    L3_2 = "\\$winreagent\\"
                    L4_2 = 1
                    L5_2 = true
                    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                    if L1_2 == nil then
                      L1_2 = string
                      L1_2 = L1_2.find
                      L2_2 = A0_2
                      L3_2 = "\\bin"
                      L4_2 = 1
                      L5_2 = true
                      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                      if L1_2 == nil then
                        L1_2 = string
                        L1_2 = L1_2.find
                        L2_2 = A0_2
                        L3_2 = "\\dev"
                        L4_2 = 1
                        L5_2 = true
                        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                        if L1_2 == nil then
                          L1_2 = string
                          L1_2 = L1_2.find
                          L2_2 = A0_2
                          L3_2 = "\\drvsetup"
                          L4_2 = 1
                          L5_2 = true
                          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                          if L1_2 == nil then
                            L1_2 = string
                            L1_2 = L1_2.find
                            L2_2 = A0_2
                            L3_2 = "\\lib\\"
                            L4_2 = 1
                            L5_2 = true
                            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                            if L1_2 == nil then
                              L1_2 = string
                              L1_2 = L1_2.find
                              L2_2 = A0_2
                              L3_2 = "\\git\\"
                              L4_2 = 1
                              L5_2 = true
                              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                              if L1_2 == nil then
                                L1_2 = string
                                L1_2 = L1_2.find
                                L2_2 = A0_2
                                L3_2 = "\\wintrv"
                                L4_2 = 1
                                L5_2 = true
                                L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                if L1_2 == nil then
                                  L1_2 = string
                                  L1_2 = L1_2.find
                                  L2_2 = A0_2
                                  L3_2 = "\\x64"
                                  L4_2 = 1
                                  L5_2 = true
                                  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                  if L1_2 == nil then
                                    L1_2 = string
                                    L1_2 = L1_2.find
                                    L2_2 = A0_2
                                    L3_2 = "debug"
                                    L4_2 = 1
                                    L5_2 = true
                                    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                    if L1_2 == nil then
                                      L1_2 = string
                                      L1_2 = L1_2.find
                                      L2_2 = A0_2
                                      L3_2 = "release"
                                      L4_2 = 1
                                      L5_2 = true
                                      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                      if L1_2 == nil then
                                        L1_2 = string
                                        L1_2 = L1_2.find
                                        L2_2 = A0_2
                                        L3_2 = "\\sccmcontentlib\\filelib"
                                        L4_2 = 1
                                        L5_2 = true
                                        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                        if L1_2 == nil then
                                          goto lbl_206
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L1_2 = true
  do return L1_2 end
  ::lbl_206::
  L1_2 = false
  return L1_2
end

isKnownCleanPathContext = L0_1
