-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\279b3b3e89ac5\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 then
  if (string.find)(l_0_0, "/libcare-server", 1, true) or (string.find)(l_0_0, "/libcare-ctl", 1, true) or (string.find)(l_0_0, "/platform-python", 1, true) or (string.find)(l_0_0, "/chrome_crashpad_handler", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = (bm.get_current_process_startup_info)()
  -- DECOMPILER ERROR at PC63: Confused about usage of register: R2 in 'UnsetPending'

  if not l_0_1 or l_0_1.command_line then
    if (string.find)(l_0_0, "/firefox", 1, true) and (string.find)(l_0_1.command_line, "marionette", 1, true) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC93: Confused about usage of register: R2 in 'UnsetPending'

    if ((string.find)(l_0_0, "/chrome", 1, true) or (string.find)(l_0_0, "/chromium", 1, true)) and (string.find)(l_0_1.command_line, "headless", 1, true) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC114: Confused about usage of register: R2 in 'UnsetPending'

    if (string.find)(l_0_0, "/python", 1, true) and (string.find)(l_0_1.command_line, "ksplice", 1, true) then
      return mp.CLEAN
    end
  end
end
do
  TerminateParentProcessForLinux()
  addRelatedProcess()
  TrackPidAndTechniqueBM("BM", "T1003.005", "CredentialAccess")
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC136: freeLocal<0 in 'ReleaseLocals'

end

