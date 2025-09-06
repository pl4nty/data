-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\47ab3c73c760b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = false
local l_0_1 = nil
if (this_sigattrlog[5]).matched then
  l_0_1 = "httpd.exe"
else
  if (this_sigattrlog[6]).matched then
    l_0_1 = ((this_sigattrlog[6]).utf8p1):match("([^\\]+)$")
  else
    if (this_sigattrlog[7]).matched then
      l_0_1 = "nginx.exe"
    else
      if (this_sigattrlog[8]).matched then
        l_0_1 = "w3wp.exe"
      else
        if (this_sigattrlog[9]).matched then
          l_0_1 = "sqlservr.exe"
        else
          if (this_sigattrlog[10]).matched then
            l_0_1 = ((this_sigattrlog[10]).utf8p1):match("([^\\]+)$")
          end
        end
      end
    end
  end
end
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = (bm.get_current_process_startup_info)()
if l_0_2 and l_0_2.ppid then
  do
    if not (MpCommon.GetProcessAttributeValue)(l_0_2.ppid, "inherit:PFApp_Parent") then
      local l_0_3, l_0_4 = (MpCommon.GetProcessAttributeValue)(l_0_2.ppid, "PFApp_Parent")
    end
    -- DECOMPILER ERROR at PC80: Confused about usage of register: R3 in 'UnsetPending'

    -- DECOMPILER ERROR at PC85: Confused about usage of register: R3 in 'UnsetPending'

    if l_0_3 then
      (bm.add_related_string)("procAttrib", l_0_3, bm.RelatedStringBMReport)
    end
    local l_0_5 = nil
    if (this_sigattrlog[11]).matched then
      l_0_5 = (this_sigattrlog[11]).utf8p1
      local l_0_6 = {}
      -- DECOMPILER ERROR at PC108: No list found for R4 , SetList fails

      -- DECOMPILER ERROR at PC109: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC110: Overwrote pending register: R6 in 'AssignReg'

      for l_0_10,l_0_11 in ("Behavior:Win32/MpTamperEx.B")("Behavior:Win32/MuprocMpTamperPreference.gen!A") do
        -- DECOMPILER ERROR at PC113: Overwrote pending register: R10 in 'AssignReg'

        -- DECOMPILER ERROR at PC115: Overwrote pending register: R11 in 'AssignReg'

        -- DECOMPILER ERROR at PC116: Overwrote pending register: R12 in 'AssignReg'

        if (("Behavior:Win32/MpTamperRTP.D").find)("Behavior:Win32/MpTamperSrv.A", "Behavior:Win32/MpTamperPShell.A") then
          break
        end
      end
    else
      do
        -- DECOMPILER ERROR at PC133: Overwrote pending register: R0 in 'AssignReg'

        -- DECOMPILER ERROR at PC142: Overwrote pending register: R3 in 'AssignReg'

        if not (this_sigattrlog[12]).matched or (this_sigattrlog[13]).matched then
          local l_0_12 = {}
          -- DECOMPILER ERROR at PC152: Overwrote pending register: R13 in 'AssignReg'

          -- DECOMPILER ERROR at PC155: No list found for R4 , SetList fails

          -- DECOMPILER ERROR at PC156: Overwrote pending register: R5 in 'AssignReg'

          -- DECOMPILER ERROR at PC157: Overwrote pending register: R6 in 'AssignReg'

          for l_0_16,l_0_17 in ("Trojan:Win32/MpTamperSrvDisableAV.D")("Trojan:Win32/MpTamperSrvDisableAV.H") do
            -- DECOMPILER ERROR at PC160: Overwrote pending register: R10 in 'AssignReg'

            -- DECOMPILER ERROR at PC162: Overwrote pending register: R11 in 'AssignReg'

            -- DECOMPILER ERROR at PC163: Overwrote pending register: R12 in 'AssignReg'

            -- DECOMPILER ERROR at PC167: Overwrote pending register: R0 in 'AssignReg'

            if (("Trojan:Win32/MpTamperSrvDisableAV.L").find)("Trojan:Win32/MpTamperDisableFeatureWd.A", "Trojan:Win32/MpTamperDisableFeatureWd.B") then
              break
            end
          end
        else
          do
            -- DECOMPILER ERROR at PC179: Overwrote pending register: R3 in 'AssignReg'

            -- DECOMPILER ERROR at PC180: Overwrote pending register: R0 in 'AssignReg'

            -- DECOMPILER ERROR at PC189: Overwrote pending register: R3 in 'AssignReg'

            -- DECOMPILER ERROR at PC197: Overwrote pending register: R0 in 'AssignReg'

            if not (this_sigattrlog[14]).matched or (this_sigattrlog[15]).matched then
              if not (MpCommon.StringRegExpSearch)("(?i)(MpTamperBulkExcl|MPTamperSuspExlc.C|SrvDisableAV|DisableFeature)", l_0_5) or (this_sigattrlog[15]).utf8p2 == "INFECTED" then
                (bm.add_related_string)("AMSI_Detection", l_0_5 .. "|" .. "INFECTED", bm.RelatedStringBMReport)
              else
                if (this_sigattrlog[15]).utf8p2 == "LOFI" then
                  (bm.add_related_string)("AMSI_Detection", l_0_5 .. "|" .. "LOFI", bm.RelatedStringBMReport)
                end
              end
            else
              -- DECOMPILER ERROR at PC237: Overwrote pending register: R3 in 'AssignReg'

              -- DECOMPILER ERROR at PC238: Overwrote pending register: R0 in 'AssignReg'

            end
            -- DECOMPILER ERROR at PC247: Overwrote pending register: R3 in 'AssignReg'

            -- DECOMPILER ERROR at PC248: Overwrote pending register: R0 in 'AssignReg'

            -- DECOMPILER ERROR at PC257: Overwrote pending register: R3 in 'AssignReg'

            -- DECOMPILER ERROR at PC258: Overwrote pending register: R0 in 'AssignReg'

            if ((not (this_sigattrlog[16]).matched or (this_sigattrlog[17]).matched) and not (this_sigattrlog[18]).matched) or not l_0_5 then
              return mp.CLEAN
            end
            local l_0_18 = function(l_1_0, l_1_1)
  -- function num : 0_0
  local l_1_2 = {}
  -- DECOMPILER ERROR at PC5: No list found for R2 , SetList fails

  local l_1_3 = false
  -- DECOMPILER ERROR at PC7: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC8: Overwrote pending register: R5 in 'AssignReg'

  for l_1_7,l_1_8 in ("w3wp")("sqlservr") do
    if (string.find)(l_1_1, l_1_8) then
      l_1_3 = true
      break
    end
  end
  do
    if not l_1_3 then
      return false
    end
    do
      local l_1_9 = {}
      -- DECOMPILER ERROR at PC34: No list found for R4 , SetList fails

      -- DECOMPILER ERROR at PC35: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC36: Overwrote pending register: R6 in 'AssignReg'

      -- DECOMPILER ERROR at PC37: Overwrote pending register: R7 in 'AssignReg'

      if ("php-cgi.exe")("httpd.exe", "tomcat") then
        return false
      end
      do return true end
      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

            do
              local l_0_19 = l_0_0 and 30 or 10
              local l_0_20 = nil
              local l_0_21 = "PFServers"
              if GetPidFromParentImagePath(l_0_1) then
                local l_0_22, l_0_23 = , startTrackingApp(GetPidFromParentImagePath(l_0_1), l_0_1, l_0_21, "PFApp_Parent")
                -- DECOMPILER ERROR at PC291: Overwrote pending register: R13 in 'AssignReg'

                if not l_0_23 then
                  (bm.trigger_sig)("ProcAttribError", safeJsonSerialize("Behavior:Win32/MpTamperGpDisableAVFriendly.A"))
                else
                  -- DECOMPILER ERROR at PC302: Overwrote pending register: R14 in 'AssignReg'

                  local l_0_24 = nil
                  -- DECOMPILER ERROR at PC308: Overwrote pending register: R15 in 'AssignReg'

                  IncreaseProcessAnomalyScore(l_0_2.ppid, l_0_20, "Tampering[" .. (l_0_2.ppid):match("pid:(%d+)") .. "][" .. l_0_5 .. "Trojan:Win32/MpTamperRegDisableAV.SA", "Trojan:Win32/MPTamperSuspExlc.C")
                  if next(l_0_24) and l_0_24.IsNewApp then
                    l_0_24.SignatureName = "PFATamper.A"
                    l_0_24.ProcessName = l_0_1
                    l_0_24.Score = l_0_20
                    ;
                    (bm.trigger_sig)("SetProcessAttrib", safeJsonSerialize(l_0_24))
                  end
                end
              end
              do
                local l_0_25 = nil
                if l_0_0 and l_0_18(((bm.get_imagepath)()):match("([^\\]+)$"), (string.lower)(l_0_1)) then
                  (bm.add_related_string)("serverName", l_0_1, bm.RelatedStringBMReport)
                  ;
                  (bm.add_related_string)("tamperingAlert", l_0_5, bm.RelatedStringBMReport)
                  local l_0_26 = nil
                  if (bm.get_current_process_startup_info)() then
                    (bm.add_related_string)("appName", getWebApplicationType(((bm.get_current_process_startup_info)()).ppid), bm.RelatedStringBMReport)
                  end
                  reportSessionInformationInclusive()
                  add_parents()
                  reportRelevantUntrustedEntities(0)
                  local l_0_27, l_0_28 = , pcall(reportBmInfo)
                  -- DECOMPILER ERROR at PC394: Overwrote pending register: R15 in 'AssignReg'

                  if not l_0_28 and reportBmInfo then
                    (bm.add_related_string)("bmInfoFailReason", tostring(R15_PC392), R15_PC392)
                  end
                  return mp.INFECTED
                else
                  do
                    if l_0_0 then
                      (bm.trigger_sig)("PFATamper.C", l_0_1 .. "|" .. l_0_5)
                    else
                      ;
                      (bm.trigger_sig)("PFATamper.B", l_0_1 .. "|" .. l_0_5)
                    end
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

