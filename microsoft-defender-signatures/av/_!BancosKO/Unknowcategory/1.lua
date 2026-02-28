local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 ~= 4 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[3]
L0_1 = L0_1.Size
if L0_1 <= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.SizeOfRawData
if L0_1 < 1726 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.readfile
L1_1 = pesecs
L2_1 = pehdr
L2_1 = L2_1.NumberOfSections
L1_1 = L1_1[L2_1]
L1_1 = L1_1.PointerToRawData
L1_1 = L1_1 + 1166
L2_1 = 560
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 523
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 115 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 525
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 118 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 527
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 104 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 529
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 111 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 531
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 111 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 533
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 116 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 535
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 115 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 537
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 115 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 539
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 46 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 541
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 101 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 543
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 120 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 545
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 101 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 489
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 79 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 491
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 114 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 493
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 105 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 495
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 103 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 497
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 105 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 499
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 110 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 501
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 97 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 503
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 108 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 505
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 70 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 507
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 105 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 509
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 108 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 511
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 101 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 513
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 110 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 515
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 97 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 517
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 109 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 519
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 101 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.crc32
L2_1 = -1
L3_1 = L0_1
L4_1 = 1
L5_1 = 370
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= 8693852 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
