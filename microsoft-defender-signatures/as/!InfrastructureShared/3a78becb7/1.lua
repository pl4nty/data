local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 3 <= L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.hasexports
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.SUSPICIOUS
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 2 <= L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.hasexports
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "do_exhaustivehstr_rescan"
    L0_1(L1_1)
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
