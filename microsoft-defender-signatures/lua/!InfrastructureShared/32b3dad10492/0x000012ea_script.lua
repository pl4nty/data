-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3dad10492\0x000012ea_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and not isnull((this_sigattrlog[1]).utf8p2) then
  local l_0_0 = safeJsonDeserialize((this_sigattrlog[1]).utf8p2)
  if l_0_0 and l_0_0.context and tonumber((l_0_0.context).ForTest) == 1 then
    local l_0_1 = {}
    l_0_1["5a9342bd58c799c7ad6ee5ee4cf97cae63f9e3d4"] = true
    l_0_1.a738f2d8360e0243af067b2bb537c54d52bf679f = true
    l_0_1["2b0d8125167d52a26327884a925c7f3e9ba95475"] = true
    l_0_1["727b866d2353a5d95a5eb36ca5c6c5cb3c82d7a4"] = true
    local l_0_2 = (versioning.GetOrgID)()
    if isnull(l_0_2) then
      return mp.CLEAN
    end
    local l_0_3 = scrubData(l_0_2)
    if not l_0_1[l_0_3] then
      return mp.CLEAN
    end
    local l_0_4 = l_0_0.context
    local l_0_5 = 0
    local l_0_6 = 1
    local l_0_7 = 2
    local l_0_8, l_0_9 = nil, nil
    l_0_8 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
    do
      if not l_0_8 or not l_0_9 then
        local l_0_10 = {}
        l_0_10.State = 0
        l_0_10.MaxTimeout = 0
        l_0_10.Exclusions = ""
        l_0_10.AggressiveLevel = 0
        -- DECOMPILER ERROR at PC75: Overwrote pending register: R9 in 'AssignReg'

        l_0_0.client_error = "Failed to get data from user config, setting default configuration"
      end
      l_0_0.UserConfig = l_0_9
      -- DECOMPILER ERROR at PC79: Confused about usage of register: R10 in 'UnsetPending'

      ;
      (l_0_0.context).attemptedFWBlock = false
      l_0_0.sessionInfo = reportSessionInformationInclusive()
      local l_0_11 = mp.CLEAN
      local l_0_12 = (tonumber(l_0_4.FWBlock))
      local l_0_13 = nil
      do
        if not isnull(l_0_9.Exclusions) then
          local l_0_14 = split(l_0_9.Exclusions, "|")
          l_0_14 = convert_to_hashtable(l_0_14)
        end
        local l_0_15 = isIPInExclusionList(l_0_0.ip, l_0_13, true)
        if l_0_15 == true then
          l_0_0.client_reason = "The ip [" .. l_0_0.ip .. "] is in excluded list"
          if l_0_12 == l_0_6 then
            l_0_0.client_reason = "Remote encryption would have blocked but the ip [" .. l_0_0.ip .. "] is in excluded list"
          else
            if l_0_12 == l_0_7 then
              l_0_0.client_reason = "Remote encryption configuration is in audit mode and the ip [" .. l_0_0.ip .. "] is in excluded list, Otheriwse it would have been blocked"
            end
          end
        else
          if l_0_12 == l_0_5 then
            l_0_0.client_reason = "CloudNoBlock"
            if (versioning.IsSeville)() and tonumber(l_0_4.notifyEDR) then
              (bm.set_detection_string)(safeJsonSerialize(l_0_0))
            end
          else
            if l_0_12 == l_0_6 then
              if l_0_9.State == MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_ENABLED then
                (bm.trigger_sig)("GenericRansomwareRemoteEncryption", (this_sigattrlog[1]).utf8p2)
                return mp.CLEAN
              else
                l_0_0.client_reason = "CloudAsksBlockButUserConfigStateDiffers:" .. tostring(l_0_9.State)
              end
            else
              if l_0_12 == l_0_7 then
                if (versioning.IsSeville)() and tonumber(l_0_4.notifyEDR) then
                  (bm.set_detection_string)(safeJsonSerialize(l_0_0))
                end
                l_0_0.client_reason = "UserConfigAuditMode"
              end
            end
          end
          l_0_11 = mp.INFECTED
        end
        local l_0_16 = SafeGetUrlReputation
        local l_0_17 = {}
        -- DECOMPILER ERROR at PC199: No list found for R15 , SetList fails

        local l_0_18 = {}
        l_0_18.SIG_CONTEXT = "BM"
        l_0_18.CONTEXT_SOURCE = "GenRansomRemoteFWReport"
        l_0_18.TAG = "NOLOOKUP"
        l_0_18.data = safeJsonSerialize(l_0_0)
        l_0_16 = l_0_16(l_0_17, l_0_18, false, 3000, false)
        if l_0_16 then
          l_0_17 = l_0_16.error
          if l_0_17 == 3 then
            l_0_0.CRReportError = "Failed the first attempt"
            l_0_17 = SafeGetUrlReputation
            local l_0_19 = {}
            l_0_19.SIG_CONTEXT = "BM"
            l_0_19.CONTEXT_SOURCE = "GenRansomRemoteFWReport"
            l_0_19.TAG = "NOLOOKUP"
            l_0_19.data = safeJsonSerialize(l_0_0)
            l_0_17, l_0_18 = l_0_17(l_0_18, l_0_19, false, 3000, false), {l_0_0.ip}
            l_0_16 = l_0_17
          end
        end
        do
          do
            do
              l_0_17 = mp
              l_0_17 = l_0_17.INFECTED
              if l_0_11 == l_0_17 then
                l_0_17 = mp
                l_0_17 = l_0_17.INFECTED
                return l_0_17
              end
              l_0_0.ppID = nil
              l_0_0.imagePath = nil
              l_0_0.sessionInfo = reportSessionInformationInclusive()
              if (versioning.IsSeville)() then
                (bm.set_detection_string)(safeJsonSerialize(l_0_0))
              end
              do return mp.INFECTED end
              return mp.CLEAN
            end
          end
        end
      end
    end
  end
end

