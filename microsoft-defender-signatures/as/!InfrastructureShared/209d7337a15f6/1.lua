-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\209d7337a15f6\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not isnull(l_0_0) and not isnull(l_0_0.image_path) and (string.lower)((string.sub)(l_0_0.image_path, -11)) ~= "svchost.exe" then
  return mp.CLEAN
end
local l_0_1 = (mp.GetScannedPPID)()
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (mp.GetProcessCommandLine)(l_0_1)
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC49: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC50: Overwrote pending register: R4 in 'AssignReg'

if ("/for=c: /oldest /quiet")(l_0_2, l_0_3) then
  return mp.CLEAN
end
if GetRollingQueueKeyValues("gpo_schtasks", l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN

