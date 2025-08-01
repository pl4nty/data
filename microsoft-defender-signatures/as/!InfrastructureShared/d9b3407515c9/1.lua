-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d9b3407515c9\1.luac 

-- params : ...
-- function num : 0
local l_0_6 = nil
local l_0_7 = nil
local l_0_8 = ((bm.get_current_process_startup_info)()).command_line
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[2]).utf8p1 ~= "" then
  local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5 = (bm.get_imagepath)()
else
  do
    -- DECOMPILER ERROR at PC43: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC59: Unhandled construct in 'MakeBoolean' P3

    if ((this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil and (this_sigattrlog[3]).utf8p1 ~= "" and l_0_6 == nil) or (string.find)(l_0_6, "/System/", 1, true) == 1 then
      return mp.CLEAN
    end
    local l_0_9 = nil
    if IsExcludedByCmdlineMacOS(l_0_8) or IsExcludedByImagePathMacOS(l_0_9) or IsPersistenceExcludedMacOS(l_0_6:match("[^/]*$"), l_0_9, false) then
      return mp.CLEAN
    end
    if l_0_9:match("/%.[^/]+$") then
      (bm.trigger_sig)("HiddenMacPersist", l_0_6)
    end
    if l_0_6:match("[^/]*$") ~= nil and l_0_6:match("[^/]*$") ~= "" and IsKeyInRollingQueue("MAC_PERSIST_PROG_PATHS", l_0_6:match("[^/]*$"), true) then
      local l_0_10 = nil
      if GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_6:match("[^/]*$")) ~= nil and #GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_6:match("[^/]*$")) > 0 then
        for l_0_14,l_0_15 in ipairs(GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_6:match("[^/]*$"))) do
          local l_0_11 = nil
          -- DECOMPILER ERROR at PC120: Confused about usage of register: R10 in 'UnsetPending'

          if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", R10_PC120.value) then
            (bm.add_related_string)("persisted_path", R10_PC120.value, bm.RelatedStringBMReport)
            ;
            (bm.add_related_file)(R10_PC120.value)
            return mp.INFECTED
          end
        end
      end
    end
    do
      return mp.CLEAN
    end
  end
end

