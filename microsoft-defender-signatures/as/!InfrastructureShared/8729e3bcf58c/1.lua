local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "LUA:FileSizeLE2000.A"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "MpIsPowerShellAMSIScan"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "Nscript:Type_ps"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattribute
      L1_1 = "AGGR:ScrFileExt.A"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        goto lbl_28
      end
    end
  end
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
::lbl_28::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
