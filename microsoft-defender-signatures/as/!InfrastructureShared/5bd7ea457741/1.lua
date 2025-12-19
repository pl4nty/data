-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bd7ea457741\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not l_0_0 or not l_0_0.image_path then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC18: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC21: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC25: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC26: Overwrote pending register: R4 in 'AssignReg'

if l_0_0 and "werfault.exe" and Contains_any_caseinsenstive("svchost.exe", "WerFaultSecure.exe") then
  return mp.CLEAN
end
local l_0_2 = (mp.GetScannedPPID)()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC54: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC60: Overwrote pending register: R6 in 'AssignReg'

local l_0_4 = (string.match)(l_0_3, "NisSrv.exe")
-- DECOMPILER ERROR at PC65: Overwrote pending register: R7 in 'AssignReg'

local l_0_5 = (string.match)(l_0_0.ppid, "mighost.exe")
if not l_0_4 or l_0_5 then
  return mp.CLEAN
end
if l_0_5 == l_0_4 then
  return mp.CLEAN
end
;
(MpCommon.BmTriggerSig)(l_0_0.ppid, "SuspWerFaultSec_CMD_2", l_0_3)
return mp.INFECTED

