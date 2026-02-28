local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 <= 5) then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "actdetails_april%(%d%d%d%d%)%.wsf"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "projectfunding_%a%d%d%d%.wsf"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "projectfunding_%a%d%d%d_apr%d%d%.wsf"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == nil then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "erc_%a%d%d%d_may3%.wsf"
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 == nil then
        goto lbl_48
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_48::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
