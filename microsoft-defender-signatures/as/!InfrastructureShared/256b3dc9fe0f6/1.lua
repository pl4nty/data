local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = pcall
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L0_1, L1_1 = L0_1(L1_1)
if L0_1 then
  L2_1 = isnull
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = isnull
    L3_1 = L1_1.ppid
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      goto lbl_20
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_20::
L2_1 = L1_1.ppid
L3_1 = "AmsiOpenSession"
L4_1 = pcall
L5_1 = bm
L5_1 = L5_1.GetProcAddress
L6_1 = L2_1
L7_1 = "amsi.dll"
L8_1 = L3_1
L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L6_1 = isnull
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  if not L6_1 then
    goto lbl_39
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_39::
L6_1 = pcall
L7_1 = bm
L7_1 = L7_1.ReadProcMem
L8_1 = L5_1
L9_1 = 64000
L10_1 = L2_1
L6_1, L7_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 then
  L8_1 = isnull
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  if not L8_1 then
    goto lbl_56
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_56::
if 4294967295 < L5_1 then
  L8_1 = mp
  L8_1 = L8_1.SMS_PROC_ARCH_X64
  if L8_1 then
    goto lbl_64
  end
end
L8_1 = mp
L8_1 = L8_1.SMS_PROC_ARCH_X32
::lbl_64::
L9_1 = pcall
L10_1 = mp
L10_1 = L10_1.x86dasm
L11_1 = L8_1
L12_1 = L5_1
L13_1 = L7_1
L14_1 = 64000
L15_1 = 100
L16_1 = L5_1
L17_1 = mp
L17_1 = L17_1.DASM_LINEAR_FLOW
L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
if L9_1 then
  L11_1 = isnull
  L12_1 = L10_1
  L11_1 = L11_1(L12_1)
  if not L11_1 then
    goto lbl_86
  end
end
L11_1 = mp
L11_1 = L11_1.CLEAN
do return L11_1 end
::lbl_86::
L11_1 = pairs
L12_1 = L10_1
L11_1, L12_1, L13_1 = L11_1(L12_1)
for L14_1, L15_1 in L11_1, L12_1, L13_1 do
  L16_1 = L15_1.opcode
  if L16_1 == 235 then
    if L14_1 < 15 then
      L16_1 = mp
      L16_1 = L16_1.INFECTED
      return L16_1
    end
    break
  else
    L16_1 = L15_1.jtype
    if L16_1 ~= 0 then
      break
    end
  end
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
