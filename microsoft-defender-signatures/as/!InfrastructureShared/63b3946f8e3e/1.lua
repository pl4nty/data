-- Threat: !InfrastructureShared
-- Name: 63b3946f8e3e
-- Type: 21
-- Includes: Path

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = normalize_path(l_0_0)
local l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = normalize_path(l_0_1)

local function l_0_2(l_1_0)
  return l_1_0:match("^(.*)[/\\][^/\\]+$")
end

local l_0_3 = l_0_2(l_0_0)
local l_0_4 = l_0_2(l_0_1)
if l_0_3 == l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
