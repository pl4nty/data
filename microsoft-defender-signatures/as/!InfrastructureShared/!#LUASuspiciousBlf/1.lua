local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 9264 or 65536 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = false
L2_1 = true
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = false
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = 9256
L5_1 = 8
L3_1 = L3_1(L4_1, L5_1)
L4_1 = string
L4_1 = L4_1.byte
L5_1 = L3_1
L6_1 = 1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == 0 then
  L4_1 = string
  L4_1 = L4_1.byte
  L5_1 = L3_1
  L6_1 = 2
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 == 0 then
    L4_1 = string
    L4_1 = L4_1.byte
    L5_1 = L3_1
    L6_1 = 3
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 == 0 then
      L4_1 = string
      L4_1 = L4_1.byte
      L5_1 = L3_1
      L6_1 = 4
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 == 0 then
        L4_1 = string
        L4_1 = L4_1.byte
        L5_1 = L3_1
        L6_1 = 5
        L4_1 = L4_1(L5_1, L6_1)
        if L4_1 == 0 then
          L4_1 = string
          L4_1 = L4_1.byte
          L5_1 = L3_1
          L6_1 = 6
          L4_1 = L4_1(L5_1, L6_1)
          if L4_1 == 0 then
            L4_1 = string
            L4_1 = L4_1.byte
            L5_1 = L3_1
            L6_1 = 7
            L4_1 = L4_1(L5_1, L6_1)
            if L4_1 == 0 then
              L4_1 = string
              L4_1 = L4_1.byte
              L5_1 = L3_1
              L6_1 = 8
              L4_1 = L4_1(L5_1, L6_1)
              if L4_1 == 0 then
                L2_1 = false
              end
            end
          end
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = true
L4_1(L5_1)
if L1_1 or L2_1 then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "BM_SUSP_CLFS_FILE"
  L4_1(L5_1)
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
