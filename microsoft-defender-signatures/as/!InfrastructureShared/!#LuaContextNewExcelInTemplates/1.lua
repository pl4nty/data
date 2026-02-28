local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_PATH
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1)
L1_1 = StringEndsWith
L2_1 = L0_1
L3_1 = "microsoft office (x86)\\templates"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = StringEndsWith
  L2_1 = L0_1
  L3_1 = "microsoft office\\templates"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L1_1 = StringEndsWith
    L2_1 = L0_1
    L3_1 = "microsoft office\\root\\templates"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      goto lbl_33
    end
  end
end
L1_1 = mp
L1_1 = L1_1.set_mpattribute
L2_1 = "Lua:Context/NewExcelInTemplates"
L1_1(L2_1)
::lbl_33::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
