-- Threat: !InfrastructureShared
-- Name: a27889974309
-- Type: 21

if peattributes.isexe and pehdr.NumberOfSections >= 6 then
  local l_0_0 = 0
  local l_0_1 = 0
  for l_0_2 = 2, pehdr.NumberOfSections do
    l_0_0 = l_0_0 + pesecs[l_0_2].SizeOfRawData
    if l_0_1 < pesecs[l_0_2].SizeOfRawData then
      l_0_1 = pesecs[l_0_2].SizeOfRawData
    end
  end
  if (l_0_0 - l_0_1) * 100 < l_0_1 * 15 then
    return mp.INFECTED
  end
end
return mp.CLEAN
