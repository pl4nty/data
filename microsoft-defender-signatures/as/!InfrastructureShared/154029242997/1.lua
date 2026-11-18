-- Threat: !InfrastructureShared
-- Name: 154029242997
-- Type: 21

if peattributes.hasappendeddata then
  local l_0_0 = pehdr.NumberOfSections
  local l_0_1 = pesecs[l_0_0].PointerToRawData + pesecs[l_0_0].SizeOfRawData
  mp.readprotection(false)
  local l_0_2 = mp.readfile(l_0_1, 16)
  if l_0_2 == "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000" then
    if mp.getfilesize() >= 4194304 then
      mp.set_mpattribute("AutoItIgnoreMaxSizes")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
