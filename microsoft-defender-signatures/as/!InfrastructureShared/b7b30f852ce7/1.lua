-- Threat: !InfrastructureShared
-- Name: b7b30f852ce7
-- Type: 21
-- Includes: WinRMSessionInfra

WinRMSessionTrackProcess("BM", nil, "HostedShell")
mp.set_mpattribute("Lua:ContextDataProcess/WinRMSessionProcess.A")
mp.set_mpattribute("Lua:ContextDataProcess/WinRMHostedShellProcess.A")
return mp.INFECTED
