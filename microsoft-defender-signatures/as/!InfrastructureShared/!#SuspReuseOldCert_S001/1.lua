local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.x86_image
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.TimeDateStamp
if L0_1 ~= 0 then
  L0_1 = 1577836800
  L1_1 = pehdr
  L1_1 = L1_1.TimeDateStamp
  if L0_1 < L1_1 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
