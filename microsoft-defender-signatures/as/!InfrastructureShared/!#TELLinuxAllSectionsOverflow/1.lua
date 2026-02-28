local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = 8
L1_1 = 0
L2_1 = 1
L3_1 = 3
L4_1 = 62
L5_1 = 40
L6_1 = 183
L7_1 = elfhdr
L7_1 = L7_1.ident
L8_1 = string
L8_1 = L8_1.byte
L9_1 = L7_1
L10_1 = 6
L8_1 = L8_1(L9_1, L10_1)
if L8_1 == L2_1 then
  L9_1 = elfhdr
  L9_1 = L9_1.machine
  if L9_1 == L3_1 then
    goto lbl_36
  end
  L9_1 = elfhdr
  L9_1 = L9_1.machine
  if L9_1 == L4_1 then
    goto lbl_36
  end
  L9_1 = elfhdr
  L9_1 = L9_1.machine
  if L9_1 == L5_1 then
    goto lbl_36
  end
  L9_1 = elfhdr
  L9_1 = L9_1.machine
  if L9_1 == L6_1 then
    goto lbl_36
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_36::
L9_1 = mp
L9_1 = L9_1.getfilesize
L9_1 = L9_1()
L10_1 = false
L11_1 = false
L12_1 = 1
L13_1 = elfhdr
L13_1 = L13_1.shnum
L14_1 = 1
for L15_1 = L12_1, L13_1, L14_1 do
  L16_1 = esec
  L16_1 = L16_1[L15_1]
  L17_1 = L16_1.type
  if L17_1 ~= L0_1 then
    L17_1 = L16_1.type
    if L17_1 ~= L1_1 then
      L11_1 = true
      L17_1 = L16_1.offset
      if 0 <= L17_1 then
        L17_1 = L16_1.offset
        if L9_1 > L17_1 then
          L17_1 = L16_1.size
          if 0 <= L17_1 then
            L17_1 = L16_1.size
            if L9_1 >= L17_1 then
              L17_1 = L16_1.offset
              L18_1 = L16_1.size
              L17_1 = L17_1 + L18_1
              if L9_1 >= L17_1 then
                L10_1 = true
                break
              end
            end
          end
        end
      end
    end
  end
end
if not L11_1 then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
if not L10_1 then
  L12_1 = mp
  L12_1 = L12_1.INFECTED
  return L12_1
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
