-- Threat: !InfrastructureShared
-- Name: 279b3b3e89ac5
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_imagepath()
if l_0_0 then
  if string.find(l_0_0, "/libcare-server", 1, true) or string.find(l_0_0, "/libcare-ctl", 1, true) or string.find(l_0_0, "/platform-python", 1, true) or string.find(l_0_0, "/chrome_crashpad_handler", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = bm.get_current_process_startup_info()
  local l_0_2 = l_0_1 and l_0_1.command_line
  if l_0_2 then
    if string.find(l_0_0, "/firefox", 1, true) and string.find(l_0_2, "marionette", 1, true) then
      return mp.CLEAN
    end
    if (string.find(l_0_0, "/chrome", 1, true) or string.find(l_0_0, "/chromium", 1, true)) and string.find(l_0_2, "headless", 1, true) then
      return mp.CLEAN
    end
    if string.find(l_0_0, "/python", 1, true) and string.find(l_0_2, "ksplice", 1, true) then
      return mp.CLEAN
    end
  end
end
TerminateParentProcessForLinux()
addRelatedProcess()
TrackPidAndTechniqueBM("BM", "T1003.005", "CredentialAccess")
return mp.INFECTED
