-- Threat: !InfrastructureShared
-- Name: 55b3bb930839
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
local l_0_3 = string.find(l_0_1, "--single-argument", 1, true) ~= nil or string.find(l_0_1, "-osint", 1, true) ~= nil and string.find(l_0_1, "-url", 1, true) ~= nil
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4
for l_0_5 in l_0_1:gmatch("https?://[^%s\"']+") do
  local l_0_6, l_0_7 = l_0_5:match("^https?://([^/%?\"']+)([^?\"']*)")
  if l_0_6 and l_0_7 and l_0_6:match("^([^:]+)") == "m365.cloud.microsoft" and (l_0_7 == "/search" or l_0_7 == "/search/") then
    l_0_4 = l_0_5
    break
  end
end
if l_0_4 == nil then
  return mp.CLEAN
end
if string.find(l_0_4, "?q=", 1, true) == nil and string.find(l_0_4, "&q=", 1, true) == nil and string.find(l_0_4, "%3fq%3d", 1, true) == nil and string.find(l_0_4, "%26q%3d", 1, true) == nil then
  return mp.CLEAN
end

local function l_0_8(l_1_0)
  return (l_1_0:gsub("%%(%x%x)", function(l_2_0)
    local l_2_1 = tonumber(l_2_0, 16)
    if l_2_1 == nil then
      return "%" .. l_2_0
    end
    return string.char(l_2_1)
  end))
end

local l_0_9 = l_0_8(l_0_4) or l_0_4
local l_0_10 = l_0_9:match("[?&]q=([^&]+)") or ""
l_0_10 = l_0_10:gsub("+", " ")
local l_0_11 = l_0_8(l_0_10) or l_0_10
l_0_11 = l_0_8(l_0_11) or l_0_11
local l_0_13 = string.find(l_0_11, "<img", 1, true) ~= nil or string.find(l_0_11, "src=", 1, true) ~= nil or string.find(l_0_11, "searchbyimage", 1, true) ~= nil or string.find(l_0_11, "cbir=sbi", 1, true) ~= nil or string.find(l_0_11, "imgurl=", 1, true) ~= nil or string.find(l_0_11, "search for email", 1, true) ~= nil or string.find(l_0_11, "take its title", 1, true) ~= nil or string.find(l_0_11, "embed it in an image url", 1, true) ~= nil or string.find(l_0_11, "put inside", 1, true) ~= nil
if not l_0_13 then
  return mp.CLEAN
end
bm.add_related_string("ReferenceUrl", l_0_4, bm.RelatedStringBMReport)
return mp.INFECTED
