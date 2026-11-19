-- Threat: !InfrastructureShared
-- Name: 3478380867d7
-- Type: 21

if mp.getfilesize() > 1048576 then
  return mp.CLEAN
end
if pehdr.NumberOfSections > 10 then
  return mp.CLEAN
end
for l_0_0 = 1, pehdr.NumberOfSections do
  if pesecs[l_0_0].Name == ".data" then
    local l_0_1 = pesecs[l_0_0].VirtualAddress
    local l_0_2 = pesecs[l_0_0].SizeOfRawData
    local l_0_3 = 31
    if l_0_1 ~= 0 and l_0_2 ~= 0 and l_0_1 + l_0_2 <= mp.getfilesize() and l_0_2 >= l_0_3 then
      local l_0_4 = hstrlog[1].VA - pehdr.ImageBase
      local l_0_5 = l_0_1 + l_0_3 - l_0_4
      if 0 <= l_0_5 and l_0_3 >= l_0_5 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
