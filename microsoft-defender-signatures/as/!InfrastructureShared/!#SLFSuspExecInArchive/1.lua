local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 < 10) then
    goto lbl_18
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_18::
L2_1 = L0_1
L1_1 = L0_1.sub
L3_1 = -4
L1_1 = L1_1(L2_1, L3_1)
L2_1 = {}
L2_1[".exe"] = true
L2_1[".scr"] = true
L2_1[".pif"] = true
L3_1 = L2_1[L1_1]
if L3_1 == true then
  L4_1 = L0_1
  L3_1 = L0_1.find
  L5_1 = ".zip->"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L4_1 = L0_1
    L3_1 = L0_1.find
    L5_1 = ".rar->"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L4_1 = L0_1
      L3_1 = L0_1.find
      L5_1 = ".7z->"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
