local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.AddressOfEntryPoint
if L0_1 == 4096 then
  L0_1 = epcode
  L0_1 = L0_1[1]
  if L0_1 == 233 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
