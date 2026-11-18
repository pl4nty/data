-- Threat: !InfrastructureShared
-- Name: 28f786ba28ec0
-- Type: 21

local l_0_0 = (hstrlog[1].matched and 1 or 0) + (hstrlog[2].matched and 1 or 0) + (hstrlog[3].matched and 1 or 0) + (hstrlog[4].matched and 1 or 0) + (hstrlog[5].matched and 1 or 0) + (hstrlog[6].matched and 1 or 0) + (hstrlog[7].matched and 1 or 0) + (hstrlog[8].matched and 1 or 0)
if 2 <= l_0_0 and pesecs[1].SizeOfRawData > 1310720 and pesecs[pehdr.NumberOfSections].SizeOfRawData > 385024 and pehdr.MajorLinkerVersion == 2 and pehdr.MinorLinkerVersion == 25 and pehdr.NumberOfSections >= 9 and pehdr.MajorImageVersion == 0 and pehdr.MajorImageVersion == 0 and pehdr.MajorOperatingSystemVersion == 5 and pehdr.MinorOperatingSystemVersion == 0 and pevars.epsec == 2 then
  return mp.INFECTED
end
return mp.CLEAN
