-- Threat: !InfrastructureShared
-- Name: 11db30b0fd1bc
-- Type: 21

local l_0_0
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p1
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p1
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p1
elseif this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[12].utf8p1
elseif this_sigattrlog[13].matched and this_sigattrlog[13].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[13].utf8p1
elseif this_sigattrlog[14].matched and this_sigattrlog[14].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[14].utf8p1
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
bm.trigger_sig("FileArchiving", l_0_0)
return mp.CLEAN
