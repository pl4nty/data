local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.is_delphi
  if L0_1 then
    L0_1 = pesecs
    L0_1 = L0_1[8]
    L0_1 = L0_1.Name
    if L0_1 == ".rsrc" then
      L0_1 = pesecs
      L0_1 = L0_1[8]
      L0_1 = L0_1.SizeOfRawData
      if 3145728 <= L0_1 then
        L0_1 = mp
        L0_1 = L0_1.SUSPICIOUS
        return L0_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
