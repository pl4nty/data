local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "RPF:CarberpVncDLL"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[5]
  L0_1 = L0_1.matched
  if not L0_1 then
    goto lbl_19
  end
end
L0_1 = mp
L0_1 = L0_1.changedetectionname
L1_1 = 805306413
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_19::
L0_1 = mp
L0_1 = L0_1.SUSPICIOUS
return L0_1
