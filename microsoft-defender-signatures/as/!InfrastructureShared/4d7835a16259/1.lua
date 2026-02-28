local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.GetHSTRCallerId
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.HSTR_CALLER_SMS
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.GetSMSProcArchitecture
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.SMS_PROC_ARCH_X64
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.GetSMSMemRanges
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.hstr_full_log
L1_1 = L1_1()
L2_1 = 0
L3_1 = ipairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = L7_1.matched
  if L8_1 then
    L8_1 = isSafeToRead
    L9_1 = L0_1
    L10_1 = L7_1.VA
    L11_1 = 4
    L8_1 = L8_1(L9_1, L10_1, L11_1)
    if L8_1 then
      L8_1 = mp
      L8_1 = L8_1.ReadProcMem
      L9_1 = L7_1.VA
      L10_1 = 4
      L8_1 = L8_1(L9_1, L10_1)
      L9_1 = mp
      L9_1 = L9_1.readu_u32
      L10_1 = L8_1
      L11_1 = 1
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 == 8 then
        L9_1 = L7_1.VA
        L2_1 = L9_1 + 1
        break
      end
    end
  end
end
if L2_1 == 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = pcallEx
L4_1 = "maceExtract_CobaltStrike"
L5_1 = maceExtract_CobaltStrike
L6_1 = L2_1
L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 then
  L5_1 = #L4_1
  if not (L5_1 < 3000) then
    goto lbl_77
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_77::
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
