local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.utf8p2
    if L0_1 then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[3]
      L0_1 = L0_1.utf8p2
      L1_1 = bm
      L1_1 = L1_1.get_process_relationships
      L1_1, L2_1 = L1_1()
      L3_1 = ipairs
      L4_1 = L2_1
      L3_1, L4_1, L5_1 = L3_1(L4_1)
      for L6_1, L7_1 in L3_1, L4_1, L5_1 do
        L8_1 = mp
        L8_1 = L8_1.bitand
        L9_1 = L7_1.reason_ex
        L10_1 = 1
        L8_1 = L8_1(L9_1, L10_1)
        L9_1 = L7_1.image_path
        if L9_1 ~= nil then
          L9_1 = L7_1.ppid
          if L9_1 ~= nil then
            L9_1 = MpCommon
            L9_1 = L9_1.IsFriendlyProcess
            L10_1 = L7_1.ppid
            L9_1 = L9_1(L10_1)
            if not L9_1 and L8_1 == 1 then
              L9_1 = bm
              L9_1 = L9_1.trigger_sig
              L10_1 = "Behavior:Win32/DCOM.MMC20Application!mmc"
              L11_1 = L0_1
              L12_1 = L7_1.ppid
              L9_1(L10_1, L11_1, L12_1)
            end
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
