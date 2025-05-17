-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3e4fe061a\1_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  local l_0_1, l_0_2 = l_0_0:match("(.*)|(.*)")
  if l_0_1 and l_0_2 then
    (bm.add_related_string)("serverName", l_0_1, bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("tamperingAlert", l_0_2, bm.RelatedStringBMReport)
    local l_0_3 = (bm.get_current_process_startup_info)()
    if l_0_3 then
      (bm.add_related_string)("appName", getWebApplicationType(l_0_3.ppid), bm.RelatedStringBMReport)
    end
    reportSessionInformationInclusive()
    bm_AddRelatedFileFromCommandLine("bm")
    add_parents()
    local l_0_4 = 10
    local l_0_5 = "PFServers"
    local l_0_6 = GetPidFromParentImagePath(l_0_1)
    if l_0_6 then
      local l_0_7, l_0_8 = startTrackingApp(l_0_6, l_0_1, l_0_5, "PFApp_Parent")
      if not l_0_7 then
        l_0_8.SignatureName = "PFATamper.B"
        l_0_8.ProcessName = l_0_1
        ;
        (bm.trigger_sig)("ProcAttribError", safeJsonSerialize(l_0_8))
      else
        local l_0_9 = "Tampering[" .. (l_0_3.ppid):match("pid:(%d+)") .. "][" .. l_0_2 .. "]"
        IncreaseProcessAnomalyScore(l_0_6, l_0_4, l_0_9, "PFApp_Parent")
        if next(l_0_8) and l_0_8.IsNewApp then
          l_0_8.SignatureName = "PFATamper.B"
          l_0_8.ProcessName = l_0_1
          l_0_8.Score = l_0_4
          ;
          (bm.trigger_sig)("SetProcessAttrib", safeJsonSerialize(l_0_8))
        end
      end
    end
    do
      local l_0_10 = {}
      l_0_10["cmd.exe"] = true
      l_0_10["powershell.exe"] = true
      l_0_10["reg.exe"] = true
      local l_0_11 = {}
      l_0_11.serverName = l_0_1
      l_0_11.tamperingAlert = l_0_2
      l_0_11.signame = "PFATamper.B"
      local l_0_12 = (bm.get_current_process_startup_info)()
      do
        if l_0_12 and l_0_12.ppid and l_0_12.image_path then
          local l_0_13 = ((l_0_12.image_path).match)("([^\\]+)$")
          if l_0_13 and l_0_10[(string.lower)(l_0_13)] then
            (bm.trigger_sig)("PFATamper_Remediate", safeJsonSerialize(l_0_11))
            return mp.INFECTED
          end
        end
        local l_0_14, l_0_15, l_0_16 = hasBase64encodedParent(l_0_3.ppid)
        if l_0_14 then
          l_0_11.base64Cmdline = l_0_16
          l_0_11.base64parentImagePath = l_0_15
          ;
          (bm.trigger_sig)("PFATamper_To_Remediate", safeJsonSerialize(l_0_11))
          return mp.INFECTED
        end
        local l_0_17 = {}
        local l_0_18 = {}
        -- DECOMPILER ERROR at PC177: No list found for R14 , SetList fails

        -- DECOMPILER ERROR at PC178: No list found for R13 , SetList fails

        -- DECOMPILER ERROR at PC180: Overwrote pending register: R14 in 'AssignReg'

        -- DECOMPILER ERROR at PC181: Overwrote pending register: R15 in 'AssignReg'

        if l_0_18 then
          local l_0_19 = contains
          -- DECOMPILER ERROR at PC186: Overwrote pending register: R16 in 'AssignReg'

          local l_0_20 = "disable"
          local l_0_21 = {}
          -- DECOMPILER ERROR at PC189: No list found for R17 , SetList fails

          l_0_19 = l_0_19(l_0_20, l_0_21, false)
        end
        if not l_0_19 then
          l_0_19 = checkParentCmdlineCaseInsensitive
          l_0_20 = l_0_3.ppid
          l_0_21 = l_0_17
          l_0_19 = l_0_19(l_0_20, l_0_21, 3)
        end
        if l_0_19 then
          l_0_19 = bm
          l_0_19 = l_0_19.trigger_sig
          l_0_20 = "PFATamper_To_Remediate"
          l_0_21 = safeJsonSerialize
          l_0_19(l_0_20, l_0_21(l_0_11))
          l_0_19 = mp
          l_0_19 = l_0_19.INFECTED
          return l_0_19
        end
        l_0_19 = mp
        l_0_19 = l_0_19.INFECTED
        do return l_0_19 end
        -- DECOMPILER ERROR at PC214: Confused about usage of register R17 for local variables in 'ReleaseLocals'

        l_0_0 = mp
        l_0_0 = l_0_0.CLEAN
        return l_0_0
      end
    end
  end
end

