-- Threat: !InfrastructureShared
-- Name: 185b30c3357e7
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
local l_0_1 = {
  this_sigattrlog[1] or {},
  this_sigattrlog[2] or {},
  this_sigattrlog[3] or {},
  this_sigattrlog[4] or {},
  this_sigattrlog[5] or {},
  this_sigattrlog[6] or {},
  this_sigattrlog[7] or {},
  this_sigattrlog[8] or {}
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if l_0_3.matched == true and type(l_0_3.utf8p1) == "string" and type(l_0_3.utf8p2) == "string" then
    l_0_0 = l_0_3
    break
  end
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_4 = string.lower(l_0_0.utf8p1)
local l_0_5 = string.lower(l_0_0.utf8p2)
if contains(l_0_4, "clickfix-awareness.vercel.app") or contains(l_0_5, "clickfix-awareness.vercel.app") then
  return mp.INFECTED
end
local l_0_6 = ExtractPartsFromUri(l_0_4)
if type(l_0_6) ~= "table" or type(l_0_6.host) ~= "string" or l_0_6.scheme ~= "http" and l_0_6.scheme ~= "https" then
  return mp.CLEAN
end
local l_0_7 = string.gsub(l_0_6.host, "%.$", "")
if not string.match(l_0_7, "^[%w%.%-]+$") then
  return mp.CLEAN
end
local l_0_8 = string.match(l_0_7, "%.([a-z]+)$")
local l_0_9 = {
  buzz = true,
  stream = true,
  courses = true,
  charity = true,
  hair = true,
  bet = true,
  homes = true,
  uno = true,
  garden = true,
  beauty = true,
  zip = true,
  skin = true,
  bar = true,
  fit = true,
  coupons = true,
  date = true,
  pics = true
}
if l_0_8 == nil or l_0_9[l_0_8] ~= true then
  return mp.CLEAN
end
local l_0_10, l_0_11 = mp.CheckUrl(l_0_0.utf8p1)
if l_0_10 == 1 and l_0_11 == 1 then
  return mp.CLEAN
end
return mp.INFECTED
