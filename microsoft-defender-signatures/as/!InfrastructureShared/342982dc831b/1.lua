-- Threat: !InfrastructureShared
-- Name: 342982dc831b
-- Type: 21

local l_0_0 = ""
local l_0_1 = mp.GetBruteMatchData()
local l_0_2 = l_0_1.match_offset + 1
local l_0_3 = l_0_1.match_offset + 1 + 200
if l_0_1.is_header then
  l_0_0 = tostring(headerpage):sub(l_0_2, l_0_3):lower()
else
  l_0_0 = tostring(footerpage):sub(l_0_2, l_0_3):lower()
end
if not l_0_0:find("get/autodiscover/autodiscover.json?", 1, true) and not l_0_0:find("post/autodiscover/autodiscover.json?", 1, true) then
  return mp.CLEAN
end

local function l_0_4(l_1_0)
  return (l_1_0:gsub("%%(%x%x)", function(l_2_0)
    return string.char(tonumber(l_2_0, 16))
  end))
end

local l_0_5 = string.lower(string.gsub(l_0_4(l_0_0), "%%", ""))
if l_0_5:find("/powershell?", 1, true) or l_0_5:find("/powershell/?", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
