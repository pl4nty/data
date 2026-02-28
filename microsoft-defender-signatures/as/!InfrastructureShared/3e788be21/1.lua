local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 == 3 then
  L0_1 = pesecs
  L0_1 = L0_1[1]
  L0_1 = L0_1.SizeOfRawData
  if 151552 < L0_1 then
    L0_1 = pehdr
    L0_1 = L0_1.DataDirectory
    L0_1 = L0_1[2]
    L0_1 = L0_1.Size
    if 74 < L0_1 then
      L0_1 = pehdr
      L0_1 = L0_1.DataDirectory
      L0_1 = L0_1[2]
      L0_1 = L0_1.Size
      if L0_1 < 90 then
        L0_1 = peattributes
        L0_1 = L0_1.isexe
        if L0_1 then
          L0_1 = hstrlog
          L0_1 = L0_1[1]
          L0_1 = L0_1.matched
          if L0_1 then
            L0_1 = mp
            L0_1 = L0_1.set_mpattribute
            L1_1 = "LowFi:Kurei_PNG"
            L0_1(L1_1)
            L0_1 = mp
            L0_1 = L0_1.readprotection
            L1_1 = false
            L0_1(L1_1)
            L0_1 = pe
            L0_1 = L0_1.foffset_va
            L1_1 = hstrlog
            L1_1 = L1_1[1]
            L1_1 = L1_1.VA
            L0_1 = L0_1(L1_1)
            L1_1 = {}
            L2_1 = 3058425074
            L3_1 = 8654206
            L1_1[1] = L2_1
            L1_1[2] = L3_1
            L2_1 = mp
            L2_1 = L2_1.readfile
            L3_1 = L0_1 + 2000
            L4_1 = 1168
            L2_1 = L2_1(L3_1, L4_1)
            L3_1 = mp
            L3_1 = L3_1.crc32
            L4_1 = -1
            L5_1 = L2_1
            L6_1 = 1
            L7_1 = 0
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            L4_1 = L1_1[1]
            if L3_1 == L4_1 then
              L4_1 = mp
              L4_1 = L4_1.readfile
              L5_1 = L0_1 + 61440
              L6_1 = 1168
              L4_1 = L4_1(L5_1, L6_1)
              L2_1 = L4_1
              L4_1 = mp
              L4_1 = L4_1.crc32
              L5_1 = -1
              L6_1 = L2_1
              L7_1 = 1
              L8_1 = 0
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              L3_1 = L4_1
              L4_1 = L1_1[2]
              if L3_1 == L4_1 then
                L4_1 = mp
                L4_1 = L4_1.INFECTED
                return L4_1
              end
              L4_1 = mp
              L4_1 = L4_1.LOWFI
              return L4_1
            end
            L4_1 = mp
            L4_1 = L4_1.LOWFI
            return L4_1
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
