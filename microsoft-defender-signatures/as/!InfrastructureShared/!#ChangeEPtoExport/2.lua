-- Threat: !InfrastructureShared
-- Name: !#ChangeEPtoExport
-- Type: 8

if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData > 26112 then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData < 20480 then
  return mp.CLEAN
end
if pesecs[1].NameDW ~= 2019914798 then
  return mp.CLEAN
end
if pesecs[1].Characteristics ~= 1610612768 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].NameDW ~= 1818587694 then
  return mp.CLEAN
end
if pehdr.DataDirectory[13].Size < 232 then
  return mp.CLEAN
end
if pehdr.DataDirectory[13].Size > 248 then
  return mp.CLEAN
end
if pehdr.DataDirectory[2].Size ~= 40 then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 5 then
  return mp.CLEAN
end
if peattributes.headerchecksum0 ~= true then
  return mp.CLEAN
end
if peattributes.isdll ~= true then
  return mp.CLEAN
end
if peattributes.hasexports ~= true then
  return mp.CLEAN
end
if peattributes.hasstandardentry ~= true then
  return mp.CLEAN
end
if peattributes.lastscn_falign ~= true then
  return mp.CLEAN
end
if peattributes.no_decription ~= true then
  return mp.CLEAN
end
if peattributes.no_tls ~= true then
  return mp.CLEAN
end
if pehdr.ImageBase ~= 268435456 then
  return mp.CLEAN
end
if pehdr.Win32VersionValue ~= 0 then
  return mp.CLEAN
end
if pehdr.MajorOperatingSystemVersion ~= 4 then
  return mp.CLEAN
end
if pehdr.MinorOperatingSystemVersion ~= 0 then
  return mp.CLEAN
end
if pehdr.LoaderFlags ~= 0 then
  return mp.CLEAN
end
if 0 >= pehdr.DataDirectory[3].Size then
  return mp.CLEAN
end
if 0 >= pehdr.DataDirectory[11].RVA then
  return mp.CLEAN
end
if pehdr.DataDirectory[11].Size ~= 64 then
  return mp.CLEAN
end
if 0 >= pehdr.DataDirectory[6].RVA then
  return mp.CLEAN
end
if pehdr.DataDirectory[6].Size < 1600 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.DataDirectory[1].RVA), 32)
if 1 > mp.readu_u32(l_0_0, 21) then
  return mp.CLEAN
end
if 2 < mp.readu_u32(l_0_0, 21) then
  return mp.CLEAN
end
if 2 < mp.readu_u32(l_0_0, 25) then
  return mp.CLEAN
end
if 1 > mp.readu_u32(l_0_0, 25) then
  return mp.CLEAN
end
return mp.INFECTED
