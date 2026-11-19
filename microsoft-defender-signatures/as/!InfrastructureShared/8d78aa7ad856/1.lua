-- Threat: !InfrastructureShared
-- Name: 8d78aa7ad856
-- Type: 21

if peattributes.hasappendeddata then
  local l_0_0 = pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData
  local l_0_1 = mp.getfilesize() - l_0_0
  if 65536 < l_0_1 then
    return mp.INFECTED
  end
end
return mp.LOWFI
