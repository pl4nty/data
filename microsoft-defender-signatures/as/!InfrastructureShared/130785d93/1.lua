local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.isdll
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.hasexports
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "attrmatch_rescan_notiexplore"
    L0_1(L1_1)
    L0_1 = mp
    L0_1 = L0_1.HSTR_WEIGHT
    if 5 <= L0_1 then
      L0_1 = mp
      L0_1 = L0_1.INFECTED
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
