-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4ab3cbae62e3\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = "ruby.exe"
local l_0_1 = (bm.get_imagepath)()
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = contains
local l_0_3 = l_0_1
local l_0_4 = {}
-- DECOMPILER ERROR at PC14: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC18: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC19: Overwrote pending register: R2 in 'AssignReg'

if l_0_2 then
  return l_0_2
end
-- DECOMPILER ERROR at PC21: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC26: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC27: Overwrote pending register: R3 in 'AssignReg'

if not l_0_2 then
  return l_0_3
end
-- DECOMPILER ERROR at PC29: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC30: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC32: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC32: Overwrote pending register: R4 in 'AssignReg'

local l_0_5 = "conhost.exe"
local l_0_6 = {}
l_0_6.TrackedProcess = l_0_0
l_0_6.SignatureName = "Behavior:Win32/PFAppChildProc.C"
if l_0_3 and MpCommon.SECURITY_MANDATORY_MEDIUM_RID < l_0_3.integrity_level then
  local l_0_7 = "Appomaly_ChildProcPriv"
  local l_0_8 = (MpCommon.AnomalyEventLookup)(l_0_7, "MarkerRecord_" .. l_0_0, 1)
  local l_0_9 = (MpCommon.GetCurrentTimeT)()
  local l_0_10 = l_0_9
  local l_0_11 = l_0_0 .. "_" .. l_0_2 .. "_" .. l_0_3.integrity_level
  l_0_6.AnomalyTableName = "Appomaly_ChildProcPriv"
  l_0_6.Key = l_0_11
  if l_0_8 and l_0_8.Count then
    l_0_10 = l_0_8.Count
    local l_0_12 = (l_0_9 - l_0_10) / 60
    local l_0_13 = (MpCommon.AnomalyEventLookup)(l_0_7, l_0_11, 1)
    if not l_0_13 then
      if l_0_12 > 28800 then
        l_0_6.AnomalyTableInfo = (MpCommon.AnomalyTableLookup)(l_0_7)
        ;
        (bm.trigger_sig)("AnomalousChildPriv", safeJsonSerialize(l_0_6))
      else
        -- DECOMPILER ERROR at PC104: Overwrote pending register: R4 in 'AssignReg'

      end
    else
      -- DECOMPILER ERROR at PC115: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC116: Overwrote pending register: R4 in 'AssignReg'

    end
  else
    do
      do
        l_0_10 = l_0_9
        -- DECOMPILER ERROR at PC129: Overwrote pending register: R5 in 'AssignReg'

        -- DECOMPILER ERROR at PC130: Overwrote pending register: R4 in 'AssignReg'

        if l_0_4 then
          (bm.trigger_sig)("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_6))
          -- DECOMPILER ERROR at PC148: Overwrote pending register: R5 in 'AssignReg'

          -- DECOMPILER ERROR at PC149: Overwrote pending register: R4 in 'AssignReg'

        end
        if not l_0_4 then
          l_0_6.Error = l_0_5
          ;
          (bm.trigger_sig)("AnomalyTable_Error", safeJsonSerialize(l_0_6))
        end
        local l_0_14 = "Appomaly_ChildProcName"
        local l_0_15 = (MpCommon.AnomalyEventLookup)(l_0_14, "MarkerRecord_" .. l_0_0, 1)
        local l_0_16 = 0
        local l_0_17 = (MpCommon.GetCurrentTimeT)()
        local l_0_18 = l_0_0 .. "_" .. l_0_2
        l_0_6.AnomalyTableName = "Appomaly_ChildProcName"
        l_0_6.Key = l_0_18
        if l_0_15 and l_0_15.Count then
          l_0_16 = l_0_15.Count
          local l_0_19 = (l_0_17 - l_0_16) / 60
          local l_0_20 = (MpCommon.AnomalyEventLookup)(l_0_14, l_0_18, 1)
          if not l_0_20 then
            if l_0_19 > 28800 then
              l_0_6.AnomalyTableInfo = (MpCommon.AnomalyTableLookup)(l_0_14)
              add_parents()
              local l_0_21 = (bm.get_current_process_startup_info)()
              if l_0_21 then
                local l_0_22 = (mp.GetProcessCommandLine)(l_0_21.ppid)
                local l_0_23 = CommandLineGrader(l_0_22)
                l_0_6.CommandlineScore = l_0_23
                l_0_6.CommandlineScoreIndicator = l_0_22
              end
              do
                local l_0_24 = {}
                l_0_24["cmd.exe"] = 10
                l_0_24["powershell.exe"] = 10
                l_0_24["reg.exe"] = 5
                l_0_24.pwsh = 10
                l_0_24["net.exe"] = 5
                l_0_24["wmic.exe"] = 5
                l_0_24["net1.exe"] = 5
                l_0_24["rundll32.exe"] = 5
                do
                  do
                    do
                      local l_0_25 = l_0_24[(string.lower)(l_0_2)] or 0
                      -- DECOMPILER ERROR at PC235: Confused about usage of register: R16 in 'UnsetPending'

                      l_0_6.ProcNameWeight = l_0_25
                      ;
                      (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_6), bm.RelatedStringBMReport)
                      do return mp.INFECTED end
                      -- DECOMPILER ERROR at PC257: Overwrote pending register: R5 in 'AssignReg'

                      -- DECOMPILER ERROR at PC258: Overwrote pending register: R4 in 'AssignReg'

                      -- DECOMPILER ERROR at PC269: Overwrote pending register: R5 in 'AssignReg'

                      -- DECOMPILER ERROR at PC270: Overwrote pending register: R4 in 'AssignReg'

                      l_0_16 = l_0_17
                      -- DECOMPILER ERROR at PC283: Overwrote pending register: R5 in 'AssignReg'

                      -- DECOMPILER ERROR at PC284: Overwrote pending register: R4 in 'AssignReg'

                      if l_0_4 then
                        (bm.trigger_sig)("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_6))
                        -- DECOMPILER ERROR at PC302: Overwrote pending register: R5 in 'AssignReg'

                        -- DECOMPILER ERROR at PC303: Overwrote pending register: R4 in 'AssignReg'

                      end
                      if not l_0_4 then
                        l_0_6.Error = l_0_5
                        ;
                        (bm.trigger_sig)("AnomalyTable_Error", safeJsonSerialize(l_0_6))
                      end
                      local l_0_26 = {}
                      l_0_26.ParentName = l_0_0
                      l_0_26.ProcessName = l_0_2
                      l_0_26.Source = "BM"
                      l_0_26.SignatureName = "Behavior:Win32/PFAppChildProc.C"
                      l_0_26.AnomalyTableName = "Appomaly_ChildProcName_CmdLine"
                      l_0_26.TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine")
                      l_0_26.AttributeName = "PFApp_Parent"
                      l_0_26.AttributeCategory = "PFServers"
                      l_0_26.CommandlineScoreIndicator = l_0_6.CommandlineScoreIndicator
                      l_0_26.CommandlineScore = l_0_6.CommandlineScore
                      ;
                      (bm.trigger_sig)("AnomalousChildCommandline", safeJsonSerialize(l_0_26))
                      return mp.CLEAN
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
end

