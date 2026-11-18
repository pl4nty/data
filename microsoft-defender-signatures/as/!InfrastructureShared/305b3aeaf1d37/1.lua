-- Threat: !InfrastructureShared
-- Name: 305b3aeaf1d37
-- Type: 21

local l_0_0
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p2
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p2
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p2
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p2
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p2
elseif this_sigattrlog[12].matched and this_sigattrlog[12].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[12].utf8p2
elseif this_sigattrlog[13].matched and this_sigattrlog[13].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[13].utf8p2
elseif this_sigattrlog[14].matched and this_sigattrlog[14].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[14].utf8p2
end
local l_0_1 = {
  "curl ",
  "wget ",
  "whoami"
}
if l_0_0 ~= nil then
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if string.find(l_0_0, l_0_3) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
