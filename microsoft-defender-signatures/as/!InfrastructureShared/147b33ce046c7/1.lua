-- Threat: !InfrastructureShared
-- Name: 147b33ce046c7
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[1].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[2].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil and this_sigattrlog[3].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil and this_sigattrlog[4].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil and this_sigattrlog[5].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[5].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
bm.trigger_sig("ParentRuningfromWWD", l_0_0)
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_2) do
  bm.trigger_sig("ParentRuningfromWWD", l_0_0, l_0_4.ppid)
end
return mp.INFECTED
