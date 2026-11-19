-- Threat: !InfrastructureShared
-- Name: 4d78caca6481
-- Type: 21

if mp.getfilesize() > 1048576 then
  return mp.CLEAN
end
if pehdr.NumberOfSections > 10 then
  return mp.CLEAN
end
for l_0_0 = 1, pehdr.NumberOfSections do
  if pesecs[l_0_0].Name == ".data" then
    local l_0_1 = pesecs[l_0_0].PointerToRawData
    local l_0_2 = pesecs[l_0_0].SizeOfRawData
    if l_0_1 ~= 0 and l_0_2 ~= 0 and l_0_1 + l_0_2 <= mp.getfilesize() and 8 <= l_0_2 then
      mp.readprotection(false)
      local l_0_3 = mp.readfile(l_0_1, 8)
      mp.readprotection(true)
      if mp.readu_u32(l_0_3, 1) == 858927408 and mp.readu_u32(l_0_3, 5) == 926299444 then
        return mp.INFECTED
      end
      if mp.readu_u32(l_0_3, 1) == 1748460241 or mp.readu_u32(l_0_3, 1) == 2336320143 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
