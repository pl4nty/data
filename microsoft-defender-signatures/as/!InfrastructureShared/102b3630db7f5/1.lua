-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\102b3630db7f5\1.luac 

-- params : ...
-- function num : 0
local l_0_6 = nil
local l_0_7 = (bm.get_current_process_startup_info)()
local l_0_8 = (bm.get_imagepath)()
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil and (this_sigattrlog[3]).utf8p1 ~= "" then
  local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5 = l_0_7.command_line
else
  do
    -- DECOMPILER ERROR at PC51: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC76: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC76: Unhandled construct in 'MakeBoolean' P3

    if ((this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil and (this_sigattrlog[4]).utf8p1 ~= "" and l_0_6 == nil) or (string.find)(l_0_6, ".app/contents/", 1, true) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC78: Confused about usage of register: R3 in 'UnsetPending'

    if IsExcludedByCmdlineMacOS(l_0_0) or IsExcludedByImagePathMacOS(l_0_8) then
      return mp.CLEAN
    end
    local l_0_9 = nil
    if l_0_6:match("[^/]*$") ~= nil and l_0_6:match("[^/]*$") ~= "" and IsKeyInRollingQueue("MAC_PERSIST_PROG_PATHS", l_0_6:match("[^/]*$"), true) then
      local l_0_10 = nil
      if GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_6:match("[^/]*$")) ~= nil and #GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_6:match("[^/]*$")) > 0 then
        for l_0_14,l_0_15 in ipairs(GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_6:match("[^/]*$"))) do
          local l_0_11 = nil
          -- DECOMPILER ERROR at PC118: Confused about usage of register: R10 in 'UnsetPending'

          if SuspMacPathsToMonitor(R10_PC118.value, true) then
            (bm.add_related_string)("persisted_path", R10_PC118.value, bm.RelatedStringBMReport)
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

