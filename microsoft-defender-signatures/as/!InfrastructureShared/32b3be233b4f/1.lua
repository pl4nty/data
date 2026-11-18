-- Threat: !InfrastructureShared
-- Name: 32b3be233b4f
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = "%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d|%d+%.%d+%.%d+%.%d+|%d+%.%d+%.%d+%.%d+"
  if l_0_0:match(l_0_1) then
    bm.trigger_sig_self_propagate("SuspChildProcessLaunch", "Behavior:Win32/KoalaTwin.A!dha")
    return mp.INFECTED
  end
end
return mp.CLEAN
