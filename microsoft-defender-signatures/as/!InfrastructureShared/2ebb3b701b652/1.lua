-- Threat: !InfrastructureShared
-- Name: 2ebb3b701b652
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil and this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p1
  l_0_1 = this_sigattrlog[11].utf8p1
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil and this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p1
  l_0_1 = this_sigattrlog[12].utf8p1
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil and this_sigattrlog[13].matched and this_sigattrlog[13].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p1
  l_0_1 = this_sigattrlog[13].utf8p1
end
if l_0_0 and l_0_1 and l_0_0:lower() ~= l_0_1:lower() then
  return mp.CLEAN
end
bm.add_related_string("Office_SusCreate_B", l_0_0, bm.RelatedStringBMReport)
l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
if sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
