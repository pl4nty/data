-- Threat: !InfrastructureShared
-- Name: a9b39e4bab09
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
local l_0_1, l_0_2

local function l_0_3()
  TrackPidAndTechniqueBM("BM", "T1040", "network-sniffing")
end

l_0_1 = string.find(l_0_0, "/private/", 1, true)
l_0_2 = string.find(l_0_0, "/private/var/folders/", 1, true)
if l_0_1 == 1 and l_0_2 == nil then
  l_0_3()
  return mp.INFECTED
end
l_0_1 = string.find(l_0_0, "/users/", 1, true)
l_0_2 = string.find(l_0_0, "/library/application support/", 7, true)
if l_0_1 == 1 and l_0_2 ~= nil then
  l_0_3()
  return mp.INFECTED
end
return mp.CLEAN
