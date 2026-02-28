local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 512000 < L0_1 then
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
L0_1 = pesecs
L0_1 = L0_1[3]
L1_1 = pesecs
L1_1 = L1_1[2]
L1_1 = L1_1.SizeOfRawData
if 8192 < L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.Name
L2_1 = L1_1
L1_1 = L1_1.sub
L3_1 = 2
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= "data" then
  L1_1 = L0_1.SizeOfRawData
  if L1_1 == 4096 then
    L1_1 = L0_1.VirtualSize
    if L1_1 <= 8192 then
      L1_1 = L0_1.VirtualAddress
      if 20480 <= L1_1 then
        L1_1 = L0_1.VirtualAddress
        if L1_1 <= 36864 then
          L1_1 = mp
          L1_1 = L1_1.CLEAN
          return L1_1
        end
      end
    end
  end
end
L1_1 = pe
L1_1 = L1_1.query_import
L2_1 = L1_1
L3_1 = pe
L3_1 = L3_1.IMPORT_STATIC
L4_1 = 4288984855
L2_1 = L2_1(L3_1, L4_1)
if 0 == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1
L3_1 = pe
L3_1 = L3_1.IMPORT_STATIC
L4_1 = 3419395426
L2_1 = L2_1(L3_1, L4_1)
if 0 == L2_1 then
  L2_1 = L1_1
  L3_1 = pe
  L3_1 = L3_1.IMPORT_STATIC
  L4_1 = 1058758707
  L2_1 = L2_1(L3_1, L4_1)
  if 0 == L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = L1_1
L3_1 = pe
L3_1 = L3_1.IMPORT_STATIC
L4_1 = 1881577768
L2_1 = L2_1(L3_1, L4_1)
if 0 == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1
L3_1 = pe
L3_1 = L3_1.IMPORT_STATIC
L4_1 = 2560256095
L2_1 = L2_1(L3_1, L4_1)
if 0 == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1
L3_1 = pe
L3_1 = L3_1.IMPORT_STATIC
L4_1 = 1256947212
L2_1 = L2_1(L3_1, L4_1)
if 0 == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1
L3_1 = pe
L3_1 = L3_1.IMPORT_STATIC
L4_1 = 453198482
L2_1 = L2_1(L3_1, L4_1)
if 0 == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1
L3_1 = pe
L3_1 = L3_1.IMPORT_STATIC
L4_1 = 133826329
L2_1 = L2_1(L3_1, L4_1)
if 0 == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = pesecs
L2_1 = L2_1[3]
L2_1 = L2_1.VirtualAddress
L3_1 = pehdr
L3_1 = L3_1.ImageBase
L2_1 = L2_1 + L3_1
L3_1 = pe
L3_1 = L3_1.vm_search
L4_1 = L2_1
L5_1 = L2_1 + 2048
L6_1 = "\000r\000b\000\000\000\000\144\000"
L7_1 = nil
L8_1 = pe
L8_1 = L8_1.VM_SEARCH_BM
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
if 4294967295 == L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = false
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = mp
L4_1 = L4_1.bitand
L5_1 = L0_1.PointerToRawData
L5_1 = L5_1 + 2048
L6_1 = 4294967040
L4_1 = L4_1(L5_1, L6_1)
L5_1 = 2048
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.crc32
L5_1 = -1
L6_1 = L3_1
L7_1 = 1
L8_1 = 0
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= 236406113 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
