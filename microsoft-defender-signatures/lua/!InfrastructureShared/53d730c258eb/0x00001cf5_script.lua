-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\53d730c258eb\0x00001cf5_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  TrackPidAndTechnique(l_0_0.ppid, "T1562.004", "DefenseEvasion_ImpairDefenses_DisableSystemFirewall_pf")
end
return mp.INFECTED

