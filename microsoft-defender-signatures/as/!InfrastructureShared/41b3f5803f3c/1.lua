-- Threat: !InfrastructureShared
-- Name: 41b3f5803f3c
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0, l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
  l_0_1 = this_sigattrlog[2].ppid
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if IsPidExcluded(l_0_1) then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if StringStartsWith(l_0_0, "%") then
  return mp.CLEAN
end
bm.DisableSignature()
local l_0_2 = MpCommon.QueryPersistContext(l_0_0, "NewPECreatedNoCert")
if l_0_2 then
  bm.trigger_sig("ExecNewlyCreatedUnsignedExe", "ExecNewlyCreatedUnsignedExe", l_0_1)
end
if IsKeyInRollingQueue("SuspExeFileDroppedViaSMB", l_0_0, true) then
  bm.trigger_sig("ExecRemoteDroppedExe", "ExecRemoteDroppedExe", l_0_1)
  bm.trigger_sig("T1570", "exec_remotedroppedexe_a", l_0_1)
  return mp.INFECTED
end
if IsKeyInRollingQueue("DroppedByPossibleRemotelyCreatedProc", l_0_0, true) then
  bm.trigger_sig("T1570", "exec_remotedroppedexe_b", l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
