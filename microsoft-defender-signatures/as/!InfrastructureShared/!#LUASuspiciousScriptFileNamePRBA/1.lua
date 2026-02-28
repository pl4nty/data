local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 <= 5) then
    goto lbl_22
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_22::
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "complaintcopy_%d%d%d%d%d%(feb01%)1%.one"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = " on 01feb %- copy%.one"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "agreementcancelation_%d%d%d%d%d%d%(feb08%)%.one"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == nil then
      goto lbl_46
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_46::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
