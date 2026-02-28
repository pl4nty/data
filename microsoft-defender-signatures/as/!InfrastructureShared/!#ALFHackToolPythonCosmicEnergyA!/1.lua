local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "SCPT:CosmicEnergyAPy"
L0_1 = L0_1(L1_1)
L0_1 = #L0_1
if not (3 <= L0_1) then
  L0_1 = mp
  L0_1 = L0_1.enum_mpattributesubstring
  L1_1 = "SCPT:CosmicEnergyBPy"
  L0_1 = L0_1(L1_1)
  L0_1 = #L0_1
  if not (1 <= L0_1) then
    goto lbl_18
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_18::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
