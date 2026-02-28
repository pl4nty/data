local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = versioning
L0_1 = L0_1.GetEngineBuild
L0_1 = L0_1()
if L0_1 < 16700 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
L3_1 = isnull
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = ipairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = isnull
  L9_1 = L7_1.image_path
  L8_1 = L8_1(L9_1)
  if not L8_1 then
    L8_1 = mp
    L8_1 = L8_1.bitand
    L9_1 = L7_1.reason_ex
    L10_1 = 2
    L8_1 = L8_1(L9_1, L10_1)
    if L8_1 == 2 then
      L8_1 = string
      L8_1 = L8_1.match
      L9_1 = string
      L9_1 = L9_1.lower
      L10_1 = L7_1.image_path
      L9_1 = L9_1(L10_1)
      L10_1 = "\\([^\\]+)$"
      L8_1 = L8_1(L9_1, L10_1)
      L9_1 = isnull
      L10_1 = L8_1
      L9_1 = L9_1(L10_1)
      if L9_1 then
        L9_1 = mp
        L9_1 = L9_1.CLEAN
        return L9_1
      end
      if L8_1 == "powershell.exe" or L8_1 == "powershell_ise.exe" or L8_1 == "pwsh.exe" then
        L9_1 = mp
        L9_1 = L9_1.INFECTED
        return L9_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
