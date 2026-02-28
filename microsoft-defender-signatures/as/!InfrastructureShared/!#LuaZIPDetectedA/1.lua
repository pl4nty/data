local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "MpContentDetected"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.enum_mpattributesubstring
  L1_1 = "Detection:"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.enum_mpattributesubstring
    L1_1 = "MpContainerContentDetected"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      goto lbl_26
    end
  end
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "Lua:FileHasDetection"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_26::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
