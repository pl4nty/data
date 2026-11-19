-- Threat: !InfrastructureShared
-- Name: 95b37830e2d6
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].wp1 ~= nil then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1)
  bm.add_related_file(l_0_0)
end
bm.trigger_sig_self_propagate("SuspChildProcessLaunch", "Behavior:Win32/SingingSilver.A!dha")
return mp.INFECTED
