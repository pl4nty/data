-- Threat: !InfrastructureShared
-- Name: 226b3ad4a41bc
-- Type: 21

local l_0_0 = MpCommon.PathToWin32Path(bm.get_imagepath())
if l_0_0 == nil then
  return mp.CLEAN
end

local function l_0_1(l_1_0)
  return l_1_0:match("^(.*)[/\\][^/\\]+$")
end

local l_0_2 = l_0_1(string.lower(l_0_0))
if l_0_2 == nil or #l_0_2 <= 3 then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_3 = string.lower(this_sigattrlog[9].utf8p1)
end
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = l_0_1(l_0_3)
if l_0_4 == nil or #l_0_4 <= 3 then
  return mp.CLEAN
end
if l_0_2 ~= l_0_4 then
  return mp.CLEAN
end
bm.add_related_file(l_0_3)
return mp.INFECTED
