local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = ".zip->"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = ".7z->"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L2_1 = L0_1
      L1_1 = L0_1.find
      L3_1 = ".tar.gz->"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L2_1 = L0_1
        L1_1 = L0_1.find
        L3_1 = ".rar->"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          goto lbl_74
        end
      end
    end
  end
  L2_1 = L0_1
  L1_1 = L0_1.match
  L3_1 = "%->.+/"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L2_1 = L0_1
    L1_1 = L0_1.match
    L3_1 = "%->.+\\"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      L2_1 = L0_1
      L1_1 = L0_1.match
      L3_1 = "%->.+%->"
      L1_1 = L1_1(L2_1, L3_1)
      if not L1_1 then
        goto lbl_55
      end
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  do return L1_1 end
  ::lbl_55::
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = -3
  L1_1 = L1_1(L2_1, L3_1)
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L0_1
  L4_1 = -4
  L2_1 = L2_1(L3_1, L4_1)
  if L1_1 == ".js" or L2_1 == ".jse" or L2_1 == ".wsf" then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
::lbl_74::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
