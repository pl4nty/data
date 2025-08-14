-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\51d7a23e7bab\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechnique("CMDHSTR", "T1041", "exfiltration_c2")
TrackPidAndTechnique("CMDHSTR", "T1082", "exfiltration_systeminfo")
TrackPidAndTechnique("CMDHSTR", "T1539", "exfiltration_browser")
return mp.INFECTED

