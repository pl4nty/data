-- Threat: !InfrastructureShared
-- Name: 81b3c91d46a5
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
if string.find(l_0_0, "\\dllhost.exe", 1, true) or string.find(l_0_0, "\\explorer.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
