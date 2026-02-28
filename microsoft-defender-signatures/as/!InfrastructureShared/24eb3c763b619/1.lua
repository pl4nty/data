local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 then
  L1_1 = next
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = L0_1.ppid
    if L1_1 then
      L1_1 = L0_1.ppid
      L2_1 = pcall
      L3_1 = bm
      L3_1 = L3_1.GetModAddress
      L4_1 = L1_1
      L5_1 = "clr.dll"
      L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
      if L2_1 then
        L4_1 = isnull
        L5_1 = L3_1
        L4_1 = L4_1(L5_1)
        if not L4_1 then
          goto lbl_31
        end
      end
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      do return L4_1 end
      ::lbl_31::
      L4_1 = mp
      L4_1 = L4_1.bitand
      L5_1 = mp
      L5_1 = L5_1.shr64
      L6_1 = L3_1
      L7_1 = 24
      L5_1 = L5_1(L6_1, L7_1)
      L6_1 = 16777215
      L4_1 = L4_1(L5_1, L6_1)
      L5_1 = isnull
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      if L5_1 or L4_1 == 0 then
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        return L5_1
      end
      L5_1 = bm
      L5_1 = L5_1.ReadProcMem
      L6_1 = L4_1
      L7_1 = 64000
      L8_1 = L1_1
      L5_1 = L5_1(L6_1, L7_1, L8_1)
      L6_1 = isnull
      L7_1 = L5_1
      L6_1 = L6_1(L7_1)
      if L6_1 then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L7_1 = L5_1
      L6_1 = L5_1.lower
      L6_1 = L6_1(L7_1)
      L7_1 = string
      L7_1 = L7_1.find
      L8_1 = L6_1
      L9_1 = "amsiscanbuffer"
      L10_1 = 1
      L11_1 = true
      L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
      L8_1 = isnull
      L9_1 = L7_1
      L8_1 = L8_1(L9_1)
      if L8_1 then
        L8_1 = mp
        L8_1 = L8_1.INFECTED
        return L8_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
