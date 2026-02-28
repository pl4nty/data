local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "\\svchost.exe"
  L4_1 = -12
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = isTamperProtectionOn
L1_1 = L1_1()
if L1_1 then
  L1_1 = bm
  L1_1 = L1_1.get_process_relationships
  L1_1, L2_1 = L1_1()
  if L1_1 then
    L3_1 = ipairs
    L4_1 = L1_1
    L3_1, L4_1, L5_1 = L3_1(L4_1)
    for L6_1, L7_1 in L3_1, L4_1, L5_1 do
      L8_1 = L7_1.ppid
      if L8_1 then
        L8_1 = mp
        L8_1 = L8_1.bitand
        L9_1 = L7_1.reason_ex
        L10_1 = 1
        L8_1 = L8_1(L9_1, L10_1)
        if L8_1 == 1 then
          L8_1 = bm
          L8_1 = L8_1.add_related_process
          L9_1 = L7_1.ppid
          L8_1(L9_1)
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
