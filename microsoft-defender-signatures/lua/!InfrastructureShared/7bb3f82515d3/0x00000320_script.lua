-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7bb3f82515d3\0x00000320_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC37: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[2]).matched or (this_sigattrlog[3]).matched then
      local l_0_1, l_0_2, l_0_3, l_0_4 = (mp.GetExecutablesFromCommandLine)((this_sigattrlog[2]).utf8p2)
    else
    end
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R0 in 'UnsetPending'

    if not (this_sigattrlog[4]).matched or (mp.GetExecutablesFromCommandLine)((this_sigattrlog[4]).utf8p2) ~= nil then
      for l_0_8,l_0_9 in ipairs((mp.GetExecutablesFromCommandLine)((this_sigattrlog[4]).utf8p2)) do
        local l_0_5 = nil
        -- DECOMPILER ERROR at PC59: Confused about usage of register: R5 in 'UnsetPending'

        R5_PC59 = (string.lower)(R5_PC59)
        if (string.find)(R5_PC59, ".json", -5, true) or (string.find)(R5_PC59, ".yaml", -5, true) or (string.find)(R5_PC59, ".xml", -4, true) or (string.find)(R5_PC59, ".jpg", -4, true) or (string.find)(R5_PC59, ".gz", -3, true) or (string.find)(R5_PC59, ".pdf", -4, true) or (string.find)(R5_PC59, ".mp3", -4, true) or (string.find)(R5_PC59, ".doc", -4, true) or (string.find)(R5_PC59, ".docx", -5, true) or (string.find)(R5_PC59, ".py", -3, true) or (string.find)(R5_PC59, ".png", -4, true) or (string.find)(R5_PC59, ".nib", -4, true) or (string.find)(R5_PC59, ".rtf", -4, true) or (string.find)(R5_PC59, ".xls", -4, true) or (string.find)(R5_PC59, ".txt", -4, true) or (string.find)(R5_PC59, ".wmv", -4, true) or (string.find)(R5_PC59, "/etc/", 1, true) or (string.find)(R5_PC59, "/tmp/", 1, true) or (string.find)(R5_PC59, "/var/", 1, true) or (string.find)(R5_PC59, "/users/", 1, true) then
          if (sysio.IsFileExists)(R5_PC59) then
            (bm.add_related_file)(R5_PC59)
          end
          TrackPidAndTechniqueBM("BM", "T1222.002", "DefenseEvasion_PermissionModification_MacChmodToExec")
          return mp.INFECTED
        end
      end
    end
    do
      return mp.CLEAN
    end
  end
end

