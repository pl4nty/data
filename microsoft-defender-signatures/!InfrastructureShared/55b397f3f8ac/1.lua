-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\55b397f3f8ac\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC6: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC22: Overwrote pending register: R0 in 'AssignReg'

  if not (this_sigattrlog[2]).matched or (this_sigattrlog[3]).matched then
    local l_0_1 = this_sigattrlog[2]
  else
    do
      do return mp.CLEAN end
      local l_0_2 = nil
      local l_0_3, l_0_4 = {}, (bm.get_process_relationships)()
      for l_0_8,l_0_9 in ipairs(l_0_4) do
        local l_0_5 = nil
        -- DECOMPILER ERROR at PC37: Confused about usage of register: R8 in 'UnsetPending'

        do
          if R8_PC37.image_path == nil then
            local l_0_11, l_0_13, l_0_15 = (mp.bitand)(R8_PC37.reason_ex, 1) ~= 1 or not IsTacticObservedForPid(R8_PC37.ppid, "webservice_childproc") or "none"
          end
          -- DECOMPILER ERROR at PC52: Confused about usage of register: R8 in 'UnsetPending'

          do
            do
              if l_0_10.cmd_line == nil then
                local l_0_12, l_0_14, l_0_16 = , "none"
              end
              -- DECOMPILER ERROR at PC59: Confused about usage of register: R9 in 'UnsetPending'

              -- DECOMPILER ERROR at PC61: Confused about usage of register: R10 in 'UnsetPending'

              ;
              (table.insert)(l_0_3, l_0_14 .. "_" .. l_0_16)
              TrackPidAndTechniqueBM(l_0_2.ppid, "T1190", "webservice_childproc", 7200)
              -- DECOMPILER ERROR at PC70: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC70: LeaveBlock: unexpected jumping out DO_STMT

            end
          end
        end
      end
      do
        if IsTacticObservedForPid(l_0_2.ppid, "webservice_childproc") then
          local l_0_17 = nil
          if (bm.get_current_process_startup_info)() ~= nil and ((bm.get_current_process_startup_info)()).command_line ~= nil then
            (table.insert)(l_0_3, "self_" .. ((bm.get_current_process_startup_info)()).command_line)
          end
          ;
          (bm.add_related_string)("file_metadata", l_0_3, bm.RelatedStringBMReport)
          addRelatedProcess()
          reportRelatedBmHits()
          return mp.INFECTED
        end
        return mp.CLEAN
      end
    end
  end
end

