local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = pehdr
L0_1 = L0_1.MajorImageVersion
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.MinorImageVersion
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.headerchecksum0
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.no_resources
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.no_loadconfig
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.isdll
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.hasexports
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.no_relocs
if L0_1 ~= false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[6]
L0_1 = L0_1.Size
if 4096 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.is_delphi
if L0_1 ~= false then
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
L0_1 = peattributes
L0_1 = L0_1.epinfirstsect
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = pevars
L0_1 = L0_1.epsec
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
if L0_1 > L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readfile
L1_1 = pe
L1_1 = L1_1.foffset_rva
L2_1 = pesecs
L3_1 = pevars
L3_1 = L3_1.epsec
L2_1 = L2_1[L3_1]
L2_1 = L2_1.VirtualAddress
L1_1 = L1_1(L2_1)
L2_1 = 16
L0_1 = L0_1(L1_1, L2_1)
L2_1 = L0_1
L1_1 = L0_1.byte
L3_1 = 2
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 232 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.byte
L3_1 = 8
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 232 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.byte
L3_1 = 14
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 232 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = {}
L2_1.sig = "/\000a\000c\000l\000k\000%\000\000\000\000\000"
L2_1.xray_type = 4
L2_1.bytes_to_decrypt = 0
L3_1 = {}
L3_1.sig = "cmd.exe /c RD /S"
L3_1.xray_type = 4
L3_1.bytes_to_decrypt = 0
L1_1[1] = L2_1
L1_1[2] = L3_1
L2_1 = pe
L2_1 = L2_1.xray_block
L3_1 = L1_1
L4_1 = 2
L5_1 = 2
L6_1 = 0
L7_1 = 4096
return L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
