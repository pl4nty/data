-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3dad10492\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and not isnull((this_sigattrlog[1]).utf8p2) then
  local l_0_0 = safeJsonDeserialize((this_sigattrlog[1]).utf8p2)
  if l_0_0 and l_0_0.context and tonumber((l_0_0.context).ForTest) == 1 then
    local l_0_1 = l_0_0.context
    local l_0_2 = 0
    local l_0_3 = 1
    local l_0_4 = 2
    local l_0_5, l_0_6 = nil, nil
    l_0_5 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
    do
      if not l_0_5 or not l_0_6 then
        local l_0_7 = {}
        l_0_7.State = 0
        l_0_7.MaxTimeout = 0
        l_0_7.Exclusions = ""
        l_0_7.AggressiveLevel = 0
        -- DECOMPILER ERROR at PC50: Overwrote pending register: R6 in 'AssignReg'

        l_0_0.client_error = "Failed to get data from user config, setting default configuration"
      end
      l_0_0.UserConfig = l_0_6
      -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

      ;
      (l_0_0.context).attemptedFWBlock = false
      l_0_0.sessionInfo = reportSessionInformationInclusive()
      local l_0_8 = mp.CLEAN
      local l_0_9 = (tonumber(l_0_1.FWBlock))
      local l_0_10 = nil
      do
        if not isnull(l_0_6.Exclusions) then
          local l_0_11 = split(l_0_6.Exclusions, "|")
          l_0_11 = convert_to_hashtable(l_0_11)
        end
        local l_0_12 = isIPInExclusionList(l_0_0.ip, l_0_10, true)
        if l_0_12 == true then
          l_0_0.client_reason = "The ip [" .. l_0_0.ip .. "] is in excluded list"
          if l_0_9 == l_0_3 then
            l_0_0.client_reason = "Remote encryption would have blocked but the ip [" .. l_0_0.ip .. "] is in excluded list"
          else
            if l_0_9 == l_0_4 then
              l_0_0.client_reason = "Remote encryption configuration is in audit mode and the ip [" .. l_0_0.ip .. "] is in excluded list, Otheriwse it would have been blocked"
            end
          end
        else
          if l_0_9 == l_0_2 then
            l_0_0.client_reason = "CloudNoBlock"
            if (versioning.IsSeville)() and tonumber(l_0_1.notifyEDR) then
              (bm.set_detection_string)(safeJsonSerialize(l_0_0))
            end
          else
            if l_0_9 == l_0_3 then
              if l_0_6.State == MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_ENABLED then
                (bm.trigger_sig)("GenericRansomwareRemoteEncryption", (this_sigattrlog[1]).utf8p2)
                return mp.CLEAN
              else
                l_0_0.client_reason = "CloudAsksBlockButUserConfigStateDiffers:" .. tostring(l_0_6.State)
              end
            else
              if l_0_9 == l_0_4 then
                if (versioning.IsSeville)() and tonumber(l_0_1.notifyEDR) then
                  (bm.set_detection_string)(safeJsonSerialize(l_0_0))
                end
                l_0_0.client_reason = "UserConfigAuditMode"
              end
            end
          end
          l_0_8 = mp.INFECTED
        end
        local l_0_13 = SafeGetUrlReputation
        local l_0_14 = {}
        -- DECOMPILER ERROR at PC174: No list found for R12 , SetList fails

        local l_0_15 = {}
        l_0_15.SIG_CONTEXT = "BM"
        l_0_15.CONTEXT_SOURCE = "GenRansomRemoteFWReport"
        l_0_15.TAG = "NOLOOKUP"
        l_0_15.data = safeJsonSerialize(l_0_0)
        l_0_13 = l_0_13(l_0_14, l_0_15, false, 3000, false)
        if l_0_13 then
          l_0_14 = l_0_13.error
          if l_0_14 == 3 then
            l_0_0.CRReportError = "Failed the first attempt"
            l_0_14 = SafeGetUrlReputation
            local l_0_16 = {}
            l_0_16.SIG_CONTEXT = "BM"
            l_0_16.CONTEXT_SOURCE = "GenRansomRemoteFWReport"
            l_0_16.TAG = "NOLOOKUP"
            l_0_16.data = safeJsonSerialize(l_0_0)
            l_0_14, l_0_15 = l_0_14(l_0_15, l_0_16, false, 3000, false), {l_0_0.ip}
            l_0_13 = l_0_14
          end
        end
        do
          do
            do
              l_0_14 = mp
              l_0_14 = l_0_14.INFECTED
              if l_0_8 == l_0_14 then
                l_0_14 = mp
                l_0_14 = l_0_14.INFECTED
                return l_0_14
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

