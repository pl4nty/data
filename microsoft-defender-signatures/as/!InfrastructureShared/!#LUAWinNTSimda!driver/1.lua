-- Threat: !InfrastructureShared
-- Name: !#LUA:WinNT/Simda!driver
-- Type: 8

if pehdr.Subsystem ~= 1 then
  return mp.CLEAN
end
if pehdr.Machine ~= 332 then
  return mp.CLEAN
end
if mp.getfilesize() < 4096 then
  return mp.CLEAN
end
for l_0_0 = 1, pehdr.NumberOfSections do
  if mp.bitand(pesecs[l_0_0].Characteristics, 2147483648) ~= 2147483648 then
    return mp.CLEAN
  end
end
mp.readprotection(false)
local l_0_1 = mp.readfile(pesecs[1].PointerToRawData, 4)
if l_0_1 == "(re)" then
  return mp.INFECTED
end
return mp.CLEAN
