local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L1_1 = {}
  L1_1[".doc"] = ""
  L1_1[".docm"] = ""
  L1_1[".dotm"] = ""
  L1_1[".dot"] = ""
  L1_1[".xls"] = ""
  L1_1[".xlsm"] = ""
  L1_1[".ppt"] = ""
  L1_1[".pptm"] = ""
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L3_1 = mp
  L3_1 = L3_1.bitor
  L4_1 = mp
  L4_1 = L4_1.FILEPATH_QUERY_CNAME
  L5_1 = mp
  L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
  L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L3_1 = L2_1
  L2_1 = L2_1.sub
  L4_1 = -5
  L2_1 = L2_1(L3_1, L4_1)
  L4_1 = L2_1
  L3_1 = L2_1.sub
  L5_1 = -4
  L3_1 = L3_1(L4_1, L5_1)
  L4_1 = L1_1[L3_1]
  if L4_1 == nil then
    L4_1 = L1_1[L2_1]
    if L4_1 == nil then
      goto lbl_44
    end
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
::lbl_44::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
