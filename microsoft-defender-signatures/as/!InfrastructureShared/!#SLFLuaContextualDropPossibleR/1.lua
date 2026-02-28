local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.isdriver
  if not L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.no_security
    if L0_1 ~= false then
      L0_1 = peattributes
      L0_1 = L0_1.no_fixups
      if L0_1 ~= false then
        goto lbl_42
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_42::
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
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "\\public$"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "\\microsoft\\systemcertificates\\my\\certificates$"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    goto lbl_65
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_65::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
