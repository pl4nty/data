-- Threat: !InfrastructureShared
-- Name: 215b33bedec11
-- Type: 21
-- Includes: ResearchData, BMLuaLib, LuaFuncHelper

if isFirstTimeATActive() == false then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[4].matched then
  l_0_0 = 1
elseif this_sigattrlog[5].matched then
  l_0_0 = 3
elseif this_sigattrlog[6].matched then
  l_0_0 = 98
elseif this_sigattrlog[7].matched then
  l_0_0 = 99
elseif this_sigattrlog[8].matched then
  l_0_0 = 109
elseif this_sigattrlog[9].matched then
  l_0_0 = 110
elseif this_sigattrlog[10].matched then
  l_0_0 = 111
end
local l_0_1 = tonumber(this_sigattrlog[2].utf8p2)
local l_0_2 = math_floor(l_0_0 / 100) + 1
local l_0_3, l_0_4 = updateFTATData(l_0_2, l_0_0, l_0_1)
if l_0_4 < 604800 then
  return mp.CLEAN
end
bm.add_related_string("FirstTime", l_0_3, bm.RelatedStringBMReport)
bm.set_detection_string(l_0_3)
local l_0_5, l_0_6 = bm.get_process_relationships()
for l_0_7, l_0_8 in ipairs(l_0_6) do
  local l_0_9 = mp.bitand(l_0_8.reason_ex, 1)
  if l_0_8.ppid ~= nil and l_0_8.image_path ~= nil and l_0_9 == 1 then
    bm.add_related_file(l_0_8.image_path)
  end
end
add_parents()
reportSessionInformation()
return mp.INFECTED
