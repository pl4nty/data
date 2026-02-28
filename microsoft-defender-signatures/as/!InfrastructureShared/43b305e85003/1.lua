local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pcallEx
L1_1 = "maceSendConfig"
L2_1 = maceSendConfig
L3_1 = "mace_qakbot"
L0_1(L1_1, L2_1, L3_1)
L0_1 = pcallEx
L1_1 = "reportRelatedBmHits"
L2_1 = reportRelatedBmHits
L0_1(L1_1, L2_1)

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = pcall
  L1_2 = bm
  L1_2 = L1_2.get_current_process_startup_info
  L0_2, L1_2 = L0_2(L1_2)
  if not L0_2 then
    L2_2 = mp
    L2_2 = L2_2.INFECTED
    return L2_2
  end
  L2_2 = "SuspDllExplorerInject.A_CmdLineDll"
  L3_2 = MpCommon
  L3_2 = L3_2.GetPersistContextCountNoPath
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if 0 < L3_2 then
    L3_2 = MpCommon
    L3_2 = L3_2.GetPersistContextNoPath
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L4_2 = ipairs
    L5_2 = L3_2
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    for L7_2, L8_2 in L4_2, L5_2, L6_2 do
      L9_2 = string
      L9_2 = L9_2.match
      L10_2 = L8_2
      L11_2 = "([%w%p]+);([%w%p]+)"
      L9_2, L10_2 = L9_2(L10_2, L11_2)
      L11_2 = string
      L11_2 = L11_2.lower
      L12_2 = L10_2
      L11_2 = L11_2(L12_2)
      L10_2 = L11_2
      L11_2 = L1_2.ppid
      if L9_2 == L11_2 then
        L11_2 = string
        L11_2 = L11_2.find
        L12_2 = L10_2
        L13_2 = "\\appdata\\"
        L14_2 = 1
        L15_2 = true
        L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
        if L11_2 then
          L11_2 = bm
          L11_2 = L11_2.add_threat_file
          L12_2 = L10_2
          L11_2(L12_2)
          break
        end
      end
    end
  end
end

L1_1 = pcallEx
L2_1 = "remediateDll"
L3_1 = L0_1
L1_1(L2_1, L3_1)
L1_1 = reportPcallEx
L1_1()
L1_1 = pcall
L2_1 = reportBmInfo
L1_1, L2_1 = L1_1(L2_1)
if not L1_1 and L2_1 then
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "bmInfoFailReason"
  L5_1 = tostring
  L6_1 = L2_1
  L5_1 = L5_1(L6_1)
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
