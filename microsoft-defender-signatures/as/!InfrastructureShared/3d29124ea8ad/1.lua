-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3d29124ea8ad\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("SuspTamperingScript")
if isTamperProtectionOn() then
  return mp.INFECTED
end
if (MpCommon.NidSearch)(mp.NID_ENABLE_EXTENDED_BAFS, 3) then
  set_research_data("Reason", "AggressivePeTrigger", false)
  return mp.LOWFI
end
return mp.CLEAN

