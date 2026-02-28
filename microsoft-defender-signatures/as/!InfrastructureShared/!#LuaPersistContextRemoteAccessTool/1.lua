local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 <= 3) then
    goto lbl_14
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_14::
L1_1 = MpCommon
L1_1 = L1_1.QueryPersistContext
L2_1 = L0_1
L3_1 = "RemoteAccessTool"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = MpCommon
  L1_1 = L1_1.AppendPersistContext
  L2_1 = L0_1
  L3_1 = "RemoteAccessTool"
  L4_1 = 0
  L1_1(L2_1, L3_1, L4_1)
end
L1_1 = MpCommon
L1_1 = L1_1.QueryPersistContext
L2_1 = L0_1
L3_1 = "T1219"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = MpCommon
  L1_1 = L1_1.AppendPersistContext
  L2_1 = L0_1
  L3_1 = "T1219"
  L4_1 = 0
  L1_1(L2_1, L3_1, L4_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
