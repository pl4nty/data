local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
  end
end
L1_1 = #L0_1
if L1_1 < 62 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = contains
L2_1 = L0_1
L3_1 = {}
L4_1 = "powershell"
L5_1 = " mshta"
L6_1 = " bitsadmin"
L7_1 = "curl"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = bm
  L1_1 = L1_1.add_related_string
  L2_1 = "typedpath"
  L3_1 = tostring
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  L4_1 = bm
  L4_1 = L4_1.RelatedStringBMReport
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = add_parents
  L1_1()
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
    L10_1 = bm
    L10_1 = L10_1.RELATIONSHIP_CREATED
    L8_1 = L8_1(L9_1, L10_1)
    L9_1 = L7_1.image_path
    L10_1 = L7_1.ppid
    if L9_1 and L10_1 then
      L11_1 = bm
      L11_1 = L11_1.RELATIONSHIP_CREATED
      if L8_1 == L11_1 then
        L11_1 = contains
        L12_1 = L9_1
        L13_1 = {}
        L14_1 = "powershell.exe"
        L15_1 = "mshta.exe"
        L16_1 = "bitsadmin.exe"
        L17_1 = "curl.exe"
        L18_1 = "cmd.exe"
        L13_1[1] = L14_1
        L13_1[2] = L15_1
        L13_1[3] = L16_1
        L13_1[4] = L17_1
        L13_1[5] = L18_1
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 then
          L11_1 = bm
          L11_1 = L11_1.trigger_sig
          L12_1 = "StartedViatypedpaths"
          L13_1 = "StartedViatypedpaths"
          L14_1 = L7_1.ppid
          L11_1(L12_1, L13_1, L14_1)
        end
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
