-- Threat: !InfrastructureShared
-- Name: 96b326f3490c
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
if string.find(l_0_0, "firefox", 1, true) or string.find(l_0_0, "backup", 1, true) or string.find(l_0_0, "sync", 1, true) or string.find(l_0_0, "waterfox", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
