-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11ab3f25489d0\1_luac 

-- params : ...
-- function num : 0
local l_0_4 = nil
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil and (this_sigattrlog[4]).utf8p1 ~= "" then
  local l_0_0, l_0_1 = nil, nil
else
  do
    -- DECOMPILER ERROR at PC37: Overwrote pending register: R0 in 'AssignReg'

    if (not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p1 == nil or (this_sigattrlog[5]).utf8p1 == "" or (this_sigattrlog[2]).matched) and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[2]).utf8p1 ~= "" and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
      local l_0_2 = (this_sigattrlog[2]).utf8p1
      local l_0_3 = (this_sigattrlog[2]).utf8p2
    end
    do
      local l_0_5 = nil
      for l_0_9,l_0_10 in ipairs({"/tmp/test10", "/private/tmp/test10", "/tmp/test9.scpt", "/private/tmp/test9.scpt", "/usr/local/bin/com.docker.sock", "/Library/PrivilegedHelperTools/us.zoom.ZoomHelperTool", "/usr/local/bin/com.docker.vmnat", "/usr/local/bin/com.docker.vmnat.lock", "/Library/PrivilegedHelperTools/com.microsoft.teams.TeamsDaemon", "/Library/PrivilegedHelperTools/us.zoom.ZoomService"}) do
        local l_0_6, l_0_7, l_0_8 = , false
        -- DECOMPILER ERROR at PC88: Confused about usage of register: R9 in 'UnsetPending'

        if (string.find)(l_0_5, "/usr/local/bin/com.docker.sock", 1, true) == 1 then
          l_0_7 = true
          break
        end
      end
      do
        -- DECOMPILER ERROR at PC98: Confused about usage of register: R3 in 'UnsetPending'

        if not l_0_7 then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC104: Confused about usage of register: R2 in 'UnsetPending'

        if IsExcludedByCmdlineMacOS(l_0_6) or IsExcludedByImagePathMacOS(l_0_5) then
          return mp.CLEAN
        end
        if l_0_4 == nil or l_0_4 == "" or l_0_5 == nil or l_0_5 == "" or (string.find)(l_0_4, "/system/", 1, true) == 1 or (string.find)(l_0_4, ".app/contents/", 1, true) then
          return mp.CLEAN
        end
        if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", (string.lower)(l_0_5)) then
          (bm.trigger_sig)("AdhocPersistDPRK", l_0_4)
          if (sysio.IsFileExists)(l_0_5) then
            (bm.add_threat_file)(l_0_5)
          end
          return mp.INFECTED
        end
        return mp.CLEAN
      end
    end
  end
end

