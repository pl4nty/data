-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\138b3534f6fdc\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ppid
local l_0_2 = (bm.get_imagepath)()
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = l_0_2:match("([^\\]+)$")
local l_0_3, l_0_4 = (bm.get_process_relationships)()
if l_0_3 then
  for l_0_8,l_0_9 in ipairs(l_0_3) do
    if l_0_9.ppid and l_0_9.image_path then
      local l_0_10 = (string.lower)(l_0_9.image_path)
      if (string.find)(l_0_10, "\\program files\\microsoft onedrive\\", 1, true) then
        do
          do
            l_0_1 = l_0_9.ppid
            do break end
            -- DECOMPILER ERROR at PC52: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC52: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC52: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC52: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC52: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
end
local l_0_11, l_0_12 = startTrackingApp(l_0_1, "OneDrive", "programfiles_targeted", "PFAppTracked")
if not l_0_11 then
  (bm.trigger_sig)("ProcAttribError", safeJsonSerialize(l_0_12))
else
  if l_0_12.IsNewApp then
    l_0_12.SignatureName = "BM/SetProcAttribOneDrive"
    ;
    (bm.trigger_sig)("SetProcessAttrib", safeJsonSerialize(l_0_12))
  end
end
local l_0_13 = (mp.GetProcessCommandLine)(l_0_0.ppid)
local l_0_14, l_0_15 = CommandLineGrader(l_0_13)
local l_0_16, l_0_17 = nil, nil
do
  if (this_sigattrlog[3]).matched and ((this_sigattrlog[3]).utf8p1):match("([^\\]+)$") ~= (this_sigattrlog[3]).utf8p2 then
    local l_0_18 = "RenamedBinary[" .. l_0_1:match("pid:(%d+)") .. "][" .. (this_sigattrlog[3]).utf8p2 .. "-->" .. l_0_2 .. "]"
    l_0_16 = IncreaseProcessAnomalyScore(l_0_1, 10, l_0_18, "PFAppTracked")
  end
  local l_0_19 = true
  local l_0_20 = function(l_1_0)
  -- function num : 0_0
  l_1_0 = (mp.ContextualExpandEnvironmentVariables)(l_1_0)
  if l_1_0 then
    l_1_0 = (string.lower)(l_1_0)
  end
  local l_1_1 = {}
  local l_1_6 = "%%?program_?%s?files%%?\\microsoft onedrive\\"
  local l_1_7 = "\\appdata\\local\\microsoft\\onedrive"
  local l_1_8 = "\\windows\\system32\\"
  local l_1_9 = "%system%\\"
  do
    local l_1_10 = "\\program files %(x86%)\\microsoft onedrive\\"
    -- DECOMPILER ERROR at PC22: No list found for R1 , SetList fails

    local l_1_2 = "\\windows\\syswow64\\"
    local l_1_3 = "\\program files.*\\microsoft office"
    local l_1_4 = "\\windows\\ccmcache"
    local l_1_5 = "\\windows\\imecache\\"
    do return l_1_6(l_1_7, l_1_8, l_1_9) end
    -- DECOMPILER ERROR at PC29: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end

  if (this_sigattrlog[4]).matched then
    local l_0_21 = (this_sigattrlog[4]).utf8p1
    if not l_0_20(l_0_21) then
      if IsPotentiallyClean("CmdLine", "OneDrive" .. ";" .. l_0_2, l_0_15.CommandlineTokens) then
        return mp.CLEAN
      end
      local l_0_22 = "NoneDefaultDirectory[" .. l_0_1:match("pid:(%d+)") .. "][" .. l_0_21 .. "]"
      -- DECOMPILER ERROR at PC167: Overwrote pending register: R11 in 'AssignReg'

      l_0_16 = IncreaseProcessAnomalyScore(l_0_1, 10, l_0_22, "PFAppTracked")
      l_0_19 = false
    end
  end
  do
    local l_0_23 = nil
    do
      if l_0_16 then
        local l_0_24 = {}
        l_0_24.ProcessAttrib = l_0_17
        ;
        (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_24), bm.RelatedStringBMReport)
        l_0_23 = true
      end
      local l_0_25, l_0_26 = nil, nil
      local l_0_27 = (mp.GetParentProcInfo)()
      if l_0_27 and l_0_27.image_path then
        l_0_25 = (l_0_27.image_path):match("([^\\]+)$")
        l_0_26 = NormalizeDirectory(l_0_27.image_path)
      end
      if not l_0_25 then
        l_0_25 = "None"
      end
      local l_0_28 = {}
      l_0_28.ParentName = l_0_25
      l_0_28.ProcessName = l_0_2
      l_0_28.Source = "BM"
      l_0_28.SignatureName = "Bm/SetProcAttribOneDrive.A"
      l_0_28.TrackedProcess = "OneDrive"
      l_0_28.AttributeName = "PFAppTracked"
      l_0_28.AttributeCategory = "programfiles_targeted"
      l_0_28.CommandlineScoreIndicator = l_0_15
      l_0_28.CommandlineScore = l_0_14
      local l_0_29 = l_0_25 .. "_" .. l_0_2
      do
        if not IsPotentiallyClean("CleanProcessChain", "OneDrive", l_0_2) then
          local l_0_30, l_0_31, l_0_32 = AnomalyTableCheck("Appomaly_ChildProcName", l_0_29, 30, "MarkerRecord_OneDrive")
          if l_0_30 and not l_0_31 then
            l_0_28.AnomalyTableName = "Appomaly_ChildProcName"
            l_0_28.ProcNameWeight = GetProcessNameScore(l_0_2)
            l_0_28.AnomalyTableInfo = l_0_32
            ;
            (bm.trigger_sig)("PFAppChildProcOneDrive", safeJsonSerialize(l_0_28))
          end
        end
        ;
        (bm.trigger_sig)("AnomalousChildCommandline", safeJsonSerialize(l_0_28))
        if l_0_0.integrity_level then
          l_0_29 = l_0_25 .. "_" .. l_0_2 .. "_" .. l_0_0.integrity_level
          if not IsPotentiallyClean("CleanProcessChainPriv", "OneDrive", l_0_0.integrity_level) then
            local l_0_33, l_0_34, l_0_35 = AnomalyTableCheck("Appomaly_ChildProcPriv", l_0_29, 30, "MarkerRecord_OneDrive")
            if l_0_33 and not l_0_34 then
              l_0_28.AnomalyTableName = "Appomaly_ChildProcPriv"
              l_0_28.AnomalyTableInfo = l_0_35
              l_0_28.Key = l_0_29
              ;
              (bm.trigger_sig)("AnomalousChildPriv", safeJsonSerialize(l_0_28))
            end
          end
        end
        do
          if l_0_26 and l_0_27.image_path and not l_0_20(l_0_27.image_path) then
            l_0_29 = l_0_26 .. "_" .. l_0_25 .. "_" .. l_0_2
            if not IsPotentiallyClean("CleanProcessChain_Parent", "OneDrive", l_0_25) then
              local l_0_36, l_0_37, l_0_38 = AnomalyTableCheck("Appomaly_ParentProcName", l_0_29, 30, "MarkerRecord_OneDrive")
              if l_0_36 and not l_0_37 then
                l_0_28.Key = l_0_29
                l_0_28.AnomalyTableName = "Appomaly_ParentProcName"
                l_0_28.ProcNameWeight = GetProcessNameScore(l_0_2)
                l_0_28.AnomalyTableInfo = l_0_38
                ;
                (bm.trigger_sig)("PFAppParentProcDir", safeJsonSerialize(l_0_28))
              end
            end
          end
          do
            local l_0_39 = (bm.get_imagepath)()
            l_0_39 = (MpCommon.PathToWin32Path)(l_0_39)
            l_0_39 = NormalizeDirectory((bm.get_imagepath)())
            if l_0_39 and not l_0_19 then
              l_0_29 = l_0_25 .. "_" .. l_0_39 .. "_" .. l_0_2
              local l_0_40, l_0_41, l_0_42 = AnomalyTableCheck("Appomaly_ChildProcDir", l_0_29, 30, "MarkerRecord_OneDrive")
              if l_0_40 and not l_0_41 then
                l_0_28.AnomalyTableName = "Appomaly_ChildProcDir"
                l_0_28.ProcNameWeight = GetProcessNameScore(l_0_2)
                l_0_28.AnomalyTableInfo = l_0_42
                l_0_28.Key = l_0_29
                ;
                (bm.trigger_sig)("PFAppChildProcDir", safeJsonSerialize(l_0_28))
              end
            end
            do
              if l_0_23 then
                return mp.INFECTED
              end
              return mp.CLEAN
            end
          end
        end
      end
    end
  end
end

