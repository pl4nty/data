-- Threat: !InfrastructureShared
-- Name: bab3b71da655
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
end
local l_0_1
if l_0_0 ~= nil and 3 < string.len(l_0_0) then
  l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_0)
  if l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
    mp.ReportLowfi(l_0_1, 1231906195)
    bm.add_related_file(l_0_1)
  end
end
return mp.INFECTED
