-- Threat: !InfrastructureShared
-- Name: 2c61923d9acd
-- Type: 21

if peattributes.hasappendeddata then
  local l_0_0 = mp.getfilesize()
  local l_0_1 = pehdr.NumberOfSections
  local l_0_2 = pesecs[l_0_1].PointerToRawData + pesecs[l_0_1].SizeOfRawData
  if l_0_0 > l_0_2 + 4 then
    mp.readprotection(false)
    local l_0_3 = mp.readfile(l_0_2, 4)
    if l_0_3 == "SO!#" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
