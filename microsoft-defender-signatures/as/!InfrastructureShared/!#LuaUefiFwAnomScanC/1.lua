local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 5242880 < L0_1 or L0_1 < 3072 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.enum_mpattributesubstring
L2_1 = "CMN:HSTR:UefiUtils"
L1_1 = L1_1(L2_1)
L2_1 = #L1_1
if 0 < L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = 0
L3_1 = false
L4_1 = false
L5_1 = pehdr
L5_1 = L5_1.NumberOfSections
if L5_1 <= 0 or 10 <= L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = 1
L7_1 = L5_1
L8_1 = 1
for L9_1 = L6_1, L7_1, L8_1 do
  L10_1 = tostring
  L11_1 = pesecs
  L11_1 = L11_1[L9_1]
  L11_1 = L11_1.Name
  L10_1 = L10_1(L11_1)
  if L10_1 == nil then
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    return L11_1
  end
  L11_1 = pesecs
  L11_1 = L11_1[L9_1]
  L11_1 = L11_1.Characteristics
  if L11_1 == nil then
    L12_1 = mp
    L12_1 = L12_1.CLEAN
    return L12_1
  end
  if L10_1 == "" then
    L12_1 = mp
    L12_1 = L12_1.bitand
    L13_1 = L11_1
    L14_1 = 1610612768
    L12_1 = L12_1(L13_1, L14_1)
    if L12_1 == 1610612768 then
      L2_1 = L2_1 + 1
      L3_1 = true
  end
  elseif L10_1 == ".text" or L10_1 == ".data" or L10_1 == ".edata" or L10_1 == ".rdata" or L10_1 == ".idata" or L10_1 == ".reloc" or L10_1 == ".xdata" or L10_1 == ".pdata" or L10_1 == ".bss" or L10_1 == ".rsrc" then
    L4_1 = true
  end
end
if L3_1 == true then
  if L2_1 == 1 and L4_1 then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:UefiFwBlankSection"
    L6_1(L7_1)
  else
    L6_1 = pehdr
    L6_1 = L6_1.NumberOfSections
    if L2_1 < L6_1 and L4_1 then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:UefiFwMultiBlankSection"
      L6_1(L7_1)
    else
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:UefiFwAnomSectionNames"
      L6_1(L7_1)
    end
  end
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
