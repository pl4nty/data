local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.no_relocs
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.hasstandardentry
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.lastscn_falign
if L0_1 == false then
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
L0_1 = L0_1.epinfirstsect
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.epatstartlastsect
if L0_1 ~= false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.NameDW
if L0_1 ~= 1667330094 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.SizeOfCode
if L0_1 <= 327680 then
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
L0_1 = peattributes
L0_1 = L0_1.hasappendeddata
if L0_1 ~= false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.BaseOfCode
if L0_1 ~= 4096 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pevars
L0_1 = L0_1.epsec
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
if L0_1 > L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pevars
L1_1 = L1_1.epsec
L0_1 = L0_1[L1_1]
L0_1 = L0_1.SizeOfRawData
if L0_1 <= 8192 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pevars
L1_1 = L1_1.epsec
L0_1 = L0_1[L1_1]
L0_1 = L0_1.SizeOfRawData
if 32768 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 <= 3 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if 7 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.Subsystem
if L0_1 ~= 2 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[5]
L0_1 = L0_1.RVA
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[5]
L0_1 = L0_1.Size
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[12]
L0_1 = L0_1.RVA
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[12]
L0_1 = L0_1.Size
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[10]
L0_1 = L0_1.RVA
if L0_1 <= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[10]
L0_1 = L0_1.Size
if L0_1 ~= 24 then
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
L1_1 = pe
L1_1 = L1_1.foffset_rva
L2_1 = pehdr
L2_1 = L2_1.DataDirectory
L2_1 = L2_1[10]
L2_1 = L2_1.RVA
L1_1 = L1_1(L2_1)
L2_1 = 24
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = L0_1
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 <= 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = L0_1
L3_1 = 5
L1_1 = L1_1(L2_1, L3_1)
if L1_1 <= 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = L0_1
L3_1 = 9
L1_1 = L1_1(L2_1, L3_1)
if L1_1 <= 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = L0_1
L3_1 = 13
L1_1 = L1_1(L2_1, L3_1)
if L1_1 <= 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = L0_1
L3_1 = 17
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = L0_1
L3_1 = 21
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = pe
L2_1 = L2_1.foffset_rva
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = L0_1
L5_1 = 13
L3_1 = L3_1(L4_1, L5_1)
L4_1 = pehdr
L4_1 = L4_1.ImageBase
L3_1 = L3_1 - L4_1
L2_1 = L2_1(L3_1)
L3_1 = 16
L1_1 = L1_1(L2_1, L3_1)
L2_1 = L0_1
L3_1 = L1_1
L2_1 = L2_1 .. L3_1
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = L2_1
L5_1 = 1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 <= 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
