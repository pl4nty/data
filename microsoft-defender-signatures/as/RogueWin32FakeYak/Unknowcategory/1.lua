local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.epscn_valign
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L0_1 = L0_1[1]
L0_1 = L0_1.NameDW
if L0_1 ~= 2019914798 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[1]
if L0_1 ~= 144 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[2]
if L0_1 ~= 139 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[3]
if L0_1 ~= 12 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[4]
if L0_1 ~= 36 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[5]
if L0_1 ~= 51 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[6]
if L0_1 ~= 192 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[7]
if L0_1 ~= 72 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[8]
if L0_1 ~= 102 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[9]
if L0_1 ~= 64 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[10]
if L0_1 ~= 15 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[11]
if L0_1 ~= 142 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[14]
if L0_1 ~= 255 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[15]
if L0_1 ~= 255 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
