-- Threat: !InfrastructureShared
-- Name: 526b3c7643d73
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  bm.trigger_sig("ForkFromProc", "ReverseShellAttempt", l_0_0.ppid)
end
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
