-- Threat: !InfrastructureShared
-- Name: 155b3c2f4fdd4
-- Type: 21
-- Includes: WinRMSessionInfra

WinRMSessionTrackProcess("BM", nil, "Descendant")
mp.set_mpattribute("Lua:ContextDataProcess/WinRMSessionProcess.A")
mp.set_mpattribute("Lua:ContextDataProcess/WinRMDescendantProcess.A")
return mp.INFECTED
