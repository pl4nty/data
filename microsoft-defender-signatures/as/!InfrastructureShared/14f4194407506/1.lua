-- Threat: !InfrastructureShared
-- Name: 14f4194407506
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
  l_0_1 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
  l_0_1 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
  l_0_1 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p1
  l_0_1 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p1
  l_0_1 = this_sigattrlog[7].utf8p2
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p1
  l_0_1 = this_sigattrlog[8].utf8p2
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p1
  l_0_1 = this_sigattrlog[9].utf8p2
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p1
  l_0_1 = this_sigattrlog[10].utf8p2
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1
local l_0_3 = 0
local l_0_4 = 0
repeat
  l_0_2, l_0_4 = string.gsub(l_0_2, "%%(%x%x)", function(l_1_0)
    return string.char(tonumber(l_1_0, 16))
  end)
  l_0_3 = l_0_3 + l_0_4
until l_0_4 == 0
local l_0_5 = l_0_2
_, l_0_4 = string.gsub(l_0_5, "%$", "")
l_0_3 = l_0_3 + l_0_4
_, l_0_4 = string.gsub(l_0_5, "{.-}", "")
l_0_3 = l_0_3 + l_0_4
if l_0_3 < 4 then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if not string.find(l_0_2, "j.-n.-d.-i.-:.-l.-d.-a.-p.-:") then
  return mp.CLEAN
end
local l_0_6 = {
  ["[" .. l_0_0 .. "]"] = "[" .. l_0_1 .. "]"
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_6)
return mp.INFECTED
