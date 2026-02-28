local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.packed
  if L0_1 then
    L0_1 = pehdr
    L0_1 = L0_1.NumberOfSections
    if 7 < L0_1 then
      L0_1 = mp
      L0_1 = L0_1.HSTR_WEIGHT
      if L0_1 == 3 then
        L0_1 = mp
        L0_1 = L0_1.get_mpattribute
        L1_1 = "FOP:Win32/Crybot"
        L0_1 = L0_1(L1_1)
        if L0_1 then
          L0_1 = mp
          L0_1 = L0_1.INFECTED
          return L0_1
        end
        L0_1 = mp
        L0_1 = L0_1.SUSPICIOUS
        return L0_1
      end
      L0_1 = mp
      L0_1 = L0_1.INFECTED
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
