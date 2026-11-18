-- Threat: !InfrastructureShared
-- Name: 2f1b3642f19fb
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].wp2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].wp2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].wp2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].wp2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].wp2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[7].matched and this_sigattrlog[7].wp2 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p2
elseif this_sigattrlog[8].matched and this_sigattrlog[8].wp2 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p2
elseif this_sigattrlog[9].matched and this_sigattrlog[9].wp2 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p2
elseif this_sigattrlog[10].matched and this_sigattrlog[10].wp2 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p2
elseif this_sigattrlog[11].matched and this_sigattrlog[11].wp2 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p2
elseif this_sigattrlog[12].matched and this_sigattrlog[12].wp2 ~= nil then
  l_0_0 = this_sigattrlog[12].utf8p2
elseif this_sigattrlog[13].matched and this_sigattrlog[13].wp2 ~= nil then
  l_0_0 = this_sigattrlog[13].utf8p2
elseif this_sigattrlog[14].matched and this_sigattrlog[14].wp2 ~= nil then
  l_0_0 = this_sigattrlog[14].utf8p2
elseif this_sigattrlog[15].matched and this_sigattrlog[15].wp2 ~= nil then
  l_0_0 = this_sigattrlog[15].utf8p2
elseif this_sigattrlog[16].matched and this_sigattrlog[16].wp2 ~= nil then
  l_0_0 = this_sigattrlog[16].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
end
local l_0_4
if this_sigattrlog[17].matched and this_sigattrlog[17].wp1 ~= nil then
  l_0_4 = this_sigattrlog[17].utf8p1
end
if l_0_4 ~= nil then
  l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
  bm.add_related_file(l_0_4)
end
return mp.INFECTED
