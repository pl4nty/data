local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = peattributes
L0_1 = L0_1.reads_vdll_code
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "LUA:StrangeImportRVA"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    goto lbl_215
  end
end
L0_1 = 0
L1_1 = epcode
L1_1 = L1_1[1]
if L1_1 == 141 then
  L1_1 = epcode
  L1_1 = L1_1[2]
  if L1_1 == 148 then
    L1_1 = epcode
    L1_1 = L1_1[3]
    if L1_1 ~= 36 then
      L1_1 = epcode
      L1_1 = L1_1[3]
      if L1_1 ~= 4 then
        goto lbl_34
      end
    end
    L1_1 = epcode
    L1_1 = L1_1[8]
    if L1_1 == 235 then
      L0_1 = 1
  end
end
else
  ::lbl_34::
  L1_1 = pehdr
  L1_1 = L1_1.SizeOfImage
  if 1179648 < L1_1 then
    L1_1 = pehdr
    L1_1 = L1_1.SizeOfImage
    if L1_1 < 1966080 then
      L1_1 = epcode
      L1_1 = L1_1[1]
      if L1_1 == 104 then
        L1_1 = mp
        L1_1 = L1_1.readu_u32
        L2_1 = epcode
        L3_1 = 6
        L1_1 = L1_1(L2_1, L3_1)
        if L1_1 == 488 then
          L1_1 = mp
          L1_1 = L1_1.readu_u16
          L2_1 = epcode
          L3_1 = 10
          L1_1 = L1_1(L2_1, L3_1)
          if L1_1 == 49920 then
            L0_1 = 2
          end
        end
      end
    end
  end
end
if L0_1 == 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pehdr
L1_1 = L1_1.DataDirectory
L2_1 = pe
L2_1 = L2_1.IMAGE_DIRECTORY_ENTRY_SECURITY
L1_1 = L1_1[L2_1]
L1_1 = L1_1.RVA
if L1_1 == 0 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
if L1_1 >= L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L2_1 - L1_1
if L3_1 < 1024 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = false
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = L1_1 + 336
L6_1 = 128
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.crc32
L6_1 = -1
L7_1 = L4_1
L8_1 = 1
L9_1 = 128
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 == 3701156430 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = L1_1 + 378
L7_1 = 128
L5_1 = L5_1(L6_1, L7_1)
L4_1 = L5_1
L5_1 = mp
L5_1 = L5_1.crc32
L6_1 = -1
L7_1 = L4_1
L8_1 = 1
L9_1 = 128
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 == 2309974109 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L3_1 < 2560 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = L1_1 + 2048
L7_1 = 128
L5_1 = L5_1(L6_1, L7_1)
L4_1 = L5_1
L5_1 = mp
L5_1 = L5_1.crc32
L6_1 = -1
L7_1 = L4_1
L8_1 = 1
L9_1 = 128
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 == 2574726046 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L3_1 < 4096 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = L1_1 + 2832
L7_1 = 96
L5_1 = L5_1(L6_1, L7_1)
L4_1 = L5_1
L5_1 = mp
L5_1 = L5_1.crc32
L6_1 = -1
L7_1 = L4_1
L8_1 = 1
L9_1 = 96
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 == 286331011 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
if L5_1 == 1993805178 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
if L5_1 == 2529611765 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
if L5_1 == 3673830025 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
if L3_1 < 5376 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.readfile
L7_1 = L1_1 + 5033
L8_1 = 96
L6_1 = L6_1(L7_1, L8_1)
L4_1 = L6_1
L6_1 = mp
L6_1 = L6_1.crc32
L7_1 = -1
L8_1 = L4_1
L9_1 = 1
L10_1 = 96
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
L5_1 = L6_1
if L5_1 == 3673830025 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
::lbl_215::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
