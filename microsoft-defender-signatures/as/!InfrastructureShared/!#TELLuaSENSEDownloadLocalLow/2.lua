local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.GetScanSource
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.SCANSOURCE_SENSE
if L0_1 == L1_1 then
  L0_1 = string
  L0_1 = L0_1.lower
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_FILEPATH
  L1_1, L2_1, L3_1 = L1_1(L2_1)
  L0_1 = L0_1(L1_1, L2_1, L3_1)
  L2_1 = L0_1
  L1_1 = L0_1.sub
  L3_1 = -8
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= "locallow" then
    L2_1 = L0_1
    L1_1 = L0_1.sub
    L3_1 = -9
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 ~= "downloads" then
      goto lbl_29
    end
  end
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
::lbl_29::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
