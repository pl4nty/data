-- Threat: !InfrastructureShared
-- Name: 75b305e6afdd
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if l_0_0 and l_0_1 ~= nil then
  local l_0_2 = l_0_1.ppid
  if l_0_2 ~= nil then
    local l_0_3 = l_0_1.command_line
    if l_0_3 ~= nil then
      l_0_3 = string.lower(l_0_3)
      if l_0_3:find("javaw.exe") or l_0_3:find("node.exe") or l_0_3:find("code.exe") or l_0_3:find("chrome.exe") or l_0_3:find("discord.exe") or l_0_3:find("java.exe") or l_0_3:find("msedge.exe") or l_0_3:find("letsignit app.exe") or l_0_3:find("springtoolsuite4.exe") or l_0_3:find("atom.exe") or l_0_3:find("iisexpress.exe") or l_0_3:find("gitkraken.exe") or l_0_3:find("eclipse.exe") or l_0_3:find("atom.exe") or l_0_3:find("springtoolsuite4.exe") or l_0_3:find("gitkraken.exe") then
        return mp.CLEAN
      end
    end
    if IsTacticObservedForPid(l_0_2, "processinjection_target") then
      TrackPidAndTechniqueBM("BM", "T1059", "commandscriptinj")
      local l_0_4, l_0_5 = bm.get_process_relationships()
      local l_0_6
      for l_0_7, l_0_8 in ipairs(l_0_5) do
        local l_0_9 = mp.bitand(l_0_8.reason_ex, 1)
        if l_0_9 == 1 and (string.find(string.lower(l_0_8.image_path), "\\cmd.exe\\", 1, true) or string.find(string.lower(l_0_8.image_path), "\\powershell.exe\\", 1, true) or string.find(string.lower(l_0_8.image_path), "\\wscript.exe\\", 1, true) or string.find(string.lower(l_0_8.image_path), "\\cscript.exe\\", 1, true) or string.find(string.lower(l_0_8.image_path), "\\mshta.exe\\", 1, true)) then
          l_0_6 = l_0_8.ppid
          TrackPidAndTechniqueBM(l_0_6, "T1059", "commandscriptinj")
        end
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
