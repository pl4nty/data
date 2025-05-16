-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\156b347362aac\0x00000948_luac 

-- params : ...
-- function num : 0
local l_0_1, l_0_2 = nil, nil
if not (this_sigattrlog[9]).matched or (this_sigattrlog[9]).utf8p2 == nil or (this_sigattrlog[9]).utf8p2 == "" or (this_sigattrlog[9]).utf8p1 == nil or (this_sigattrlog[9]).utf8p1 == "" then
  return mp.CLEAN
end
local l_0_3 = nil
local l_0_0 = nil
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = nil
if (bm.get_current_process_startup_info)() == nil then
  return mp.CLEAN
end
local l_0_5 = {"/tmp/test10", "/private/tmp/test10", "/tmp/test9.scpt", "/private/tmp/test9.scpt", "/usr/local/bin/com.docker.sock", "/Library/PrivilegedHelperTools/us.zoom.ZoomHelperTool", "/usr/local/bin/com.docker.vmnat", "/usr/local/bin/com.docker.vmnat.lock", "/Library/PrivilegedHelperTools/com.microsoft.teams.TeamsDaemon", "/Library/PrivilegedHelperTools/us.zoom.ZoomService"}
if IsExcludedByCmdlineMacOS(((bm.get_current_process_startup_info)()).command_line) then
  return mp.CLEAN
end
l_0_0 = (this_sigattrlog[9]).utf8p2
l_0_4 = (this_sigattrlog[9]).utf8p1
local l_0_6 = nil
for l_0_10 = mp.SIGATTR_LOG_SZ - 1, 1, -1 do
  local l_0_7, l_0_8 = nil
  -- DECOMPILER ERROR at PC89: Confused about usage of register: R10 in 'UnsetPending'

  -- DECOMPILER ERROR at PC93: Confused about usage of register: R10 in 'UnsetPending'

  -- DECOMPILER ERROR at PC98: Confused about usage of register: R10 in 'UnsetPending'

  -- DECOMPILER ERROR at PC103: Confused about usage of register: R10 in 'UnsetPending'

  -- DECOMPILER ERROR at PC108: Confused about usage of register: R10 in 'UnsetPending'

  -- DECOMPILER ERROR at PC115: Confused about usage of register: R10 in 'UnsetPending'

  -- DECOMPILER ERROR at PC122: Confused about usage of register: R10 in 'UnsetPending'

  -- DECOMPILER ERROR at PC130: Confused about usage of register: R10 in 'UnsetPending'

  if sigattr_tail["/usr/local/bin/com.docker.vmnat"] ~= nil and (sigattr_tail["/usr/local/bin/com.docker.vmnat"]).attribute ~= nil and (sigattr_tail["/usr/local/bin/com.docker.vmnat"]).attribute == 16384 and (sigattr_tail["/usr/local/bin/com.docker.vmnat"]).utf8p1 ~= nil and (sigattr_tail["/usr/local/bin/com.docker.vmnat"]).utf8p1 ~= "" and (string.find)((sigattr_tail["/usr/local/bin/com.docker.vmnat"]).utf8p1, "%$HOME%$/") ~= 1 and ((sigattr_tail["/usr/local/bin/com.docker.vmnat"]).utf8p1 == l_0_4 or (string.find)(l_0_0, ((sigattr_tail["/usr/local/bin/com.docker.vmnat"]).utf8p1):match("[^/]*$"), 1, true)) then
    for l_0_14,l_0_15 in ipairs(l_0_5) do
      -- DECOMPILER ERROR at PC149: Confused about usage of register: R15 in 'UnsetPending'

      if (string.find)((sigattr_tail[l_0_12]).utf8p1, true, 1, true) == 1 then
        if (sysio.IsFileExists)((sigattr_tail[l_0_12]).utf8p1) then
          (bm.trigger_sig)("BM_SusFileDownExecM", (sigattr_tail[l_0_12]).utf8p1)
          ;
          (bm.add_threat_file)((sigattr_tail[l_0_12]).utf8p1)
        end
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end
return mp.CLEAN

