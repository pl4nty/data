-- Threat: !InfrastructureShared
-- Name: 255b3b367d43d
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[2].matched and this_sigattrlog[3].matched then
  bm.trigger_sig_self_propagate("SuspChildProcessLaunch", "Behavior:Win32/WinterCoat.A!dha")
  return mp.INFECTED
end
return mp.CLEAN
