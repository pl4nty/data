local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 == 6 then
  L0_1 = pesecs
  L0_1 = L0_1[6]
  L0_1 = L0_1.Name
  if L0_1 == ".rsrc" then
    L0_1 = pesecs
    L0_1 = L0_1[6]
    L0_1 = L0_1.VirtualSize
    if 199968 <= L0_1 then
      L0_1 = pesecs
      L0_1 = L0_1[6]
      L0_1 = L0_1.VirtualSize
      if L0_1 <= 200144 then
        L0_1 = mp
        L0_1 = L0_1.INFECTED
        return L0_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.SUSPICIOUS
return L0_1
