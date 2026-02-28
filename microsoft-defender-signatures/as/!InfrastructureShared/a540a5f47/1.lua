local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_detectionstatus
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.INFECTED
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "SIGATTR:COPY_BELOW_WIN"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    goto lbl_17
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_17::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
