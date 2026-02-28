local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = 8
L1_1 = 1
L2_1 = 3
L3_1 = 62
L4_1 = 40
L5_1 = 183
L6_1 = elfhdr
L6_1 = L6_1.ident
L7_1 = string
L7_1 = L7_1.byte
L8_1 = L6_1
L9_1 = 6
L7_1 = L7_1(L8_1, L9_1)
if L7_1 == L1_1 then
  L8_1 = elfhdr
  L8_1 = L8_1.machine
  if L8_1 == L2_1 then
    goto lbl_35
  end
  L8_1 = elfhdr
  L8_1 = L8_1.machine
  if L8_1 == L3_1 then
    goto lbl_35
  end
  L8_1 = elfhdr
  L8_1 = L8_1.machine
  if L8_1 == L4_1 then
    goto lbl_35
  end
  L8_1 = elfhdr
  L8_1 = L8_1.machine
  if L8_1 == L5_1 then
    goto lbl_35
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_35::
L8_1 = 1
L9_1 = elfhdr
L9_1 = L9_1.shnum
L10_1 = 1
for L11_1 = L8_1, L9_1, L10_1 do
  L12_1 = esec
  L12_1 = L12_1[L11_1]
  L13_1 = L12_1.type
  if L13_1 ~= L0_1 then
    L13_1 = L12_1.offset
    if L13_1 == 0 then
      L13_1 = L12_1.size
      if L13_1 == 0 then
        L13_1 = L12_1.flags
        if L13_1 == 0 then
          L13_1 = L12_1.addr
          if L13_1 == 0 then
            L13_1 = L12_1.link
            if L13_1 == 0 then
              L13_1 = L12_1.info
              if L13_1 == 0 then
                L13_1 = L12_1.addralign
                if L13_1 == 0 then
                  L13_1 = L12_1.entsize
                  if L13_1 == 0 then
                    goto lbl_72
                  end
                end
              end
            end
          end
        end
      end
    end
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  ::lbl_72::
end
L8_1 = mp
L8_1 = L8_1.set_mpattribute
L9_1 = "MpEnableSegmentBasedElfScanning"
L8_1(L9_1)
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
