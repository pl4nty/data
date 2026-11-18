-- Threat: !InfrastructureShared
-- Name: a5b32d6d389e
-- Type: 21

if (this_sigattrlog[1].matched and this_sigattrlog[2].matched and this_sigattrlog[3].matched and this_sigattrlog[4].matched and this_sigattrlog[5].matched and this_sigattrlog[6].matched and this_sigattrlog[7].matched and this_sigattrlog[8].matched) == false then
  return mp.CLEAN
end
local l_0_0 = ""
if this_sigattrlog[1].utf8p1 == nil then
  return mp.CLEAN
end
l_0_0 = string.match(string.lower(this_sigattrlog[1].utf8p1), "(.+)\\")
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if this_sigattrlog[2].utf8p1 == nil then
  return mp.CLEAN
end
if l_0_0 ~= string.match(string.lower(this_sigattrlog[2].utf8p1), "(.+)\\") then
  return mp.CLEAN
end
if this_sigattrlog[3].utf8p1 == nil then
  return mp.CLEAN
end
if l_0_0 ~= string.match(string.lower(this_sigattrlog[3].utf8p1), "(.+)\\") then
  return mp.CLEAN
end
if this_sigattrlog[4].utf8p1 == nil then
  return mp.CLEAN
end
if l_0_0 ~= string.match(string.lower(this_sigattrlog[4].utf8p1), "(.+)\\") then
  return mp.CLEAN
end
if this_sigattrlog[5].utf8p1 == nil then
  return mp.CLEAN
end
if l_0_0 ~= string.match(string.lower(this_sigattrlog[5].utf8p1), "(.+)\\") then
  return mp.CLEAN
end
if this_sigattrlog[6].utf8p1 == nil then
  return mp.CLEAN
end
if l_0_0 ~= string.match(string.lower(this_sigattrlog[6].utf8p1), "(.+)\\") then
  return mp.CLEAN
end
if this_sigattrlog[7].utf8p1 == nil then
  return mp.CLEAN
end
if l_0_0 ~= string.match(string.lower(this_sigattrlog[7].utf8p1), "(.+)\\") then
  return mp.CLEAN
end
if this_sigattrlog[8].utf8p1 == nil then
  return mp.CLEAN
end
if l_0_0 ~= string.match(string.lower(this_sigattrlog[8].utf8p1), "(.+)\\") then
  return mp.CLEAN
end
if not MpCommon.QueryPersistContext(bm.get_imagepath(), "RunsDestructiveCMDsParentBlock") then
  return mp.CLEAN
end
return mp.INFECTED
