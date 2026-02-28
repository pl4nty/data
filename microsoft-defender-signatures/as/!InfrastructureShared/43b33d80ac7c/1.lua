local L0_1, L1_1, L2_1, L3_1
L0_1 = pcallEx
L1_1 = "maceSendConfig"
L2_1 = maceSendConfig
L3_1 = "mace_zloader"
L0_1(L1_1, L2_1, L3_1)
L0_1 = pcallEx
L1_1 = "reportRelatedBmHits"
L2_1 = reportRelatedBmHits
L0_1(L1_1, L2_1)

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = bm
  L0_2 = L0_2.get_current_process_startup_info
  L0_2 = L0_2()
  L1_2 = "DllMsiexecInject.A_CmdLineDll"
  L2_2 = MpCommon
  L2_2 = L2_2.GetPersistContextCountNoPath
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if 0 < L2_2 then
    L2_2 = MpCommon
    L2_2 = L2_2.GetPersistContextNoPath
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    L3_2 = ipairs
    L4_2 = L2_2
    L3_2, L4_2, L5_2 = L3_2(L4_2)
    for L6_2, L7_2 in L3_2, L4_2, L5_2 do
      L8_2 = string
      L8_2 = L8_2.match
      L9_2 = L7_2
      L10_2 = "([%w%p]+);([%w%p]+)"
      L8_2, L9_2 = L8_2(L9_2, L10_2)
      L10_2 = string
      L10_2 = L10_2.lower
      L11_2 = L9_2
      L10_2 = L10_2(L11_2)
      L9_2 = L10_2
      L10_2 = L0_2.ppid
      if L8_2 == L10_2 then
        L10_2 = string
        L10_2 = L10_2.find
        L11_2 = L9_2
        L12_2 = "\\appdata\\"
        L13_2 = 1
        L14_2 = true
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
        if L10_2 then
          L10_2 = bm
          L10_2 = L10_2.add_threat_file
          L11_2 = L9_2
          L10_2(L11_2)
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
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
