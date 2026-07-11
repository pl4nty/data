-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\71b357779c62\1.luac 

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
  local l_0_9 = " ci"
  local l_0_10 = " update"
  -- DECOMPILER ERROR at PC96: Overwrote pending register: R7 in 'AssignReg'

  local l_0_11, l_0_12 = " rebuild"
  if l_0_9 then
    l_0_11 = ipairs
    l_0_12 = l_0_9
    l_0_11 = l_0_11(l_0_12)
    for l_0_16,l_0_17 in l_0_11 do
      local l_0_16, l_0_17 = nil
      l_0_16 = l_0_15.ppid
      if l_0_16 then
        l_0_16 = l_0_15.image_path
        if l_0_16 then
          l_0_16 = string
          l_0_16 = l_0_16.lower
          l_0_17 = l_0_15.image_path
          l_0_16 = l_0_16(l_0_17)
          local l_0_18 = nil
          l_0_17 = string
          l_0_17 = l_0_17.find
          l_0_18 = l_0_16
          l_0_17 = l_0_17(l_0_18, "npm.exe", 1, true)
          if not l_0_17 then
            l_0_17 = string
            l_0_17 = l_0_17.find
            l_0_18 = l_0_16
            l_0_17 = l_0_17(l_0_18, "node.exe", 1, true)
          end
          if l_0_17 then
            l_0_17 = string
            l_0_17 = l_0_17.find
            l_0_18 = l_0_16
            l_0_17 = l_0_17(l_0_18, "install", 1, true)
            if l_0_17 then
              l_0_17 = mp
              l_0_17 = l_0_17.GetProcessCommandLine
              l_0_18 = l_0_15.ppid
              l_0_17 = l_0_17(l_0_18)
              local l_0_19 = nil
              if l_0_17 then
                l_0_18 = l_0_5
                l_0_19 = l_0_17
                l_0_18 = l_0_18(l_0_19)
                local l_0_20 = nil
                if l_0_18 then
                  l_0_19 = l_0_18.name
                  if l_0_19 then
                    l_0_19 = table
                    l_0_19 = l_0_19.insert
                    local l_0_21 = nil
                    l_0_20, l_0_7 = l_0_7, {}
                    local l_0_22 = nil
                    local l_0_23 = nil
                    l_0_22 = l_0_18.name
                    l_0_22 = l_0_18.version
                    l_0_19(l_0_20, l_0_21)
                    l_0_21 = {cmd = l_0_17, pkgname = l_0_22, version = l_0_22}
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  do
    local l_0_24, l_0_25 = nil
    -- DECOMPILER ERROR at PC172: Overwrote pending register: R11 in 'AssignReg'

    local l_0_26 = nil
    local l_0_27 = nil
    l_0_26 = safeJsonSerialize(l_0_6) or l_0_6 or ""
    l_0_27 = bm
    l_0_27 = l_0_27.RelatedStringBMReport
    l_0_24(l_0_25, l_0_26, l_0_27)
    -- DECOMPILER ERROR at PC182: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC183: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC184: Overwrote pending register: R12 in 'AssignReg'

    l_0_25 = l_0_25()
    if l_0_25 then
      l_0_27 = ipairs
      l_0_27 = l_0_27(l_0_25)
      for l_0_32,l_0_33 in l_0_27 do
        local l_0_33 = nil
        l_0_33 = l_0_32.ppid
        if l_0_33 then
          l_0_33 = l_0_32.image_path
          if l_0_33 then
            l_0_33 = string
            l_0_33 = l_0_33.lower
            l_0_33 = l_0_33(l_0_32.image_path)
            do
              do
                local l_0_34 = nil
                l_0_34 = string
                l_0_34 = l_0_34.find
                l_0_34 = l_0_34(l_0_33, "npm.exe", 1, true)
                if not l_0_34 then
                  l_0_34 = string
                  l_0_34 = l_0_34.find
                  l_0_34 = l_0_34(l_0_33, "node.exe", 1, true)
                end
                -- DECOMPILER ERROR at PC220: Overwrote pending register: R11 in 'AssignReg'

                if l_0_34 then
                  break
                end
                -- DECOMPILER ERROR at PC222: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC222: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC222: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC222: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC222: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
    if l_0_24 then
      local l_0_35, l_0_36 = nil
      if not startTrackingApp(l_0_24, "npm", "programfiles_targeted", "PFAppTracked") then
        l_0_36 = bm
        l_0_36 = l_0_36.trigger_sig
        l_0_36("ProcAttribError", safeJsonSerialize(l_0_35))
      else
        l_0_36 = l_0_35.IsNewApp
        if l_0_36 then
          l_0_35.SignatureName = "Bm/PFApp_SuspChildNpm.B"
          l_0_36 = bm
          l_0_36 = l_0_36.trigger_sig
          l_0_36("SetProcessAttrib", safeJsonSerialize(l_0_35))
        end
      end
      l_0_36 = nil
      local l_0_37 = nil
      l_0_37 = mp
      l_0_37 = l_0_37.GetParentProcInfo
      l_0_37 = l_0_37()
      local l_0_38 = nil
      if l_0_37 then
        l_0_38 = l_0_37.image_path
        if l_0_38 then
          l_0_38 = l_0_37.image_path
          l_0_38 = l_0_38(l_0_38, "([^\\]+)$")
          l_0_36 = l_0_38
        end
      end
      if not l_0_36 then
        l_0_36 = "None"
      end
      l_0_38 = bm
      l_0_38 = l_0_38.get_imagepath
      l_0_38 = l_0_38()
      if not l_0_38 then
        l_0_38 = ""
        local l_0_39, l_0_40 = nil
      end
      do
        local l_0_41 = l_0_38:match("([^\\]+)$")
        if l_0_41 then
          local l_0_42 = {}
          l_0_42.ProcessName = l_0_41
          l_0_42.ParentName = l_0_36
          l_0_42.Source = "BM"
          l_0_42.SignatureName = "Bm/PFApp_SuspChildNpm.B"
          l_0_42.AttributeName = "PFAppTracked"
          l_0_42.AttributeCategory = "programfiles_targeted"
          l_0_42.TrackedProcess = "npm"
          local l_0_43 = (bm.get_current_process_startup_info)()
          if l_0_43 and l_0_43.ppid then
            local l_0_44 = (mp.GetProcessCommandLine)(l_0_43.ppid)
            local l_0_45 = CommandLineGrader(l_0_44)
            l_0_42.CommandlineScoreIndicator = l_0_44
            l_0_42.CommandlineScore = l_0_45
          end
          do
            local l_0_46 = l_0_36 .. "_" .. l_0_41
            do
              local l_0_47, l_0_48, l_0_49 = AnomalyTableCheck("Appomaly_ChildProcName", l_0_46, 30, "MarkerRecord_Npm")
              if l_0_47 and not l_0_48 then
                l_0_42.AnomalyTableName = "Appomaly_ChildProcName"
                l_0_42.AnomalyTableInfo = l_0_49
                l_0_42.Key = l_0_46
                ;
                (bm.trigger_sig)("PFAppChildProc_E", safeJsonSerialize(l_0_42))
              end
              for l_0_53,l_0_54 in ipairs(l_0_7) do
                local l_0_55 = l_0_36 .. "_" .. l_0_41 .. "_" .. l_0_54.pkgname
                local l_0_56, l_0_57, l_0_58 = AnomalyTableCheck("Appomaly_ChildProcName", l_0_55, 30, "MarkerRecord_Npm_" .. l_0_54.pkgname)
                if l_0_56 and not l_0_57 then
                  l_0_42.AnomalyTableName = "Appomaly_ChildProcName"
                  l_0_42.AnomalyTableInfo = l_0_58
                  l_0_42.Key = l_0_55
                  ;
                  (bm.trigger_sig)("PFAppChildProc_E", safeJsonSerialize(l_0_42))
                end
              end
              ;
              (bm.trigger_sig)("AnomalousChildCommandline", safeJsonSerialize(l_0_42))
              do
                local l_0_59, l_0_60 = nil
                if not pcall(reportBmInfo) and l_0_59 then
                  l_0_60 = bm
                  l_0_60 = l_0_60.add_related_string
                  l_0_60("bmInfoFailReason", tostring(l_0_59), bm.RelatedStringBMReport)
                end
                l_0_60 = mp
                l_0_60 = l_0_60.INFECTED
                do return l_0_60 end
                -- DECOMPILER ERROR at PC390: Confused about usage of register R14 for local variables in 'ReleaseLocals'

              end
            end
          end
        end
      end
    end
  end
end

