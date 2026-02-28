local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "!#SLF:PDF/Spike.B!rfn"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "!#ALF:PDF/Spike.A!rfn"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "!#ALF:PDF/Spike.B!rfn"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      goto lbl_23
    end
  end
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "PDF:ScanAllUris"
L0_1(L1_1)
::lbl_23::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
