-- Threat: !InfrastructureShared
-- Name: 66b3cf5515a0
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.IsKnownFriendlyFile(l_0_0, true, false)
if l_0_1 == true then
  return mp.CLEAN
end
local l_0_2 = bm.get_imagepath()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.IsKnownFriendlyFile(l_0_2, true, true)
if not l_0_3 then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
mp.ReportLowfi(l_0_0, 1336470086)
return mp.INFECTED
