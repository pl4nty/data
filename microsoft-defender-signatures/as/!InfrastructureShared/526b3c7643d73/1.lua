-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\526b3c7643d73\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  (bm.trigger_sig)("ForkFromProc", "ReverseShellAttempt", l_0_0.ppid)
end
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

