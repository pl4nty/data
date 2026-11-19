-- Threat: \xac!Sefnit
-- Type: 8

if pehdr.MajorImageVersion ~= 0 then
  return mp.CLEAN
end
if pehdr.MinorImageVersion ~= 0 then
  return mp.CLEAN
end
if peattributes.headerchecksum0 ~= true then
  return mp.CLEAN
end
if peattributes.no_resources ~= true then
  return mp.CLEAN
end
if peattributes.no_loadconfig ~= true then
  return mp.CLEAN
end
if peattributes.isdll ~= true then
  return mp.CLEAN
end
if peattributes.hasexports ~= true then
  return mp.CLEAN
end
if peattributes.no_relocs ~= false then
  return mp.CLEAN
end
if pehdr.DataDirectory[6].Size >= 4096 then
  return mp.CLEAN
end
if peattributes.is_delphi ~= false then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 4 then
  return mp.CLEAN
end
if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
mp.readprotection(false)
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
local l_0_0 = mp.readfile(pe.foffset_rva(pesecs[pevars.epsec].VirtualAddress), 16)
if l_0_0:byte(2) ~= 232 then
  return mp.CLEAN
end
if l_0_0:byte(8) ~= 232 then
  return mp.CLEAN
end
if l_0_0:byte(14) ~= 232 then
  return mp.CLEAN
end
local l_0_1 = {
  {
    sig = "/\000a\000c\000l\000k\000%\000\000\000\000\000",
    xray_type = 4,
    bytes_to_decrypt = 0
  },
  {
    sig = "cmd.exe /c RD /S",
    xray_type = 4,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_1, 2, 2, 0, 4096)
