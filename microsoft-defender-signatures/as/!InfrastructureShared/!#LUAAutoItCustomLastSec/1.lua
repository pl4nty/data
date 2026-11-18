-- Threat: !InfrastructureShared
-- Name: !#LUA:AutoItCustomLastSec
-- Type: 10

if peattributes.is_delphi then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].Name == ".rsrc" then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].Name == ".reloc" then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 4194304 <= l_0_0 and peattributes.epscn_writable and peattributes.lastscn_writable and (mp.get_mpattributesubstring("Win32/AutoIt") or mp.get_mpattributesubstring("PESTATIC:cleanstub_autoitv")) then
  local l_0_1 = pesecs[pehdr.NumberOfSections].PointerToRawData
  mp.readprotection(false)
  local l_0_2 = mp.readfile(l_0_1, 64)
  local l_0_3 = mp.crc32(-1, l_0_2, 1, 64)
  if l_0_3 == 2322767049 then
    mp.set_mpattribute("AutoItIgnoreMaxSizes")
    return mp.INFECTED
  end
end
return mp.CLEAN
