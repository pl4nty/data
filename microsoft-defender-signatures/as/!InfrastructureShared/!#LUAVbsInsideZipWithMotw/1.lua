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
          goto lbl_79
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
  L3_1 = -4
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == ".vbs" or L1_1 == ".vbe" then
    L2_1 = mp
    L2_1 = L2_1.UfsGetMetadataBool
    L3_1 = "Lua:ZipWithMotwAll"
    L4_1 = true
    L2_1, L3_1 = L2_1(L3_1, L4_1)
    if L2_1 ~= 0 or not L3_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
::lbl_79::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
