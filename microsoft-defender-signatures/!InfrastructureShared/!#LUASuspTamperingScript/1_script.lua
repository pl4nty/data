-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUASuspTamperingScript\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
do
  if (mp.GetExecutablesFromCommandLine)(l_0_1) == nil then
    local l_0_2 = {}
  end
  local l_0_3 = nil
  if (mp.GetParentProcInfo)(l_0_0) ~= nil then
    local l_0_4 = nil
    do
      do
        if (mp.GetExecutablesFromCommandLine)((mp.GetProcessCommandLine)(((mp.GetParentProcInfo)(l_0_0)).ppid)) == nil then
          local l_0_5 = nil
        end
        l_0_3 = table_dedup(table_merge(l_0_3, {}))
        local l_0_6 = nil
        local l_0_7 = {[".bat"] = true, [".cmd"] = true, [".ps1"] = true}
        local l_0_8 = 4
        for l_0_12,l_0_13 in ipairs(l_0_3) do
          local l_0_9 = {":\\saw\\system\\sawhealthcheck.ps1$", ":\\saw\\user\\sawhealthcheck.ps1$", "\\microsoft intune management extension\\policies\\scripts\\", ":\\windows\\imecache\\healthscripts\\.+%.ps1$", "\\vdi_scripts\\defenderatp\\defenderatp.ps1$", ":\\agent\\enableagent.ps1$", ":\\programdata\\amazon\\ssm\\.+\\runpowershellscript\\_script.ps1$", ":\\svcfab\\_app\\.+\\svc\\setupnightwatch.bat$", ":\\work\\cloudtest\\preconfig.cmd$", "%w\\bin\\defender%-exclusions.ps1$"}
          -- DECOMPILER ERROR at PC72: Confused about usage of register: R11 in 'UnsetPending'

          -- DECOMPILER ERROR at PC81: Confused about usage of register: R11 in 'UnsetPending'

          if l_0_8 < (string.len)((MpCommon.ExpandEnvironmentVariables)("\\vdi_scripts\\defenderatp\\defenderatp.ps1$")) then
            local l_0_15 = nil
            if l_0_7[(string.sub)(((MpCommon.ExpandEnvironmentVariables)("\\vdi_scripts\\defenderatp\\defenderatp.ps1$")):lower(), -l_0_8)] then
              local l_0_16 = nil
              for l_0_20,l_0_21 in pairs(l_0_9) do
                local l_0_17 = false
                -- DECOMPILER ERROR at PC99: Confused about usage of register: R19 in 'UnsetPending'

                if (string.find)(l_0_15, R19_PC99, 1, false) then
                  l_0_17 = true
                  break
                end
              end
              do
                -- DECOMPILER ERROR at PC109: Confused about usage of register: R14 in 'UnsetPending'

                if not l_0_17 and (sysio.IsFileExists)(l_0_14) then
                  AppendToRollingQueue("ShellScripts", l_0_0 .. ",FilePath:" .. l_0_14, l_0_14, 3600, 100, 1)
                  local l_0_22 = nil
                  local l_0_23 = mp.ReportLowfi
                  local l_0_24 = l_0_14
                  local l_0_25 = 4064046355
                  l_0_23(l_0_24, l_0_25, {ReportingSig = "LUA:SuspTamperingScript"})
                end
                do
                  -- DECOMPILER ERROR at PC135: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC135: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC135: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC135: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC135: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
        return mp.CLEAN
      end
    end
  end
end

