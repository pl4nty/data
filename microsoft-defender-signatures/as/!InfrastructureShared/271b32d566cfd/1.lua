-- Threat: !InfrastructureShared
-- Name: 271b32d566cfd
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
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
elseif this_sigattrlog[15].matched and this_sigattrlog[15].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[15].utf8p2
elseif this_sigattrlog[16].matched and this_sigattrlog[16].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[16].utf8p2
elseif this_sigattrlog[17].matched and this_sigattrlog[17].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[17].utf8p2
elseif this_sigattrlog[18].matched and this_sigattrlog[18].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[18].utf8p2
elseif this_sigattrlog[19].matched and this_sigattrlog[19].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[19].utf8p2
elseif this_sigattrlog[20].matched and this_sigattrlog[20].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[20].utf8p2
elseif this_sigattrlog[21].matched and this_sigattrlog[21].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[21].utf8p2
elseif this_sigattrlog[22].matched and this_sigattrlog[22].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[22].utf8p2
elseif this_sigattrlog[23].matched and this_sigattrlog[23].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[23].utf8p2
elseif this_sigattrlog[24].matched and this_sigattrlog[24].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[24].utf8p2
elseif this_sigattrlog[25].matched and this_sigattrlog[25].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[25].utf8p2
elseif this_sigattrlog[26].matched and this_sigattrlog[26].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[26].utf8p2
elseif this_sigattrlog[27].matched and this_sigattrlog[27].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[27].utf8p2
elseif this_sigattrlog[28].matched and this_sigattrlog[28].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[28].utf8p2
elseif this_sigattrlog[29].matched and this_sigattrlog[29].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[29].utf8p2
elseif this_sigattrlog[30].matched and this_sigattrlog[30].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[30].utf8p2
elseif this_sigattrlog[31].matched and this_sigattrlog[31].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[31].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
end
return mp.INFECTED
