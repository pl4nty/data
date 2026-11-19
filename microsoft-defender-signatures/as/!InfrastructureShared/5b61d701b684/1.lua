-- Threat: !InfrastructureShared
-- Name: 5b61d701b684
-- Type: 21

for l_0_0 = 1, pehdr.NumberOfSections do
  if pesecs[l_0_0].Name == ".." and pesecs[l_0_0].VirtualAddress == hstrlog[1].VA - pehdr.ImageBase and pevars.epsec ~= l_0_0 then
    return mp.INFECTED
  end
end
return mp.CLEAN
