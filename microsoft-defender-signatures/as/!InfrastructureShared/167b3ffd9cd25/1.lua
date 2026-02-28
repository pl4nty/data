local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = string
    L0_1 = L0_1.match
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p2
    L2_1 = ";vmbaseaddress:(%d+)"
    L0_1 = L0_1(L1_1, L2_1)
    if L0_1 == nil then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = mp
    L1_1 = L1_1.bitand
    L2_1 = mp
    L2_1 = L2_1.shr64
    L3_1 = L0_1
    L4_1 = 24
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = 16777215
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == nil or L1_1 == 0 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p1
    L3_1 = string
    L3_1 = L3_1.match
    L4_1 = L2_1
    L5_1 = "targetprocessppid:(%d+):(%d+)"
    L3_1, L4_1 = L3_1(L4_1, L5_1)
    if not L3_1 or not L4_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = string
    L5_1 = L5_1.format
    L6_1 = "pid:%s,ProcessStart:%s"
    L7_1 = L3_1
    L8_1 = L4_1
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L6_1 = bm
    L6_1 = L6_1.get_process_relationships
    L6_1, L7_1 = L6_1()
    L8_1 = table_ipairs_filter
    L9_1 = L7_1
    L10_1 = {}
    L11_1 = "reason"
    L12_1 = bm
    L12_1 = L12_1.RELATIONSHIP_CREATED
    L13_1 = "ppid"
    L14_1 = L5_1
    L10_1[1] = L11_1
    L10_1[2] = L12_1
    L10_1[3] = L13_1
    L10_1[4] = L14_1
    L8_1 = L8_1(L9_1, L10_1)
    L7_1 = L8_1
    L8_1 = isnull
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    if L8_1 or L7_1 == 0 then
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
    L8_1 = pcall
    L9_1 = bm
    L9_1 = L9_1.GetModAddress
    L10_1 = L5_1
    L11_1 = "ntdll.dll"
    L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1)
    if L8_1 then
      L10_1 = isnull
      L11_1 = L9_1
      L10_1 = L10_1(L11_1)
      if not L10_1 then
        goto lbl_100
      end
    end
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    do return L10_1 end
    ::lbl_100::
    L10_1 = mp
    L10_1 = L10_1.bitand
    L11_1 = mp
    L11_1 = L11_1.shr64
    L12_1 = L9_1
    L13_1 = 24
    L11_1 = L11_1(L12_1, L13_1)
    L12_1 = 16777215
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 == nil or L10_1 == 0 then
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
    if L1_1 == L10_1 then
      L11_1 = bm
      L11_1 = L11_1.trigger_sig
      L12_1 = "BMGenericCodeInjector.A"
      L13_1 = "Behavior:Win32/GenCodeInjector.F"
      L14_1 = L5_1
      L11_1(L12_1, L13_1, L14_1)
      L11_1 = mp
      L11_1 = L11_1.INFECTED
      return L11_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
