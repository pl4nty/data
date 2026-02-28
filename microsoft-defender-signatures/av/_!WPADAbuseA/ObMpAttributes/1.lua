local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_SCANREASON
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L1_1 == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_PROCESSNAME
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
  if L2_1 ~= "svchost.exe" then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
  L2_1 = L2_1(L3_1)
  L3_1 = mp
  L3_1 = L3_1.GetProcessCommandLine
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L4_1 = string
  L4_1 = L4_1.len
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if L4_1 < 60 or 120 < L4_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = string
  L6_1 = L6_1.lower
  L7_1 = L3_1
  L6_1 = L6_1(L7_1)
  L7_1 = "winhttpautoproxysvc"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = MpCommon
  L5_1 = L5_1.QueryPersistContext
  L6_1 = L0_1
  L7_1 = "DroppedByWPADService"
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    L5_1 = MpCommon
    L5_1 = L5_1.AppendPersistContext
    L6_1 = L0_1
    L7_1 = "DroppedByWPADService"
    L8_1 = 0
    L5_1(L6_1, L7_1, L8_1)
  end
  L5_1 = mp
  L5_1 = L5_1.enum_mpattributesubstring
  L6_1 = "PreAgent:"
  L5_1 = L5_1(L6_1)
  if L5_1 == nil then
    L6_1 = mp
    L6_1 = L6_1.ReportLowfi
    L7_1 = L0_1
    L8_1 = 1486841132
    L6_1(L7_1, L8_1)
  end
  L6_1 = #L5_1
  if L6_1 == 0 then
    L6_1 = mp
    L6_1 = L6_1.ReportLowfi
    L7_1 = L0_1
    L8_1 = 1486841132
    L6_1(L7_1, L8_1)
  end
else
  L2_1 = mp
  L2_1 = L2_1.SCANREASON_ONOPEN
  if L1_1 == L2_1 then
    L2_1 = mp
    L2_1 = L2_1.get_contextdata
    L3_1 = mp
    L3_1 = L3_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = MpCommon
    L2_1 = L2_1.QueryPersistContext
    L3_1 = L0_1
    L4_1 = "DroppedByWPADService"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = mp
    L2_1 = L2_1.enum_mpattributesubstring
    L3_1 = "PreAgent:"
    L2_1 = L2_1(L3_1)
    if L2_1 == nil then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = #L2_1
    if L3_1 == 0 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = 0
    L4_1 = 0
    L5_1 = ipairs
    L6_1 = L2_1
    L5_1, L6_1, L7_1 = L5_1(L6_1)
    for L8_1, L9_1 in L5_1, L6_1, L7_1 do
      L10_1 = string
      L10_1 = L10_1.match
      L11_1 = L9_1
      L12_1 = "PreAgent:V(%d+)V(%d+)$"
      L10_1, L11_1 = L10_1(L11_1, L12_1)
      if L10_1 ~= nil then
        L12_1 = tonumber
        L13_1 = L10_1
        L12_1 = L12_1(L13_1)
        if L3_1 < L12_1 then
          L3_1 = L12_1
        end
      end
      if L11_1 ~= nil then
        L12_1 = tonumber
        L13_1 = L11_1
        L12_1 = L12_1(L13_1)
        if L4_1 < L12_1 then
          L4_1 = L12_1
        end
      end
    end
    if L3_1 < 362514 or 362529 < L3_1 or L4_1 < 362514 or 377514 < L4_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L3_1 = L3_1 - 362514
    L4_1 = L4_1 - 362514
    if L3_1 <= 1 and L4_1 <= 100 then
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
