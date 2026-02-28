local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 == 10 then
  L0_1 = pesecs
  L0_1 = L0_1[2]
  L0_1 = L0_1.Name
  if L0_1 == ".itext" then
    L0_1 = pevars
    L0_1 = L0_1.epsec
    if L0_1 == 2 then
      L0_1 = mp
      L0_1 = L0_1.INFECTED
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
