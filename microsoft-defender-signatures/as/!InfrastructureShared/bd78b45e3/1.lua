local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.isdll
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.hasexports
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.HSTR_WEIGHT
    if L0_1 == 16 then
      L0_1 = mp
      L0_1 = L0_1.SUSPICIOUS
      return L0_1
    end
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
