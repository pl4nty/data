local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "SCPT:IoTSuiteVDL"
L0_1 = L0_1(L1_1)
L0_1 = #L0_1
if not (5 <= L0_1) then
  L0_1 = mp
  L0_1 = L0_1.enum_mpattributesubstring
  L1_1 = "SCPT:IoTSuiteFDL"
  L0_1 = L0_1(L1_1)
  L0_1 = #L0_1
  if not (7 <= L0_1) then
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
