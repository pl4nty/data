local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.epscn_writable
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[1]
if L0_1 ~= 232 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[2]
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[3]
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[4]
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[5]
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[6]
if L0_1 ~= 93 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[7]
if L0_1 ~= 139 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[8]
if L0_1 ~= 69 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[9]
if L0_1 ~= 7 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[10]
if L0_1 ~= 64 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[11]
if L0_1 ~= 255 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[12]
if L0_1 ~= 224 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[13]
if L0_1 ~= 255 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
