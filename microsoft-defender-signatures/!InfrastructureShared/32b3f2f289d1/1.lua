-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3f2f289d1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1 = "RMM"
local l_0_2 = "programfiles_targeted"
local l_0_3 = "PFAppTracked"
local l_0_4, l_0_5 = startTrackingApp(l_0_0.ppid, l_0_1, l_0_2, l_0_3)
if l_0_5.IsNewApp then
  l_0_5.SignatureName = "Bm/PFA_RMM.A"
  ;
  (bm.trigger_sig)("SetProcessAttrib", safeJsonSerialize(l_0_5))
end
return mp.CLEAN

