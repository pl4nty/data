local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = L0_1.ppid
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = {}
L2_1 = "NtQueryInformationProcess"
L3_1 = "NtQuerySystemInformation"
L1_1[1] = L2_1
L1_1[2] = L3_1
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = isnull
  L8_1 = bm
  L8_1 = L8_1.GetProcAddress
  L9_1 = L0_1.ppid
  L10_1 = "ntdll.dll"
  L11_1 = L6_1
  L8_1, L9_1, L10_1, L11_1 = L8_1(L9_1, L10_1, L11_1)
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if L7_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
