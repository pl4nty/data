local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.isvbpcode
if L0_1 ~= true then
  L0_1 = peattributes
  L0_1 = L0_1.isvbnative
  if L0_1 ~= true then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = peattributes
L0_1 = L0_1.isdll
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 512000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = hstrlog
L0_1 = L0_1[4]
L0_1 = L0_1.hitcount
if 50 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
