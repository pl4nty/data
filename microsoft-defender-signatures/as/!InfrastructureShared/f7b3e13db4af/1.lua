local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = {}
L0_1["5a9342bd58c799c7ad6ee5ee4cf97cae63f9e3d4"] = true
L0_1.a738f2d8360e0243af067b2bb537c54d52bf679f = true
L0_1["2b0d8125167d52a26327884a925c7f3e9ba95475"] = true
L1_1 = versioning
L1_1 = L1_1.GetOrgID
L1_1 = L1_1()
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = scrubData
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L3_1 = L0_1[L2_1]
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[4]
L3_1 = L3_1.matched
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = nil
L4_1 = this_sigattrlog
L3_1 = L4_1[4]
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
    goto lbl_54
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_54::
L6_1 = tonumber
L7_1 = L4_1
L6_1 = L6_1(L7_1)
L4_1 = L6_1
L6_1 = tonumber
L7_1 = L5_1
L6_1 = L6_1(L7_1)
L5_1 = L6_1
if 5 <= L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = {}
L7_1 = "NtTraceEvent"
L8_1 = "EtwEventWrite"
L9_1 = "EtwEventWriteEx"
L10_1 = "EtwEventWriteTransfer"
L6_1[1] = L7_1
L6_1[2] = L8_1
L6_1[3] = L9_1
L6_1[4] = L10_1
L7_1 = nil
L8_1 = bm
L8_1 = L8_1.get_current_process_startup_info
L8_1 = L8_1()
L9_1 = pairs
L10_1 = L6_1
L9_1, L10_1, L11_1 = L9_1(L10_1)
for L12_1, L13_1 in L9_1, L10_1, L11_1 do
  L14_1 = bm
  L14_1 = L14_1.GetProcAddress
  L15_1 = L8_1.ppid
  L16_1 = "ntdll.dll"
  L17_1 = L13_1
  L14_1 = L14_1(L15_1, L16_1, L17_1)
  L7_1 = L14_1
  if L7_1 ~= nil then
    L14_1 = bm
    L14_1 = L14_1.VirtualQuery
    L15_1 = L7_1
    L14_1, L15_1 = L14_1(L15_1)
    if L14_1 then
      L16_1 = L15_1.base_addr
      if L16_1 == L4_1 then
        L16_1 = TrackPidAndTechniqueBM
        L17_1 = L8_1.ppid
        L18_1 = "1562.006"
        L19_1 = "etw_patch_rt"
        L16_1(L17_1, L18_1, L19_1)
        L16_1 = mp
        L16_1 = L16_1.INFECTED
        return L16_1
      end
    end
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
