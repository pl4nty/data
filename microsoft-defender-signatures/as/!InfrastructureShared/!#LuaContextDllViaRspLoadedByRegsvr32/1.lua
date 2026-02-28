local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
if L0_1 ~= "odbcconf.exe" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_LOWERCASE
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L3_1 = normalize_path
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L1_1 = L3_1
L3_1 = MpCommon
L3_1 = L3_1.QueryPersistContext
L4_1 = L1_1
L5_1 = "DllFromRsp"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/DllViaRspRegsvrLoad"
  L3_1(L4_1)
end
L3_1 = MpCommon
L3_1 = L3_1.GetPersistContextNoPath
L4_1 = "DllFromOdbcAction"
L3_1 = L3_1(L4_1)
L4_1 = ipairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L10_1 = L8_1
  L9_1 = L8_1.find
  L11_1 = L2_1
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if not L9_1 then
    L10_1 = L8_1
    L9_1 = L8_1.find
    L11_1 = L1_1
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if not L9_1 then
      goto lbl_70
    end
  end
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:Context/DllViaOdbcconfLoad"
  L9_1(L10_1)
  ::lbl_70::
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
