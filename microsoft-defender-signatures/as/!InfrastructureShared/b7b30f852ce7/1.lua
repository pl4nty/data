-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b7b30f852ce7\1.luac 

-- params : ...
-- function num : 0
WinRMSessionTrackProcess("BM", nil, "HostedShell")
;
(mp.set_mpattribute)("Lua:ContextDataProcess/WinRMSessionProcess.A")
;
(mp.set_mpattribute)("Lua:ContextDataProcess/WinRMHostedShellProcess.A")
return mp.INFECTED

