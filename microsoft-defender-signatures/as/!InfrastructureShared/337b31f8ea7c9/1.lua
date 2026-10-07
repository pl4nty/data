-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\337b31f8ea7c9\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = (string.lower)((bm.get_imagepath)() or "")
do
  local l_0_2 = not (mp.GetProcessCommandLine)(l_0_0.ppid) and (string.lower)(not l_0_0 or not l_0_0.ppid or "") or ""
  local l_0_3 = nil
  do
    local l_0_4 = nil
    -- DECOMPILER ERROR at PC45: Confused about usage of register: R3 in 'UnsetPending'

    -- DECOMPILER ERROR at PC47: Confused about usage of register: R3 in 'UnsetPending'

    -- DECOMPILER ERROR at PC54: Confused about usage of register: R3 in 'UnsetPending'

    do
      local l_0_5 = nil
      local l_0_6 = nil
      local l_0_7 = not ((mp.GetParentProcInfo)()).image_path and (string.lower)(not (mp.GetParentProcInfo)() or "") or ""
      local l_0_8 = not (mp.GetProcessCommandLine)(l_0_4.ppid) and (string.lower)(not l_0_4 or not l_0_4.ppid or "") or ""
      local l_0_9 = "/bin/perl"
      local l_0_10 = "/libexec/postfix/spawn"
      -- DECOMPILER ERROR at PC85: Confused about usage of register: R10 in 'UnsetPending'

      if (function(l_1_0, l_1_1)
  -- function num : 0_0
  do return l_1_0 ~= nil and #l_1_1 <= #l_1_0 and l_1_0:sub(-#l_1_1) == l_1_1 end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end
)(l_0_1, l_0_9) and (string.find)(l_0_3, "/opt/einteract/utils/policyd-spf-perl sender=", 1, true) ~= nil and (function(l_1_0, l_1_1)
  -- function num : 0_0
  do return l_1_0 ~= nil and #l_1_1 <= #l_1_0 and l_1_0:sub(-#l_1_1) == l_1_1 end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end
)(l_0_7, l_0_10) and (string.find)(l_0_8, "spawn -n policy -t unix user=nobody argv=/usr/bin/perl " .. "/opt/einteract/utils/policyd-spf-perl sender=", 1, true) ~= nil then
        return mp.CLEAN
      end
      local l_0_11 = nil
      local l_0_12 = nil
      local l_0_13 = nil
      if verify_socket_fd_triplet(get_socket_fd_from_dup_event(this_sigattrlog[3]), get_socket_fd_from_dup_event(this_sigattrlog[4]), get_socket_fd_from_dup_event(this_sigattrlog[5])) then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

