local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.ppid
L2_1 = L1_1
L1_1 = L1_1.byte
L3_1 = 5
L4_1 = 6
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == 52 and L2_1 == 44 then
  L3_1 = L0_1.ppid
  if L3_1 ~= nil then
    L3_1 = "1bb146aa"
    L4_1 = bm
    L4_1 = L4_1.get_sig_count
    L4_1 = L4_1()
    L5_1 = MpCommon
    L5_1 = L5_1.AtomicCounterValueNamespaced
    L6_1 = "rcount_sig_count"
    L7_1 = L3_1
    L5_1 = L5_1(L6_1, L7_1)
    if not L5_1 then
      L6_1 = MpCommon
      L6_1 = L6_1.AtomicCounterSetNamespaced
      L7_1 = "rcount_sig_count"
      L8_1 = L3_1
      L9_1 = L4_1
      L10_1 = 36000
      L6_1(L7_1, L8_1, L9_1, L10_1)
    else
      L6_1 = MpCommon
      L6_1 = L6_1.AtomicCounterAddNamespaced
      L7_1 = "rcount_sig_count"
      L8_1 = L3_1
      L9_1 = 1
      L6_1(L7_1, L8_1, L9_1)
    end
    L6_1 = this_sigattrlog
    L6_1 = L6_1[2]
    L6_1 = L6_1.utf8p2
    L7_1 = this_sigattrlog
    L7_1 = L7_1[2]
    L7_1 = L7_1.utf8p1
    L8_1 = #L6_1
    L9_1 = #L7_1
    if L8_1 < L9_1 then
      L9_1 = L7_1
      L8_1 = L7_1.find
      L10_1 = L6_1
      L11_1 = 1
      L12_1 = true
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      if L8_1 == 1 then
        L9_1 = L7_1
        L8_1 = L7_1.byte
        L10_1 = #L6_1
        L10_1 = L10_1 + 1
        L8_1 = L8_1(L9_1, L10_1)
        if L8_1 ~= 58 then
          L8_1 = string
          L8_1 = L8_1.sub
          L9_1 = L7_1
          L10_1 = #L6_1
          L10_1 = L10_1 + 1
          L8_1 = L8_1(L9_1, L10_1)
          L9_1 = "app_ext_"
          L10_1 = L8_1
          L9_1 = L9_1 .. L10_1
          L10_1 = MpCommon
          L10_1 = L10_1.AtomicCounterValueNamespaced
          L11_1 = L9_1
          L12_1 = L3_1
          L10_1 = L10_1(L11_1, L12_1)
          if not L10_1 then
            L11_1 = MpCommon
            L11_1 = L11_1.AtomicCounterSetNamespaced
            L12_1 = L9_1
            L13_1 = L3_1
            L14_1 = 1
            L15_1 = 36000
            L11_1(L12_1, L13_1, L14_1, L15_1)
          else
            L11_1 = MpCommon
            L11_1 = L11_1.AtomicCounterAddNamespaced
            L12_1 = L9_1
            L13_1 = L3_1
            L14_1 = 1
            L11_1(L12_1, L13_1, L14_1)
          end
        end
      end
    end
    L8_1 = this_sigattrlog
    L8_1 = L8_1[3]
    L8_1 = L8_1.utf8p2
    L9_1 = this_sigattrlog
    L9_1 = L9_1[3]
    L9_1 = L9_1.utf8p1
    L10_1 = #L8_1
    L11_1 = #L9_1
    if L10_1 < L11_1 then
      L11_1 = L9_1
      L10_1 = L9_1.find
      L12_1 = L8_1
      L13_1 = 1
      L14_1 = true
      L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
      if L10_1 == 1 then
        L11_1 = L9_1
        L10_1 = L9_1.byte
        L12_1 = #L8_1
        L12_1 = L12_1 + 1
        L10_1 = L10_1(L11_1, L12_1)
        if L10_1 ~= 58 then
          L10_1 = string
          L10_1 = L10_1.sub
          L11_1 = L9_1
          L12_1 = #L8_1
          L12_1 = L12_1 + 1
          L10_1 = L10_1(L11_1, L12_1)
          L11_1 = "app_ext_"
          L12_1 = L10_1
          L11_1 = L11_1 .. L12_1
          L12_1 = MpCommon
          L12_1 = L12_1.AtomicCounterValueNamespaced
          L13_1 = L11_1
          L14_1 = L3_1
          L12_1 = L12_1(L13_1, L14_1)
          if not L12_1 then
            L13_1 = MpCommon
            L13_1 = L13_1.AtomicCounterSetNamespaced
            L14_1 = L11_1
            L15_1 = L3_1
            L16_1 = 1
            L17_1 = 36000
            L13_1(L14_1, L15_1, L16_1, L17_1)
          else
            L13_1 = MpCommon
            L13_1 = L13_1.AtomicCounterAddNamespaced
            L14_1 = L11_1
            L15_1 = L3_1
            L16_1 = 1
            L13_1(L14_1, L15_1, L16_1)
          end
        end
      end
    end
    L10_1 = this_sigattrlog
    L10_1 = L10_1[4]
    L10_1 = L10_1.utf8p2
    L11_1 = this_sigattrlog
    L11_1 = L11_1[4]
    L11_1 = L11_1.utf8p1
    L12_1 = #L10_1
    L13_1 = #L11_1
    if L12_1 < L13_1 then
      L13_1 = L11_1
      L12_1 = L11_1.find
      L14_1 = L10_1
      L15_1 = 1
      L16_1 = true
      L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
      if L12_1 == 1 then
        L13_1 = L11_1
        L12_1 = L11_1.byte
        L14_1 = #L10_1
        L14_1 = L14_1 + 1
        L12_1 = L12_1(L13_1, L14_1)
        if L12_1 ~= 58 then
          L12_1 = string
          L12_1 = L12_1.sub
          L13_1 = L11_1
          L14_1 = #L10_1
          L14_1 = L14_1 + 1
          L12_1 = L12_1(L13_1, L14_1)
          L13_1 = "app_ext_"
          L14_1 = L12_1
          L13_1 = L13_1 .. L14_1
          L14_1 = MpCommon
          L14_1 = L14_1.AtomicCounterValueNamespaced
          L15_1 = L13_1
          L16_1 = L3_1
          L14_1 = L14_1(L15_1, L16_1)
          if not L14_1 then
            L15_1 = MpCommon
            L15_1 = L15_1.AtomicCounterSetNamespaced
            L16_1 = L13_1
            L17_1 = L3_1
            L18_1 = 1
            L19_1 = 36000
            L15_1(L16_1, L17_1, L18_1, L19_1)
          else
            L15_1 = MpCommon
            L15_1 = L15_1.AtomicCounterAddNamespaced
            L16_1 = L13_1
            L17_1 = L3_1
            L18_1 = 1
            L15_1(L16_1, L17_1, L18_1)
          end
        end
      end
    end
  end
else
  L3_1 = bm
  L3_1 = L3_1.DisableSignature
  L3_1()
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
