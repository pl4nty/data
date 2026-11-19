-- Threat: !InfrastructureShared
-- Name: 41b3286f6a61
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  local l_0_1
  if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
    l_0_1 = this_sigattrlog[1].utf8p1
  end
  if l_0_1 ~= nil then
    local l_0_2 = {
      ["uacmonitor.exe"] = true,
      ["issuser.exe"] = true,
      ["wdg.automation.agenthost.exe"] = true,
      ["cmd.exe"] = true,
      ["powershell.exe"] = true
    }
    local l_0_3 = string.lower(string.sub(l_0_1, -30)):match("\\system32\\([^\\]+%.exe)$")
    if l_0_2[l_0_3] then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
