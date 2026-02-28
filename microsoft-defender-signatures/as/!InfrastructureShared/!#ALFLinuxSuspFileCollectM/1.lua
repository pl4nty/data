local L0_1, L1_1, L2_1, L3_1
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
if L0_1 ~= nil and L0_1 ~= "" then
  L2_1 = L0_1
  L1_1 = L0_1.lower
  L1_1 = L1_1(L2_1)
  if L1_1 == "9d61afa0-cfa4-4746-95af-dc897a6f6774" then
    goto lbl_19
  end
  L2_1 = L0_1
  L1_1 = L0_1.lower
  L1_1 = L1_1(L2_1)
  if L1_1 == "73a99e52-c380-4b86-9d47-fe1cb231f222" then
    goto lbl_19
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_SCANREASON
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L1_1 == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L2_1 = L2_1(L3_1)
  if L2_1 == true then
    L2_1 = mp
    L2_1 = L2_1.getfilename
    L3_1 = mp
    L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
    L2_1 = L2_1(L3_1)
    if L2_1 ~= nil then
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
