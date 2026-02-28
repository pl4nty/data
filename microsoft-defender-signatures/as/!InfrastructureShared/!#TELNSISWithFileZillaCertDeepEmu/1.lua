local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
if not (L1_1 < 4) then
  L1_1 = pesecs
  L1_1 = L1_1[4]
  L1_1 = L1_1.Name
  if L1_1 == ".ndata" then
    goto lbl_21
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_21::
L1_1 = L0_1.FileDescription
L2_1 = L0_1.CompanyName
if L1_1 and L2_1 then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  L1_1 = L3_1
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "tim kosse"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L1_1
    L5_1 = "filezilla ftp client"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 then
      L3_1 = pe
      L3_1 = L3_1.set_peattribute
      L4_1 = "deep_analysis"
      L5_1 = true
      L3_1(L4_1, L5_1)
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
