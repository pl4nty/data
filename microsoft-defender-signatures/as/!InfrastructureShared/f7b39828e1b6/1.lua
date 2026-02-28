local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = nil
L1_1 = this_sigattrlog
L0_1 = L1_1[4]
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1.utf8p2
L3_1 = "^([0-9]+);regionsize:([0-9]+)"
L1_1, L2_1 = L1_1(L2_1, L3_1)
L3_1 = isnull
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_30
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_30::
L3_1 = tonumber
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L1_1 = L3_1
L3_1 = tonumber
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
if 5 <= L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "NtTraceEvent"
L5_1 = "EtwEventWrite"
L6_1 = "EtwEventWriteEx"
L7_1 = "EtwEventWriteTransfer"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L4_1 = nil
L5_1 = bm
L5_1 = L5_1.get_current_process_startup_info
L5_1 = L5_1()
L6_1 = pairs
L7_1 = L3_1
L6_1, L7_1, L8_1 = L6_1(L7_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  L11_1 = bm
  L11_1 = L11_1.GetProcAddress
  L12_1 = L5_1.ppid
  L13_1 = "ntdll.dll"
  L14_1 = L10_1
  L11_1 = L11_1(L12_1, L13_1, L14_1)
  L4_1 = L11_1
  if L4_1 ~= nil then
    L11_1 = bm
    L11_1 = L11_1.VirtualQuery
    L12_1 = L4_1
    L11_1, L12_1 = L11_1(L12_1)
    if L11_1 then
      L13_1 = L12_1.base_addr
      if L13_1 == L1_1 then
        L13_1 = TrackPidAndTechniqueBM
        L14_1 = L5_1.ppid
        L15_1 = "1562.006"
        L16_1 = "etw_patch_rt"
        L13_1(L14_1, L15_1, L16_1)
        L13_1 = mp
        L13_1 = L13_1.INFECTED
        return L13_1
      end
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
