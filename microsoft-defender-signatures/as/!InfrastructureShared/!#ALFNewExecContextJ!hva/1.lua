-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFNewExecContextJ!hva\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = IsDeviceHVAWithAD()
if l_0_1 ~= true then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2.SigName = "NewExecContext"
local l_0_3 = pcall(MpCommon.QuerySessionInformation, l_0_0, MpCommon.WTSIsRemoteSession)
do
  local l_0_4, l_0_5, l_0_6 = l_0_3 and MpCommon.QuerySessionInformation or "FALSE"
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R4 in 'UnsetPending'

  l_0_2.isRemote = tostring(l_0_4)
  local l_0_7, l_0_8 = , pcall(MpCommon.QuerySessionInformation, l_0_0, MpCommon.WTSDomainName)
  do
    if l_0_8 and MpCommon.QuerySessionInformation and MpCommon.QuerySessionInformation ~= "" then
      local l_0_9 = nil
      R8_PC50 = R8_PC50(scrubData(R8_PC50))
      l_0_2.DomainName = R8_PC50
    end
    -- DECOMPILER ERROR at PC57: Overwrote pending register: R8 in 'AssignReg'

    local l_0_10, l_0_11 = , pcall(R8_PC50, l_0_0, MpCommon.WTSUserName)
    do
      if l_0_11 and R8_PC50 and R8_PC50 ~= "" then
        local l_0_12 = R8_PC50
        R10_PC70 = R10_PC70(scrubData(R10_PC70))
        l_0_2.UserName = R10_PC70
      end
      -- DECOMPILER ERROR at PC77: Overwrote pending register: R10 in 'AssignReg'

      local l_0_13, l_0_14 = l_0_12, pcall(R10_PC70, l_0_0, MpCommon.WTSClientAddress)
      do
        if l_0_14 and R10_PC70 and R10_PC70 ~= "" then
          local l_0_15 = R10_PC70
          R12_PC90 = R12_PC90(scrubData(R12_PC90))
          l_0_2.IP = R12_PC90
        end
        -- DECOMPILER ERROR at PC97: Overwrote pending register: R12 in 'AssignReg'

        local l_0_16, l_0_17 = l_0_15, pcall(R12_PC90, l_0_0, MpCommon.WTSClientName)
        do
          if l_0_17 and R12_PC90 and R12_PC90 ~= "" then
            local l_0_18 = R12_PC90
            R14_PC110 = R14_PC110(scrubData(R14_PC110))
            l_0_2.ClientName = R14_PC110
          end
          local l_0_19 = l_0_18
          R14_PC110 = R14_PC110(l_0_0, "|psexesvc.exe|dllhost.exe|rundll32.exe|regsvr32.exe|wmiprvse.exe|winrshost.exe|wsmprovhost.exe|cmd.exe|powershell.exe|pwsh.exe|console.exe|bash.exe|services.exe|explorer.exe|svchost.exe|", 2)
          local l_0_20, l_0_21 = nil
          if not l_0_21 or not l_0_0 then
            local l_0_22 = nil
            if (mp.GetParentProcInfo)(l_0_0) ~= nil then
              l_0_2.Parent = (string.lower)(((mp.GetParentProcInfo)(l_0_0)).image_path)
            else
              l_0_2.Parent = "Untracked"
            end
          else
            do
              -- DECOMPILER ERROR at PC139: Confused about usage of register: R15 in 'UnsetPending'

              l_0_2.Parent = l_0_22
              set_research_data("HVASessionInfo", safeJsonSerialize(l_0_2), false)
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end

