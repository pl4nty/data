local L0_1, L1_1
L0_1 = pesecs
L0_1 = L0_1[2]
L0_1 = L0_1.Name
if L0_1 == ".text1" then
  L0_1 = pesecs
  L0_1 = L0_1[5]
  L0_1 = L0_1.VirtualSize
  if 65536 < L0_1 then
    L0_1 = mp
    L0_1 = L0_1.SUSPICIOUS
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
