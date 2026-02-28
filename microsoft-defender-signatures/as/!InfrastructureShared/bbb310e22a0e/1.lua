local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = GetTaintLevelHR
L0_1 = L0_1()
if L0_1 ~= "Medium" and L0_1 ~= "High" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L3_1 = L1_1.matched
if not L3_1 then
  L3_1 = L2_1.matched
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = L1_1.matched
L3_1 = L1_1 or L3_1
if not L3_1 or not L1_1 then
  L3_1 = L2_1
end
L4_1 = string
L4_1 = L4_1.match
L5_1 = L3_1.utf8p2
L6_1 = "^([0-9]+);regionsize:([0-9]+)"
L4_1, L5_1 = L4_1(L5_1, L6_1)
L6_1 = isnull
L7_1 = L4_1
L6_1 = L6_1(L7_1)
if not L6_1 then
  L6_1 = isnull
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  if not L6_1 then
    goto lbl_47
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_47::
L6_1 = tonumber
L7_1 = L4_1
L6_1 = L6_1(L7_1)
L4_1 = L6_1
L6_1 = tonumber
L7_1 = L5_1
L6_1 = L6_1(L7_1)
L5_1 = L6_1
if L5_1 < 80000 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = bm
L6_1 = L6_1.VirtualQuery
L7_1 = L4_1
L6_1, L7_1 = L6_1(L7_1)
if L6_1 then
  L8_1 = L7_1.state_type
  L9_1 = mp
  L9_1 = L9_1.bitor
  L10_1 = mp
  L10_1 = L10_1.SMS_MBI_COMMIT
  L11_1 = mp
  L11_1 = L11_1.SMS_MBI_PRIVATE
  L9_1 = L9_1(L10_1, L11_1)
  if L8_1 == L9_1 then
    goto lbl_79
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_79::
L8_1 = 65536
L9_1 = L4_1 % L8_1
L9_1 = L4_1 - L9_1
L10_1 = bm
L10_1 = L10_1.ReadProcMem
L11_1 = L9_1
L12_1 = L8_1
L10_1 = L10_1(L11_1, L12_1)
if L10_1 ~= nil then
  L11_1 = mp
  L11_1 = L11_1.readu_u32
  L12_1 = L10_1
  L13_1 = 1
  L11_1 = L11_1(L12_1, L13_1)
  if L11_1 == 9460301 then
    L12_1 = mp
    L12_1 = L12_1.readu_u32
    L13_1 = L10_1
    L14_1 = 61
    L12_1 = L12_1(L13_1, L14_1)
    L13_1 = mp
    L13_1 = L13_1.readu_u32
    L14_1 = L10_1
    L15_1 = L12_1
    L13_1 = L13_1(L14_1, L15_1)
    if L13_1 ~= 4542464 then
      L13_1 = mp
      L13_1 = L13_1.CLEAN
      return L13_1
    end
    L13_1 = mp
    L13_1 = L13_1.readu_u16
    L14_1 = L10_1
    L15_1 = L12_1 + 22
    L15_1 = L15_1 + 1
    L13_1 = L13_1(L14_1, L15_1)
    L14_1 = mp
    L14_1 = L14_1.bitand
    L15_1 = L13_1
    L16_1 = 8192
    L14_1 = L14_1(L15_1, L16_1)
    L14_1 = L14_1 ~= 0
    if L14_1 then
      L15_1 = bm
      L15_1 = L15_1.get_current_process_startup_info
      L15_1 = L15_1()
      L16_1 = TriggerTargetedMemoryScan
      L17_1 = L9_1
      L16_1(L17_1)
      if L15_1 ~= nil then
        L16_1 = L15_1.ppid
        if L16_1 ~= nil then
          goto lbl_142
        end
      end
      L16_1 = mp
      L16_1 = L16_1.CLEAN
      do return L16_1 end
      ::lbl_142::
      L16_1 = TrackPidAndTechniqueBM
      L17_1 = L15_1.ppid
      L18_1 = "T1620"
      L19_1 = "reflective_dll_loaded"
      L16_1(L17_1, L18_1, L19_1)
      L16_1 = mp
      L16_1 = L16_1.INFECTED
      return L16_1
    end
  end
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
