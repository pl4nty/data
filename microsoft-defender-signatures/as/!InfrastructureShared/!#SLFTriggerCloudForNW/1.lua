local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.get_parent_filehandle
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.is_handle_nil
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_SCANREASON
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.SCANREASON_TRUSTCHECK
  if L1_1 == L2_1 then
    goto lbl_27
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_27::
L2_1 = mp
L2_1 = L2_1.IsTrustedFile
L3_1 = false
L2_1 = L2_1(L3_1)
if L2_1 == false then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
