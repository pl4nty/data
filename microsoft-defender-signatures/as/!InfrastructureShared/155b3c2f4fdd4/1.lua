-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\155b3c2f4fdd4\1.luac 

-- params : ...
-- function num : 0
WinRMSessionTrackProcess("BM", nil, "Descendant")
;
(mp.set_mpattribute)("Lua:ContextDataProcess/WinRMSessionProcess.A")
;
(mp.set_mpattribute)("Lua:ContextDataProcess/WinRMDescendantProcess.A")
return mp.INFECTED

