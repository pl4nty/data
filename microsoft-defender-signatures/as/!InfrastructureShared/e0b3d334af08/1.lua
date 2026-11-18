-- Threat: !InfrastructureShared
-- Name: e0b3d334af08
-- Type: 21

bm.trigger_sig_self_propagate("SuspHHChildProcessLaunch", "Behavior:Win32/SuspHHProcessCreate.A!dha")
return mp.INFECTED
