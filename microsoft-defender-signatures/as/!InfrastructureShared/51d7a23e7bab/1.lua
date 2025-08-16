-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\51d7a23e7bab\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0.T1041 = "exfiltration_c2"
l_0_0.T1082 = "exfiltration_systeminfo"
l_0_0.T1539 = "exfiltration_browser"
TrackPidAndMultipleTechniques("CMDHSTR", l_0_0)
return mp.INFECTED

