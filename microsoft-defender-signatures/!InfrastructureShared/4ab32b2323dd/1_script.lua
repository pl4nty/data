-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4ab32b2323dd\1_luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil or (this_sigattrlog[2]).utf8p1 == "" then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[2]).utf8p1
if not SuspMacPathsToMonitor(l_0_0, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1204.002", "Execution_UserExecution_MaliciousFile")
return mp.INFECTED

