-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1c6b35797f113\0x0000c4cc_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1 = nil
do
  if not (MpCommon.GetProcessAttributeValue)(l_0_0.ppid, "inherit:PFApp_Parent") then
    local l_0_2, l_0_3 = (MpCommon.GetProcessAttributeValue)(l_0_0.ppid, "PFApp_Parent")
  end
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

  if l_0_2 then
    local l_0_4 = nil
    if safeJsonDeserialize(l_0_2) then
      l_0_1 = (safeJsonDeserialize(l_0_2)).AppName
    else
      l_0_1 = l_0_4:match("[^|]+")
    end
  else
    do
      do
        local l_0_5 = "None"
        if (this_sigattrlog[1]).matched then
          l_0_1 = ((this_sigattrlog[1]).utf8p1):match("([^\\]+)$")
        else
          if (this_sigattrlog[2]).matched then
            l_0_1 = ((this_sigattrlog[2]).utf8p1):match("([^\\]+)$")
          else
            if (this_sigattrlog[3]).matched then
              l_0_1 = ((this_sigattrlog[3]).utf8p1):match("([^\\]+)$")
            else
              if (this_sigattrlog[4]).matched then
                l_0_1 = ((this_sigattrlog[4]).utf8p1):match("([^\\]+)$")
              else
                if (this_sigattrlog[5]).matched then
                  l_0_1 = ((this_sigattrlog[5]).utf8p1):match("([^\\]+)$")
                else
                  if (this_sigattrlog[6]).matched then
                    l_0_1 = ((this_sigattrlog[6]).utf8p1):match("([^\\]+)$")
                  else
                    if (this_sigattrlog[7]).matched then
                      l_0_1 = ((this_sigattrlog[7]).utf8p1):match("([^\\]+)$")
                    end
                  end
                end
              end
            end
          end
        end
        local l_0_6 = nil
        if not (bm.get_connection_string)() then
          return mp.CLEAN
        end
        local l_0_7 = nil
        if not ((bm.get_connection_string)()):match("Uri=(.-;)") then
          return mp.CLEAN
        end
        local l_0_8 = nil
        if not (((bm.get_connection_string)()):match("Uri=(.-;)")):match("^%a+://([^:/]+)") then
          return mp.CLEAN
        end
        local l_0_9, l_0_10 = (string.lower)((((bm.get_connection_string)()):match("Uri=(.-;)")):match("^%a+://([^:/]+)")), nil
        local l_0_11 = nil
        local l_0_12 = {TrackedProcess = l_0_1, SignatureName = "PFAppAnomalousOutbound.B", AnomalyTableName = "Appomaly_Network_HOST", Key = l_0_1 .. "_" .. l_0_9}
        local l_0_13 = nil
        local l_0_14 = (MpCommon.AnomalyEventLookup)("Appomaly_Network_HOST", "MarkerRecord_" .. l_0_1, 1)
        local l_0_15 = nil
        -- DECOMPILER ERROR at PC186: Overwrote pending register: R12 in 'AssignReg'

        if l_0_14 and l_0_14.Count then
          if l_0_10 then
            (bm.trigger_sig)("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_12))
          else
            ;
            (bm.trigger_sig)("AnomalyTable_Error", safeJsonSerialize(l_0_12))
            return mp.CLEAN
          end
        end
        local l_0_16 = nil
        local l_0_17 = (l_0_15 - (MpCommon.GetCurrentTimeT)()) / 60
        local l_0_18 = nil
        if not (MpCommon.AnomalyEventLookup)(l_0_13, l_0_1 .. "_" .. l_0_9, 1) then
          if l_0_17 > 43200 then
            l_0_12.minutes_elapsed = l_0_17
            l_0_12.isTest = "false"
            l_0_12.processAttrib = l_0_6
            ;
            (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_12), bm.RelatedStringBMReport)
            return mp.INFECTED
          else
            -- DECOMPILER ERROR at PC262: Overwrote pending register: R7 in 'AssignReg'

            -- DECOMPILER ERROR at PC263: Overwrote pending register: R6 in 'AssignReg'

          end
        else
          local l_0_19 = nil
          -- DECOMPILER ERROR at PC275: Overwrote pending register: R7 in 'AssignReg'

          -- DECOMPILER ERROR at PC276: Overwrote pending register: R6 in 'AssignReg'

        end
        do
          if not l_0_10 then
            l_0_12.Key = l_0_18
            l_0_12.Error = l_0_11
            ;
            (bm.trigger_sig)("AnomalyTable_Error", safeJsonSerialize(l_0_12))
          end
          return mp.CLEAN
        end
      end
    end
  end
end

