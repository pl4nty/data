-- Threat: \x88!Renos.CQ
-- Type: 10
-- MpAttributes: NDAT:TrojanDownloader:Win32/Renos.CQ

if peattributes.resource_only_dll and pehdr.NumberOfSections == 3 and peattributes.no_ep and peattributes.x86_image then
  mp.readprotection(false)
  local l_0_0 = mp.readfile(pesecs[2].PointerToRawData, 352)
  local l_0_1 = mp.crc32(-1, l_0_0, 1, 352)
  if l_0_1 == 2202006724 then
    return mp.INFECTED
  end
end
return mp.CLEAN
