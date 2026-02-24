-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\193b3ee67a8e0\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC25: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[3]).matched or (this_sigattrlog[4]).matched then
      local l_0_1 = (this_sigattrlog[3]).utf8p2
    else
    end
    -- DECOMPILER ERROR at PC43: Overwrote pending register: R0 in 'AssignReg'

    if not (this_sigattrlog[5]).matched or (this_sigattrlog[6]).matched then
      local l_0_2, l_0_3 = (this_sigattrlog[5]).utf8p2
    else
      do
        do return mp.CLEAN end
        -- DECOMPILER ERROR at PC48: Confused about usage of register: R0 in 'UnsetPending'

        local l_0_4 = nil
        if l_0_2 == nil then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC56: Confused about usage of register: R1 in 'UnsetPending'

        local l_0_5 = (string.lower)(l_0_2)
        local l_0_6 = {"\\start menu\\programs\\startup\\", "\\microsoft\\templates\\", "\\microsoft\\word\\startup\\", "\\microsoft\\excel\\xlstart\\"}
        for l_0_10,l_0_11 in ipairs(l_0_6) do
          local l_0_7 = false
          -- DECOMPILER ERROR at PC73: Confused about usage of register: R8 in 'UnsetPending'

          if (string.find)(l_0_5, R8_PC73, 1, true) then
            l_0_7 = true
            break
          end
        end
        do
          -- DECOMPILER ERROR at PC83: Confused about usage of register: R3 in 'UnsetPending'

          if not l_0_7 then
            return mp.CLEAN
          end
          local l_0_12 = nil
          do
            if not isnull((bm.get_imagepath)()) then
              local l_0_13 = nil
              if (string.find)((string.lower)((bm.get_imagepath)()), "\\windows defender\\msmpeng.exe", 1, true) then
                return mp.CLEAN
              end
            end
            local l_0_14 = nil
            local l_0_15 = nil
            if not isnull((mp.GetExecutablesFromCommandLine)(l_0_5)) then
              if ((mp.GetExecutablesFromCommandLine)(l_0_5))[2] ~= nil then
                l_0_15 = ((mp.GetExecutablesFromCommandLine)(l_0_5))[2]
              else
                if ((mp.GetExecutablesFromCommandLine)(l_0_5))[1] ~= nil then
                  l_0_15 = ((mp.GetExecutablesFromCommandLine)(l_0_5))[1]
                end
              end
            end
            ;
            (bm.add_related_string)("ScriptCmdline", l_0_5, bm.RelatedStringBMReport)
            if l_0_15 ~= nil and (sysio.IsFileExists)(l_0_15) then
              (bm.add_related_file)(l_0_15)
              ;
              (bm.add_threat_file)(l_0_15)
            end
            add_parents()
            TrackPidAndTechniqueBM("BM", "T1059.005", "startup_script_exec")
            TrackPidAndTechniqueBM("BM", "T1547.001", "startup_persistence_exec")
            return mp.INFECTED
          end
        end
      end
    end
  end
end

