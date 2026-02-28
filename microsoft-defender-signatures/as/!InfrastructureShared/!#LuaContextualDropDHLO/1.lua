local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    goto lbl_42
  end
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_NEWLYCREATEDHINT
L1_1 = L1_1(L2_1)
if L1_1 == true then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_FILENAME
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "^dhl"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 == 1 then
    L2_1 = isOutlookProcess
    L2_1 = L2_1()
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:ContextualDropDHLOutlook"
      L2_1(L3_1)
    end
  end
end
::lbl_42::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
