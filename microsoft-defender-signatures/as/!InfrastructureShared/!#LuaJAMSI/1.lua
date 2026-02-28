local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpIsJScriptEncodeAMSIScan"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "MpIsVBScriptEncodeAMSIScan"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "MpIsVBScriptAMSIScan"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattribute
      L1_1 = "MpIsJScriptAMSIScan"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        goto lbl_28
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_28::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
