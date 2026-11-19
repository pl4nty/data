-- Threat: !InfrastructureShared
-- Name: 140b3793ee7ef
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1, l_0_2, l_0_3
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[2].utf8p2)
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[3].utf8p1)
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_3 = string.lower(this_sigattrlog[4].utf8p1)
end
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.match(l_0_0, "([^\\]+%.exe)$")
if l_0_4 == nil then
  return mp.CLEAN
end
if not string.find(l_0_1, l_0_4, 1, true) then
  return mp.CLEAN
end
local l_0_5 = string.match(l_0_2, "([^\\]+)$")
local l_0_6 = string.match(l_0_3, "([^\\]+)$")
if l_0_5 == nil or l_0_6 == nil then
  return mp.CLEAN
end
if l_0_5 ~= l_0_6 then
  return mp.CLEAN
end
local l_0_7 = {
  ["brave.exe"] = true,
  ["chrome.exe"] = true,
  ["msedge.exe"] = true,
  ["opera.exe"] = true
}
if string.sub(l_0_5, -4) == ".exe" and not l_0_7[l_0_5] then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1547.001", "PhantomStealerRunKey")
TrackPidAndTechniqueBM("BM", "T1055", "PhantomStealerBrowserInject")
return mp.INFECTED
