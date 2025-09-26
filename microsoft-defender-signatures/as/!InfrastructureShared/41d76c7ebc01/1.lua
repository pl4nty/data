-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41d76c7ebc01\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = (string.match)(l_0_1, "/pid%s+(%d+)")
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC37: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC38: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC39: Overwrote pending register: R5 in 'AssignReg'

for l_0_7,l_0_8 in ("HKLM\\SYSTEM\\CurrentControlSet\\Services\\WinDefend")("HKLM\\SYSTEM\\CurrentControlSet\\Services\\Sense") do
  local l_0_9 = (sysio.RegOpenKey)(l_0_8)
  if l_0_9 then
    local l_0_10 = (sysio.GetRegValueAsString)(l_0_9, "ImagePath")
    if l_0_10 then
      l_0_10 = l_0_10:gsub("\"", "")
      l_0_10 = l_0_10:gsub("\'", "")
      if not (mp.ContextualExpandEnvironmentVariables)(l_0_10) then
        local l_0_11 = (sysio.GetProcessFromFileName)(l_0_10)
        if l_0_11 and #l_0_11 > 0 then
          for l_0_15,l_0_16 in pairs(l_0_11) do
            if l_0_16.pid and tostring(l_0_16.pid) == l_0_2 then
              local l_0_17 = l_0_16.pid .. "->" .. l_0_10
              set_research_data("AffectedService", (MpCommon.Base64Encode)(l_0_17), false)
              local l_0_18 = (mp.GetParentProcInfo)()
              if l_0_18 and l_0_18.ppid then
                (MpCommon.BmTriggerSig)(l_0_18.ppid, "SuspWerFaultSec_CMD", l_0_17)
              end
              return mp.INFECTED
            end
          end
        end
        do
          -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
do return mp.CLEAN end
-- DECOMPILER ERROR at PC128: Confused about usage of register R6 for local variables in 'ReleaseLocals'


