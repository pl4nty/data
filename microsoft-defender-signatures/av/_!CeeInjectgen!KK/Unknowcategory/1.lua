local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if not (L0_1 < 4096) then
  L0_1 = mp
  L0_1 = L0_1.getfilesize
  L0_1 = L0_1()
  if not (5242880 < L0_1) then
    goto lbl_14
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_14::
L0_1 = peattributes
L0_1 = L0_1.packed
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.packersigmatched
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.epinfirstsect
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 ~= 1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.Subsystem
if L0_1 ~= 3 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.TimeDateStamp
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.SizeOfCode
if L0_1 ~= 4 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L0_1 = L0_1[1]
L0_1 = L0_1.NameDW
if L0_1 ~= 1634891822 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L0_1 = L0_1[1]
L0_1 = L0_1.Characteristics
if L0_1 ~= 3758096608 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[1]
if L0_1 ~= 195 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "h\134W\r\000h\136N\r\000\232\026\000\000\000\137E\252h\250\1394\000h"
L1_1.xray_type = 4
L1_1.bytes_to_decrypt = 0
L2_1 = {}
L2_1.sig = "h\000\000\000\134\000\000\000W\000\000\000\r\000\000\000\000\000\000\000h\000\000\000\136\000\000\000N\000\000\000"
L2_1.xray_type = 4
L2_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L0_1[2] = L2_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 2
L4_1 = -1
L5_1 = 0
L6_1 = -1
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
