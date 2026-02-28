local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "PUA:Block:2345Cn"
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = L0_1.InternalName
L2_1 = L0_1.FileDescription
if L1_1 then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  L1_1 = L3_1
else
  L1_1 = ""
end
if not L2_1 then
  L2_1 = ""
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = "haozip"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "PUA:Block:HaoZip"
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
if L2_1 and L1_1 == "" then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "2345\229\165\189\229\142\139 v"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "2345}Y\139S v"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      goto lbl_77
    end
  end
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "PUA:Block:HaoZip"
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
::lbl_77::
if L2_1 and L1_1 == "" then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "2345\229\138\160\233\128\159\230\181\143\232\167\136\229\153\168 v"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "PUA:Block:2345Browser"
    L3_1(L4_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = "PUA:Block:2345Cn"
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
