-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1d2b31e526b3d\0x00000e29_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC19: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC61: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[4]).matched) and (this_sigattrlog[4]).utf8p2 ~= nil then
      local l_0_1 = (string.lower)((mp.ContextualExpandEnvironmentVariables)((this_sigattrlog[3]).utf8p2))
    end
    -- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_1 then
      local l_0_2 = nil
      for l_0_6,l_0_7 in ipairs({"\\users\\.+", "\\windows\\.+", "\\device\\.+", "\\temp\\.+"}) do
        local l_0_3 = nil
        -- DECOMPILER ERROR at PC77: Confused about usage of register: R6 in 'UnsetPending'

        if (string.find)(l_0_2, R6_PC77) and (bm.get_current_process_startup_info)() and next((bm.get_current_process_startup_info)()) and ((bm.get_current_process_startup_info)()).command_line then
          (bm.add_related_file)(l_0_2)
          ;
          (bm.request_SMS)(((bm.get_current_process_startup_info)()).ppid, "M")
          ;
          (bm.add_action)("SmsAsyncScanEvent", 1)
          return mp.INFECTED
        end
      end
    end
    do
      return mp.CLEAN
    end
  end
end

