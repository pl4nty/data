-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4c29b56e3a6e\1.luac 

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
return mp.CLEAN

