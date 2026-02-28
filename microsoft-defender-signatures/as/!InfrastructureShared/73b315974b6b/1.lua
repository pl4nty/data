local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L0_1 = L1_1.utf8p2
  end
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = get_filepaths_from_string
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = "rundll32.exe"
L3_1 = false
L4_1 = ipairs
L5_1 = L1_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = string
  L9_1 = L9_1.sub
  L10_1 = L8_1
  L11_1 = #L2_1
  L11_1 = -L11_1
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 ~= L2_1 then
    L9_1 = sysio
    L9_1 = L9_1.IsFileExists
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if L9_1 then
      L9_1 = checkFileLastWriteTime
      L10_1 = L8_1
      L11_1 = 600
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 == false then
        L9_1 = mp
        L9_1 = L9_1.IsKnownFriendlyFile
        L10_1 = L8_1
        L11_1 = true
        L12_1 = false
        L9_1 = L9_1(L10_1, L11_1, L12_1)
        if L9_1 == false then
          L9_1 = bm
          L9_1 = L9_1.add_related_file
          L10_1 = L8_1
          L9_1(L10_1)
          L3_1 = true
        end
      end
    end
  end
end
if L3_1 == true then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
