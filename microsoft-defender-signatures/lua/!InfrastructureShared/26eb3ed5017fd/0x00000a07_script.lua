-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\26eb3ed5017fd\0x00000a07_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 ~= nil and l_0_1.ppid ~= nil then
  if isParentPackageManager(l_0_1.ppid, true) then
    return mp.CLEAN
  end
  TrackPidAndTechnique(l_0_1.ppid, "T1562.004", "DefenseEvasion_ImpairDefenses_DisableSystemFirewall_ufw_config")
end
AddResearchData("BM", true)
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

