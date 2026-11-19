-- Threat: !InfrastructureShared
-- Name: 35b352737b61
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and l_0_0.command_line ~= nil then
  local l_0_1 = l_0_0.command_line
  local l_0_2 = string.lower(l_0_1)
  if l_0_2:find("powershell", 1, true) or l_0_2.find("pwsh", 1, true) then
    if l_0_2:find("microsoft.skypeapp", 1, true) or l_0_2:find("final result:", 1, true) then
      return mp.CLEAN
    end
    if l_0_2:find("windows\\ccm", 1, true) or l_0_2:find("\\sysvol\\", 1, true) or l_0_2:find("\\netlogon\\", 1, true) then
      return mp.CLEAN
    end
    if l_0_2:match("%s+[%-/]en?c?o?d?e?d?c?o?m?m?a?n?d?%s+") then
      local l_0_3 = GetTacticsTableForPid(l_0_0.ppid)
      if l_0_3 ~= nil and type(l_0_3) == "table" then
        local l_0_4 = 0
        if l_0_3.obfuscation_b64 then
          l_0_4 = l_0_4 + 1
        end
        if l_0_3.intent_cred_enum_amsi then
          l_0_4 = l_0_4 + 1
        end
        if l_0_3.intent_schtask_amsi then
          l_0_4 = l_0_4 + 1
        end
        if l_0_3.intent_schtask_script then
          l_0_4 = l_0_4 + 1
        end
        if l_0_3.posh_remote_exec then
          l_0_4 = l_0_4 + 1
        end
        if l_0_3.posh_webaccess then
          l_0_4 = l_0_4 + 1
        end
        if l_0_3.posh_apiexec then
          l_0_4 = l_0_4 + 1
        end
        if l_0_3.amsi_bypass then
          l_0_4 = l_0_4 + 2
        end
        if l_0_3.amsitampering then
          l_0_4 = l_0_4 + 2
        end
        if 2 < l_0_4 then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
