-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b36851a362\1_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  local l_0_1 = safeJsonDeserialize(l_0_0)
  local l_0_2 = l_0_1.type
  local l_0_3 = l_0_1.event
  local l_0_4 = l_0_1.weight
  local l_0_5 = l_0_1.blocked
  local l_0_6 = l_0_1.procInfo
  local l_0_7 = l_0_1.parents
  local l_0_8 = {}
  local l_0_9 = {}
  local l_0_10 = {}
  local l_0_11 = contains
  local l_0_12 = l_0_6.cmdline
  local l_0_13 = {}
  -- DECOMPILER ERROR at PC30: No list found for R13 , SetList fails

  -- DECOMPILER ERROR at PC34: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC35: Overwrote pending register: R11 in 'AssignReg'

  if l_0_11 then
    return l_0_11
  end
  -- DECOMPILER ERROR at PC37: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC40: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC41: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC44: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC45: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC46: Overwrote pending register: R13 in 'AssignReg'

  if not l_0_11 then
    l_0_11(l_0_12, l_0_13)
    -- DECOMPILER ERROR at PC48: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC49: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC50: Overwrote pending register: R12 in 'AssignReg'

    l_0_11 = l_0_11(l_0_12)
    -- DECOMPILER ERROR at PC54: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC55: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC56: Overwrote pending register: R13 in 'AssignReg'

    if l_0_11 then
      l_0_12 = l_0_12(l_0_13, false, true)
      if l_0_12 == false then
        l_0_12 = table
        l_0_12 = l_0_12.insert
        -- DECOMPILER ERROR at PC64: Overwrote pending register: R13 in 'AssignReg'

        l_0_12(l_0_13, l_0_11)
      end
    end
  end
  l_0_11 = l_0_6.shellScripts
  if l_0_11 then
    l_0_11 = l_0_6.shellScripts
    l_0_12 = ipairs
    -- DECOMPILER ERROR at PC72: Overwrote pending register: R13 in 'AssignReg'

    l_0_12 = l_0_12(l_0_13)
    for i_1,i_2 in l_0_12 do
      local l_0_17 = (mp.ContextualExpandEnvironmentVariables)(l_0_16)
      if l_0_17 and (mp.IsKnownFriendlyFile)(l_0_17, false, true) == false then
        (table.insert)(l_0_8, l_0_17)
      end
    end
  end
  do
    l_0_11 = l_0_6.scriptInCmdline
    if l_0_11 then
      l_0_11 = l_0_6.scriptInCmdline
      -- DECOMPILER ERROR at PC101: Overwrote pending register: R13 in 'AssignReg'

      for l_0_21,l_0_22 in ipairs(l_0_13) do
        local l_0_21, l_0_22 = nil
        l_0_21 = l_0_20.age
        if l_0_21 ~= 0 then
          l_0_21 = l_0_20.path
          local l_0_23 = nil
          l_0_22, l_0_23 = l_0_21:gsub, l_0_21
          l_0_22 = l_0_22(l_0_23, "\\\\", "\\")
          l_0_21 = l_0_22
          l_0_22 = mp
          l_0_22 = l_0_22.ContextualExpandEnvironmentVariables
          l_0_23 = l_0_21
          l_0_22 = l_0_22(l_0_23)
          local l_0_24 = nil
          if l_0_22 then
            l_0_23 = mp
            l_0_23 = l_0_23.IsKnownFriendlyFile
            l_0_24 = l_0_22
            l_0_23 = l_0_23(l_0_24, false, true)
            if l_0_23 == false then
              l_0_23 = table
              l_0_23 = l_0_23.insert
              l_0_24 = l_0_8
              l_0_23(l_0_24, l_0_22)
            end
          end
        end
      end
    end
    do
      l_0_11 = ipairs
      l_0_11 = l_0_11(l_0_7)
      for l_0_28,i_2 in l_0_11 do
        local l_0_27, l_0_28 = nil
        l_0_27 = contains
        local l_0_29 = nil
        l_0_28 = l_0_26.cmdline
        local l_0_30 = nil
        local l_0_31 = nil
        l_0_30 = "netsvcs"
        l_0_31 = "gpsvc"
        l_0_27, l_0_29 = l_0_27(l_0_28, l_0_29), {l_0_30, l_0_31}
        if l_0_27 then
          l_0_27 = mp
          l_0_27 = l_0_27.CLEAN
          return l_0_27
        end
        l_0_27 = l_0_26.friendly
        if not l_0_27 then
          l_0_27 = table
          l_0_27 = l_0_27.insert
          l_0_28 = l_0_10
          l_0_29 = l_0_26.ppid
          l_0_30 = ";"
          l_0_31 = l_0_26.imagePath
          l_0_29 = l_0_29 .. l_0_30 .. l_0_31
          l_0_27(l_0_28, l_0_29)
          l_0_27 = mp
          l_0_27 = l_0_27.ContextualExpandEnvironmentVariables
          l_0_28 = l_0_26.imagePath
          l_0_27 = l_0_27(l_0_28)
          if l_0_27 then
            l_0_28 = mp
            l_0_28 = l_0_28.IsKnownFriendlyFile
            l_0_29 = l_0_27
            l_0_30 = false
            l_0_31 = true
            l_0_28 = l_0_28(l_0_29, l_0_30, l_0_31)
            if l_0_28 == false then
              l_0_28 = table
              l_0_28 = l_0_28.insert
              l_0_29 = l_0_8
              l_0_30 = l_0_27
              l_0_28(l_0_29, l_0_30)
            end
          end
        end
        l_0_27 = l_0_26.shellScripts
        l_0_28 = ipairs
        l_0_29 = l_0_27
        l_0_28 = l_0_28(l_0_29)
        for l_0_31,i_2 in l_0_28 do
          local l_0_33, l_0_34 = nil
          l_0_33 = mp
          l_0_33 = l_0_33.ContextualExpandEnvironmentVariables
          l_0_34 = l_0_32
          l_0_33 = l_0_33(l_0_34)
          local l_0_35 = nil
          if l_0_33 then
            l_0_34 = mp
            l_0_34 = l_0_34.IsKnownFriendlyFile
            l_0_35 = l_0_33
            l_0_34 = l_0_34(l_0_35, false, true)
            if l_0_34 == false then
              l_0_34 = table
              l_0_34 = l_0_34.insert
              l_0_35 = l_0_8
              l_0_34(l_0_35, l_0_33)
            end
          end
        end
        if l_0_26.scriptInCmdline and next(l_0_26.scriptInCmdline) then
          for l_0_39,l_0_40 in l_0_26.scriptInCmdline do
            local l_0_37, l_0_38, l_0_39, l_0_40 = nil
            l_0_37 = l_0_36.age
            if l_0_37 ~= 0 then
              l_0_37 = l_0_36.path
              local l_0_41 = nil
              l_0_38, l_0_39 = l_0_37:gsub, l_0_37
              l_0_40 = "\\\\"
              l_0_41 = "\\"
              l_0_38 = l_0_38(l_0_39, l_0_40, l_0_41)
              l_0_37 = l_0_38
              l_0_38 = mp
              l_0_38 = l_0_38.ContextualExpandEnvironmentVariables
              l_0_39 = l_0_37
              l_0_38 = l_0_38(l_0_39)
              local l_0_42 = nil
              if l_0_38 then
                l_0_39 = mp
                l_0_39 = l_0_39.IsKnownFriendlyFile
                l_0_40 = l_0_38
                l_0_41 = false
                l_0_42 = true
                l_0_39 = l_0_39(l_0_40, l_0_41, l_0_42)
                if l_0_39 == false then
                  do
                    l_0_39 = table
                    l_0_39 = l_0_39.insert
                    l_0_40 = l_0_8
                    l_0_41 = l_0_38
                    l_0_39(l_0_40, l_0_41)
                    -- DECOMPILER ERROR at PC245: Confused about usage of register R20 for local variables in 'ReleaseLocals'

                    -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
        end
      end
      local l_0_43 = nil
      local l_0_44 = nil
      for l_0_27,l_0_49 in ipairs(l_0_8) do
        local l_0_45, l_0_46, l_0_47, l_0_48, l_0_49 = nil
        -- DECOMPILER ERROR at PC258: Confused about usage of register: R17 in 'UnsetPending'

        local l_0_50 = nil
        -- DECOMPILER ERROR at PC269: Confused about usage of register: R17 in 'UnsetPending'

        if ((l_0_26.scriptInCmdline).match)("([^\\]+)$") and ({["cmd.exe"] = true, ["powershell.exe"] = true, ["wscript.exe.exe"] = true})[((l_0_26.scriptInCmdline).match)("([^\\]+)$")] then
          (table.insert)(l_0_43, l_0_44)
        end
      end
      l_0_8 = 
      local l_0_51 = nil
      local l_0_52 = nil
      if l_0_4 >= 30 and l_0_2 == "AMSI_Exclusion" then
        for l_0_56 in l_0_3:gmatch("([^;]+)") do
          local l_0_53, l_0_54, l_0_55, l_0_56 = nil
          -- DECOMPILER ERROR at PC286: Overwrote pending register: R20 in 'AssignReg'

          -- DECOMPILER ERROR at PC287: Overwrote pending register: R21 in 'AssignReg'

          local l_0_57, l_0_58 = nil
          -- DECOMPILER ERROR at PC291: Overwrote pending register: R21 in 'AssignReg'

          -- DECOMPILER ERROR at PC292: Overwrote pending register: R21 in 'AssignReg'

          if (MpCommon.StringRegExpSearch)(l_0_43, l_0_44) then
            l_0_44(l_0_51, l_0_52)
          end
        end
      end
      do
        if (string.find)(l_0_3, "^trojan.*bulk") and l_0_2 == "AMSI" then
          (table.insert)(l_0_9, l_0_3)
        end
        if l_0_4 >= 100 and l_0_6.avExcludedEntities and next(l_0_6.avExcludedEntities) then
          local l_0_59 = nil
          for l_0_63,l_0_43 in ipairs(l_0_8) do
            local l_0_60, l_0_61, l_0_62, l_0_63, l_0_64 = nil
            -- DECOMPILER ERROR at PC331: Overwrote pending register: R21 in 'AssignReg'

            -- DECOMPILER ERROR at PC335: Overwrote pending register: R21 in 'AssignReg'

            -- DECOMPILER ERROR at PC336: Overwrote pending register: R21 in 'AssignReg'

            -- DECOMPILER ERROR at PC337: Overwrote pending register: R22 in 'AssignReg'

            -- DECOMPILER ERROR at PC338: Overwrote pending register: R23 in 'AssignReg'

            if l_0_44 then
              l_0_44(l_0_51, l_0_52)
            end
          end
        end
        do
          if not true then
            return mp.CLEAN
          end
          do
            local l_0_65 = nil
            if (l_0_2 == "AMSI" or l_0_2 == "CMD") and l_0_5 then
              (bm.trigger_sig)("Remediate_MassTampering_Q", safeJsonSerialize({Event = l_0_0, FilesToRemediate = l_0_8, ProcessesToRemediate = l_0_10, ExclusionsToRevert = l_0_9, Reason = "BlockedTampering"}))
              return mp.CLEAN
            end
            -- DECOMPILER ERROR at PC371: Confused about usage of register: R15 in 'UnsetPending'

            -- DECOMPILER ERROR at PC371: Confused about usage of register: R15 in 'UnsetPending'

            if 0 + 1 + 1 > 1 then
              ({Event = l_0_0, FilesToRemediate = l_0_8, ProcessesToRemediate = l_0_10, ExclusionsToRevert = l_0_9, Reason = "BlockedTampering"}).Reason = "MultipleSuspExclusions"
              -- DECOMPILER ERROR at PC376: Confused about usage of register: R15 in 'UnsetPending'

              ;
              (bm.trigger_sig)("Remediate_MassTampering_Z", safeJsonSerialize({Event = l_0_0, FilesToRemediate = l_0_8, ProcessesToRemediate = l_0_10, ExclusionsToRevert = l_0_9, Reason = "BlockedTampering"}))
              return mp.CLEAN
            end
            -- DECOMPILER ERROR at PC389: Confused about usage of register: R15 in 'UnsetPending'

            -- DECOMPILER ERROR at PC389: Confused about usage of register: R15 in 'UnsetPending'

            if l_0_4 > 200 and next(l_0_8) then
              ({Event = l_0_0, FilesToRemediate = l_0_8, ProcessesToRemediate = l_0_10, ExclusionsToRevert = l_0_9, Reason = "BlockedTampering"}).Reason = "HighScore_FileToRemediate"
              -- DECOMPILER ERROR at PC394: Confused about usage of register: R15 in 'UnsetPending'

              ;
              (bm.trigger_sig)("Remediate_MassTampering_W", safeJsonSerialize({Event = l_0_0, FilesToRemediate = l_0_8, ProcessesToRemediate = l_0_10, ExclusionsToRevert = l_0_9, Reason = "BlockedTampering"}))
              return mp.CLEAN
            end
            -- DECOMPILER ERROR at PC404: Confused about usage of register: R15 in 'UnsetPending'

            ;
            (bm.add_related_string)("AdditionalInfo", safeJsonSerialize({Event = l_0_0, FilesToRemediate = l_0_8, ProcessesToRemediate = l_0_10, ExclusionsToRevert = l_0_9, Reason = "BlockedTampering"}), bm.RelatedStringBMReport)
            do return mp.INFECTED end
            -- DECOMPILER ERROR at PC412: Confused about usage of register R20 for local variables in 'ReleaseLocals'

            l_0_0 = mp
            l_0_0 = l_0_0.CLEAN
            return l_0_0
          end
        end
      end
    end
  end
end

