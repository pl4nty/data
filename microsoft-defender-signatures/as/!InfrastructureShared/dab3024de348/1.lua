-- Threat: !InfrastructureShared
-- Name: dab3024de348
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].wp1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 ~= nil then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
  bm.add_related_file(l_0_0)
end
bm.trigger_sig_self_propagate("SuspChildProcessLaunch", "Behavior:Win32/Tinplate.A!dha")
return mp.INFECTED
