-- Threat: !InfrastructureShared
-- Name: 71614cc91c6c
-- Type: 21

if peattributes.hasappendeddata then
  local l_0_0 = mp.getfilesize()
  if 6402040 <= l_0_0 and l_0_0 <= 6591488 and (pehdr.SizeOfImage == 622592 or pehdr.SizeOfImage == 696320 or pehdr.SizeOfImage == 692224) or 57671680 <= l_0_0 and pehdr.SizeOfImage == 622592 or 14188544 <= l_0_0 and l_0_0 <= 14254080 and pehdr.SizeOfImage == 921600 then
    local l_0_1 = pehdr.NumberOfSections
    local l_0_2 = pesecs[l_0_1].PointerToRawData + pesecs[l_0_1].SizeOfRawData
    mp.readprotection(false)
    local l_0_3 = mp.readfile(l_0_2, 16)
    if l_0_3 == "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000" then
      mp.set_mpattribute("AutoItIgnoreMaxSizes")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
