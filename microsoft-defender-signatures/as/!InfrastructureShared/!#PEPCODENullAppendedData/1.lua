-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:NullAppendedData
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.hasappendeddata ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections == 0 then
  return mp.CLEAN
end
local l_0_0 = pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData
if l_0_0 <= mp.getfilesize() then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize() - l_0_0
if l_0_1 <= 4096 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4033) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4037) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4041) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4045) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4049) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4053) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4057) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4061) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4065) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4069) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4073) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4077) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4081) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4085) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4089) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, 4093) ~= 0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile(pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData, 4096)
local l_0_3 = mp.crc32(-1, l_0_2, 1, 4096)
if l_0_3 ~= 954466286 then
  return mp.CLEAN
end
return mp.INFECTED
