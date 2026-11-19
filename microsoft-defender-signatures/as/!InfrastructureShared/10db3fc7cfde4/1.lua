-- Threat: !InfrastructureShared
-- Name: 10db3fc7cfde4
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].wp1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched and this_sigattrlog[2].wp1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 ~= nil then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
  bm.add_related_file(l_0_0)
end
bm.trigger_sig_self_propagate("SuspChildProcessLaunch", "Behavior:Win32/CarbonCoffee.A!dha")
return mp.INFECTED
