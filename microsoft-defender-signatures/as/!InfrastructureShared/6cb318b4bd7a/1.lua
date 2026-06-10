-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6cb318b4bd7a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 and l_0_0.image_path and (l_0_0.image_path):match("([^\\]+)$") ~= "node.exe" then
  return mp.CLEAN
end
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)(l_0_0.ppid)
do
  if l_0_1 and l_0_1.image_path then
    local l_0_2 = (l_0_1.image_path):match("([^\\]+)$")
    if l_0_2 ~= "node.exe" and l_0_2 ~= "npm.exe" then
      return mp.CLEAN
    end
  end
  local l_0_3 = nil
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
    l_0_3 = (this_sigattrlog[1]).utf8p2
  end
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
    l_0_3 = (this_sigattrlog[2]).utf8p2
  end
  if l_0_3 then
    local l_0_4 = contains
    local l_0_5 = l_0_3
    local l_0_6 = {}
    -- DECOMPILER ERROR at PC81: No list found for R5 , SetList fails

  end
  -- DECOMPILER ERROR at PC85: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC86: Overwrote pending register: R3 in 'AssignReg'

  if not l_0_4 then
    return l_0_4
  end
  -- DECOMPILER ERROR at PC88: Overwrote pending register: R3 in 'AssignReg'

  l_0_4()
  -- DECOMPILER ERROR at PC90: Overwrote pending register: R3 in 'AssignReg'

  local l_0_7 = " install"
  local l_0_8 = " ci"
  local l_0_9 = " update"
  -- DECOMPILER ERROR at PC94: Overwrote pending register: R6 in 'AssignReg'

  local l_0_10, l_0_11 = " rebuild"
  if l_0_7 then
    l_0_9 = ipairs
    l_0_10 = l_0_7
    l_0_9 = l_0_9(l_0_10)
    for l_0_15,l_0_16 in l_0_9 do
      local l_0_14, l_0_15, l_0_16 = nil
      l_0_14 = l_0_13.ppid
      if l_0_14 then
        l_0_14 = l_0_13.image_path
        if l_0_14 then
          l_0_14 = string
          l_0_14 = l_0_14.lower
          l_0_15 = l_0_13.image_path
          l_0_14 = l_0_14(l_0_15)
          local l_0_17 = nil
          l_0_15 = string
          l_0_15 = l_0_15.find
          l_0_16 = l_0_14
          l_0_17 = "npm."
          l_0_15 = l_0_15(l_0_16, l_0_17, 1, true)
          if not l_0_15 then
            l_0_15 = string
            l_0_15 = l_0_15.find
            l_0_16 = l_0_14
            l_0_17 = "node.exe"
            l_0_15 = l_0_15(l_0_16, l_0_17, 1, true)
          end
          if l_0_15 then
            l_0_15 = mp
            l_0_15 = l_0_15.GetProcessCommandLine
            l_0_16 = l_0_13.ppid
            l_0_15 = l_0_15(l_0_16)
            local l_0_18 = nil
            if l_0_15 then
              l_0_16 = MpCommon
              l_0_16 = l_0_16.StringRegExpSearch
              l_0_17 = "npm(?:\\.cmd|\\.exe|-cli\\.js)?[\\\\\\\"\\s]+(?:install|i|update)\\s+([@\\w\\-/\\.]+)"
              l_0_18 = l_0_15
              l_0_16 = l_0_16(l_0_17, l_0_18)
              local l_0_19, l_0_20 = nil
              if l_0_17 then
                l_0_18 = string
                l_0_18 = l_0_18.sub
                l_0_19 = 
                l_0_20 = 1
                l_0_18 = l_0_18(l_0_19, l_0_20, 1)
                if l_0_18 ~= "-" then
                  l_0_18 = table
                  l_0_18 = l_0_18.insert
                  local l_0_21 = nil
                  l_0_19, l_0_6 = l_0_6, {}
                  local l_0_22 = nil
                  local l_0_23 = nil
                  l_0_18(l_0_19, l_0_20)
                  l_0_20 = {cmd = l_0_15, pkgname = l_0_17}
                else
                  do
                    l_0_18 = l_0_4
                    l_0_19 = l_0_15
                    l_0_18 = l_0_18(l_0_19)
                    local l_0_24 = nil
                    if l_0_18 then
                      l_0_19 = table
                      l_0_19 = l_0_19.insert
                      local l_0_25 = nil
                      l_0_20 = l_0_6
                      local l_0_26 = nil
                      local l_0_27 = nil
                      l_0_19(l_0_20, l_0_24)
                      l_0_24 = {cmd = l_0_15, pkgname = l_0_18}
                    end
                    do
                      -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                      -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  local l_0_28, l_0_29 = nil
  local l_0_30 = nil
  local l_0_31 = nil
  -- DECOMPILER ERROR at PC186: Overwrote pending register: R13 in 'AssignReg'

  ;
  (bm.add_related_string)(l_0_28, l_0_29, l_0_30)
  -- DECOMPILER ERROR at PC189: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC190: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC194: Overwrote pending register: R13 in 'AssignReg'

  if l_0_28 then
    for l_0_36,l_0_37 in l_0_30 do
      local l_0_36, l_0_37 = nil
      -- DECOMPILER ERROR at PC201: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC204: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC205: Overwrote pending register: R18 in 'AssignReg'

      if l_0_36 and l_0_36 then
        do
          do
            local l_0_38 = nil
            -- DECOMPILER ERROR at PC208: Overwrote pending register: R19 in 'AssignReg'

            -- DECOMPILER ERROR at PC209: Overwrote pending register: R19 in 'AssignReg'

            -- DECOMPILER ERROR at PC217: Overwrote pending register: R19 in 'AssignReg'

            -- DECOMPILER ERROR at PC218: Overwrote pending register: R19 in 'AssignReg'

            -- DECOMPILER ERROR at PC219: Overwrote pending register: R20 in 'AssignReg'

            -- DECOMPILER ERROR at PC226: Overwrote pending register: R10 in 'AssignReg'

            if l_0_37 or l_0_37 then
              break
            end
            -- DECOMPILER ERROR at PC228: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC228: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC228: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  -- DECOMPILER ERROR at PC232: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC233: Confused about usage of register: R10 in 'UnsetPending'

  -- DECOMPILER ERROR at PC233: Overwrote pending register: R14 in 'AssignReg'

  if nil then
    local l_0_39, l_0_40 = nil
    if not l_0_30(l_0_31, "npm", "programfiles_targeted", "PFAppTracked") then
      l_0_39 = bm
      l_0_39 = l_0_39.trigger_sig
      l_0_40 = "ProcAttribError"
      -- DECOMPILER ERROR at PC244: Overwrote pending register: R18 in 'AssignReg'

      l_0_39(l_0_40, safeJsonSerialize(l_0_36))
    else
      l_0_39 = l_0_31.IsNewApp
      if l_0_39 then
        l_0_31.SignatureName = "Bm/PFApp_SuspChildNpm.B"
        l_0_39 = bm
        l_0_39 = l_0_39.trigger_sig
        l_0_40 = "SetProcessAttrib"
        l_0_39(l_0_40, safeJsonSerialize(R18_PC257))
      end
    end
    l_0_39 = nil
    local l_0_41 = nil
    l_0_40 = mp
    l_0_40 = l_0_40.GetParentProcInfo
    l_0_40 = l_0_40()
    local l_0_42 = nil
    if l_0_40 then
      l_0_41 = l_0_40.image_path
      if l_0_41 then
        l_0_41 = l_0_40.image_path
        l_0_41, l_0_42 = l_0_41:match, l_0_41
        -- DECOMPILER ERROR at PC270: Overwrote pending register: R19 in 'AssignReg'

        l_0_41 = l_0_41(l_0_42, l_0_37)
        l_0_39 = l_0_41
      end
    end
    if not l_0_39 then
      l_0_39 = "None"
    end
    l_0_41 = bm
    l_0_41 = l_0_41.get_imagepath
    l_0_41 = l_0_41()
    if not l_0_41 then
      l_0_41 = ""
      local l_0_43, l_0_44 = , l_0_38
    end
    do
      l_0_42 = l_0_42(l_0_41, "([^\\]+)$")
      local l_0_45 = nil
      if l_0_42 then
        local l_0_46 = nil
        l_0_46 = bm
        l_0_46 = l_0_46.get_current_process_startup_info
        l_0_46 = l_0_46()
        local l_0_47 = nil
        if l_0_46 then
          l_0_47 = l_0_46.ppid
          if l_0_47 then
            l_0_47 = mp
            l_0_47 = l_0_47.GetProcessCommandLine
            l_0_47 = l_0_47(l_0_46.ppid)
            local l_0_48 = nil
            l_0_48 = CommandLineGrader
            l_0_48 = l_0_48(l_0_47)
            local l_0_49 = nil
          end
        end
        do
          do
            l_0_47 = l_0_39
            l_0_47 = l_0_47 .. "_" .. l_0_42
            local l_0_50 = nil
            l_0_50 = AnomalyTableCheck
            l_0_50 = l_0_50("Appomaly_ChildProcName", l_0_47, 30, "MarkerRecord_Npm")
            local l_0_51, l_0_52, l_0_53 = nil
            if l_0_50 and not l_0_51 then
              l_0_53 = bm
              l_0_53 = l_0_53.trigger_sig
              l_0_53("PFAppChildProc_E", safeJsonSerialize(l_0_45))
            end
            l_0_53 = ipairs
            l_0_53 = l_0_53(l_0_6)
            for l_0_57,l_0_58 in l_0_53 do
              local l_0_58 = nil
              l_0_58 = l_0_39
              l_0_58 = l_0_58 .. "_" .. l_0_42 .. "_" .. l_0_57.pkgname
              local l_0_59 = nil
              l_0_59 = AnomalyTableCheck
              l_0_59 = l_0_59("Appomaly_ChildProcName", l_0_58, 30, "MarkerRecord_Npm")
              local l_0_60, l_0_61, l_0_62 = nil
              if l_0_59 and not l_0_60 then
                l_0_45.AnomalyTableName = "Appomaly_ChildProcName"
                l_0_45.AnomalyTableInfo = l_0_61
                l_0_45.Key = l_0_58
                l_0_62 = bm
                l_0_62 = l_0_62.trigger_sig
                l_0_62("PFAppChildProc_E", safeJsonSerialize(l_0_45))
              end
            end
            ;
            (bm.trigger_sig)("AnomalousChildCommandline", safeJsonSerialize(l_0_45))
            -- DECOMPILER ERROR at PC374: Confused about usage of register R25 for local variables in 'ReleaseLocals'

            do return mp.INFECTED end
            -- DECOMPILER ERROR at PC377: Confused about usage of register R14 for local variables in 'ReleaseLocals'

          end
        end
      end
    end
  end
end

