local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 8192 < L0_1 and L0_1 < 131072 then
  L1_1 = mp
  L1_1 = L1_1.readprotection
  L2_1 = false
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.readfile
  L2_1 = 0
  L3_1 = L0_1
  L1_1 = L1_1(L2_1, L3_1)
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "This program cannot be run in DOS mode."
  L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = mp
  L6_1 = L6_1.getfilename
  L6_1, L7_1, L8_1, L9_1, L10_1 = L6_1()
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L5_1
  L8_1 = ".fon"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 == nil then
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L5_1
    L8_1 = ".ttf"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 == nil then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L5_1
      L8_1 = ".otf"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if L6_1 == nil then
        goto lbl_63
      end
    end
  end
  L6_1 = mp
  L6_1 = L6_1.LOWFI
  return L6_1
end
::lbl_63::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
