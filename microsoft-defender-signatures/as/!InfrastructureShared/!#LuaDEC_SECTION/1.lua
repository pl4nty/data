local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = 1
L1_1 = elfhdr
L1_1 = L1_1.shnum
L2_1 = 1
for L3_1 = L0_1, L1_1, L2_1 do
  L4_1 = esec
  L4_1 = L4_1[L3_1]
  L5_1 = elf
  L5_1 = L5_1.GetSectionName
  L6_1 = L4_1.name
  L5_1 = L5_1(L6_1)
  if L5_1 ~= ".dec" then
    L6_1 = string
    L6_1 = L6_1.sub
    L7_1 = L5_1
    L8_1 = 1
    L9_1 = 5
    L6_1 = L6_1(L7_1, L8_1, L9_1)
    if L6_1 ~= ".dec\000" and L5_1 ~= ".decryption" then
      L6_1 = string
      L6_1 = L6_1.sub
      L7_1 = L5_1
      L8_1 = 1
      L9_1 = 12
      L6_1 = L6_1(L7_1, L8_1, L9_1)
      if L6_1 ~= ".decryption\000" then
        goto lbl_35
      end
    end
  end
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  do return L6_1 end
  ::lbl_35::
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
