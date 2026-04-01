-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFNewExecContextJ!hva\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pcall(MpCommon.QuerySessionInformation, l_0_0, MpCommon.WTSIsRemoteSession)
do
  local l_0_2, l_0_3, l_0_4 = l_0_1 and MpCommon.QuerySessionInformation or "FALSE"
  local l_0_5 = nil
  local l_0_6, l_0_7 = {isRemote = tostring(l_0_5)}, pcall(MpCommon.QuerySessionInformation, l_0_0, MpCommon.WTSDomainName)
  do
    if l_0_7 and MpCommon.QuerySessionInformation and MpCommon.QuerySessionInformation ~= "" then
      local l_0_8 = nil
      R7_PC42 = R7_PC42(scrubData(R7_PC42))
      l_0_6.DomainName = R7_PC42
    end
    -- DECOMPILER ERROR at PC49: Overwrote pending register: R7 in 'AssignReg'

    local l_0_9, l_0_10 = , pcall(R7_PC42, l_0_0, MpCommon.WTSUserName)
    do
      if l_0_10 and R7_PC42 and R7_PC42 ~= "" then
        local l_0_11 = R7_PC42
        R9_PC62 = R9_PC62(scrubData(R9_PC62))
        l_0_6.UserName = R9_PC62
      end
      -- DECOMPILER ERROR at PC69: Overwrote pending register: R9 in 'AssignReg'

      local l_0_12, l_0_13 = l_0_11, pcall(R9_PC62, l_0_0, MpCommon.WTSClientAddress)
      do
        if l_0_13 and R9_PC62 and R9_PC62 ~= "" then
          local l_0_14 = R9_PC62
          R11_PC82 = R11_PC82(scrubData(R11_PC82))
          l_0_6.IP = R11_PC82
        end
        local l_0_15 = l_0_14
        R11_PC82 = R11_PC82(l_0_0, "|psexesvc.exe|dllhost.exe|rundll32.exe|regsvr32.exe|wmiprvse.exe|winrshost.exe|wsmprovhost.exe|cmd.exe|powershell.exe|pwsh.exe|console.exe|bash.exe|services.exe|explorer.exe|svchost.exe|", 5)
        local l_0_16, l_0_17 = nil
        if not l_0_17 or not l_0_0 then
          l_0_6.Parent = "Untracked"
        else
          l_0_6.Parent = l_0_0
        end
        set_research_data("ConnectInfo", safeJsonSerialize(l_0_6), false)
        return mp.INFECTED
      end
    end
  end
end

