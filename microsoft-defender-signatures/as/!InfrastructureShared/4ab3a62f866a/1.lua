local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = "remote_file_created_taint"
L1_1 = nil
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L2_1 = L3_1.utf8p2
end
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L1_1 = L3_1.utf8p1
end
if not L1_1 or not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = false
L4_1 = mp
L4_1 = L4_1.GetExecutablesFromCommandLine
L5_1 = L2_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L5_1 = ipairs
  L6_1 = L4_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = sysio
    L10_1 = L10_1.IsFileExists
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    if L10_1 then
      L10_1 = isTainted
      L11_1 = L9_1
      L12_1 = L0_1
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 then
        L3_1 = true
        break
      end
    end
  end
end
if L3_1 then
  L5_1 = mp
  L5_1 = L5_1.TriggerScanResource
  L6_1 = "file"
  L7_1 = L1_1
  L5_1(L6_1, L7_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
