-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41d76c7ebc01\1.luac 

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
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = {}
-- DECOMPILER ERROR at PC69: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC70: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC71: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC72: Overwrote pending register: R7 in 'AssignReg'

for l_0_9,l_0_10 in ("HKLM\\SYSTEM\\CurrentControlSet\\Services\\WinDefend")("te.processhost.exe") do
  local l_0_11 = (sysio.RegOpenKey)(l_0_10)
  if l_0_11 then
    local l_0_12 = (sysio.GetRegValueAsString)(l_0_11, "ImagePath")
    if l_0_12 then
      l_0_12 = l_0_12:gsub("\"", "")
      l_0_12 = l_0_12:gsub("\'", "")
      if not (mp.ContextualExpandEnvironmentVariables)(l_0_12) then
        local l_0_13 = (sysio.GetProcessFromFileName)(l_0_12)
        if l_0_13 and #l_0_13 > 0 then
          for l_0_17,l_0_18 in pairs(l_0_13) do
            if l_0_18.pid and tostring(l_0_18.pid) == l_0_4 then
              local l_0_19 = l_0_18.pid .. "->" .. l_0_12 .. "->" .. l_0_3
              set_research_data("AffectedService", (MpCommon.Base64Encode)(l_0_19), false)
              if l_0_0 and l_0_0.ppid then
                (MpCommon.BmTriggerSig)(l_0_0.ppid, "SuspWerFaultSec_CMD", l_0_19)
              end
              return mp.INFECTED
            end
          end
        end
        do
          -- DECOMPILER ERROR at PC155: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC155: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC155: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC155: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC155: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC155: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
do return mp.CLEAN end
-- DECOMPILER ERROR at PC160: Confused about usage of register R8 for local variables in 'ReleaseLocals'


