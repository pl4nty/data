local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.UfsGetMetadataBool
L1_1 = "Lua:FileInZip"
L2_1 = true
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 0 or not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_SCANREASON
L2_1 = L2_1(L3_1)
L3_1 = mp
L3_1 = L3_1.SCANREASON_ONOPEN
if L2_1 ~= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L2_1 ~= L3_1 then
    goto lbl_39
  end
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
L4_1, L5_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == "slack.exe" then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
::lbl_39::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
