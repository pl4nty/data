-- Threat: !InfrastructureShared
-- Name: 8f785ac2243b
-- Type: 21

if mp.getfilesize() > 259840 or mp.getfilesize() < 132864 or peattributes.isdll == false or peattributes.hasexports == false or peattributes.suspicious_timestamp == false then
  return mp.CLEAN
end
local l_0_0 = pehdr.ImageBase + pehdr.AddressOfEntryPoint
local l_0_1 = hstrlog[1].VA
if hstrlog[1].matched and l_0_0 - l_0_1 < 21 then
  return mp.INFECTED
end
l_0_1 = hstrlog[2].VA
if hstrlog[2].matched and l_0_0 - l_0_1 < 21 then
  return mp.INFECTED
end
l_0_1 = hstrlog[3].VA
if hstrlog[3].matched and l_0_0 - l_0_1 < 21 then
  return mp.INFECTED
end
l_0_1 = hstrlog[4].VA
if hstrlog[4].matched and l_0_0 - l_0_1 < 21 then
  return mp.INFECTED
end
l_0_1 = hstrlog[5].VA
if hstrlog[5].matched and l_0_0 - l_0_1 < 21 then
  return mp.INFECTED
end
l_0_1 = hstrlog[6].VA
if hstrlog[6].matched and l_0_0 - l_0_1 < 21 then
  return mp.INFECTED
end
l_0_1 = hstrlog[7].VA
if hstrlog[7].matched and l_0_0 - l_0_1 < 21 then
  return mp.INFECTED
end
l_0_1 = hstrlog[8].VA
if hstrlog[8].matched and l_0_0 - l_0_1 < 21 then
  return mp.INFECTED
end
return mp.CLEAN
