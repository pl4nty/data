local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = extractAllFileNameExtensions
L2_1 = L0_1
L1_1, L2_1 = L1_1(L2_1)
if L2_1 == nil or L2_1 == 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if 1 < L2_1 then
  L3_1 = L1_1[1]
  L4_1 = "|"
  L3_1 = L3_1 .. L4_1
  L4_1 = ".doc|.docx|.docm|.xls|.xlsx|.xlsm|.ppt|.pptx|.pptm|.pdf|.xps|.jpg|.jpeg|.bmp|.png|.gif|"
  L5_1 = ".txt|.log|.exe|.dll|.ocx|.cs|.cpp|.ps1|.psm1|.rs|.go|.json|.xml|.html|.mhtml|.h|.lib|.js|.class|.jar|.dmp|"
  L6_1 = ".dit|.edb|.mdb|.reg|.pdb|.bak|"
  L8_1 = L4_1
  L7_1 = L4_1.find
  L9_1 = L3_1
  L10_1 = 1
  L11_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if not L7_1 then
    L8_1 = L5_1
    L7_1 = L5_1.find
    L9_1 = L3_1
    L10_1 = 1
    L11_1 = true
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
    if not L7_1 then
      L8_1 = L6_1
      L7_1 = L6_1.find
      L9_1 = L3_1
      L10_1 = 1
      L11_1 = true
      L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
      if not L7_1 then
        goto lbl_66
      end
    end
  end
  L7_1 = mp
  L7_1 = L7_1.GetExtensionClass
  L8_1 = L1_1[2]
  L7_1 = L7_1(L8_1)
  if L7_1 ~= 0 then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "Lua:EnableEntropyCalc"
  L8_1(L9_1)
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
::lbl_66::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
