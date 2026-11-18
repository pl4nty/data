-- Threat: !InfrastructureShared
-- Name: 8fb34fa9bfcc
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.match(l_0_0, "^/home/[^/]+/%.config/systemd/user/") or string.match(l_0_0, "^/home/[^/]+/%.config/autostart/") or string.match(l_0_0, "^/root/%.config/systemd/user/") or string.match(l_0_0, "^/root/%.config/autostart/") then
    addRelatedProcess()
    reportRelatedBmHits()
    return mp.INFECTED
  end
end
return mp.CLEAN
