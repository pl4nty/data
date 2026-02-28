local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
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
L10_1 = 1
L11_1 = elfhdr
L11_1 = L11_1.shnum
L12_1 = 1
for L13_1 = L10_1, L11_1, L12_1 do
  L14_1 = esec
  L14_1 = L14_1[L13_1]
  L15_1 = L14_1.type
  if L15_1 ~= L0_1 then
    L15_1 = L14_1.type
    if L15_1 ~= L1_1 then
      L15_1 = L14_1.offset
      if not (L15_1 < 0) then
        L15_1 = L14_1.size
        if not (L15_1 < 0) then
          L15_1 = L14_1.offset
          if not (L9_1 < L15_1) then
            L15_1 = L14_1.size
            if not (L9_1 < L15_1) then
              L15_1 = L14_1.offset
              L16_1 = L14_1.size
              L15_1 = L15_1 + L16_1
              if not (L9_1 < L15_1) then
                goto lbl_72
              end
            end
          end
        end
      end
      L15_1 = mp
      L15_1 = L15_1.INFECTED
      return L15_1
    end
  end
  ::lbl_72::
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
