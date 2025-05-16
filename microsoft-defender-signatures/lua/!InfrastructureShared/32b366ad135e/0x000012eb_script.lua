-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b366ad135e\0x000012eb_luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1)
  -- function num : 0_0
  local l_1_2 = ""
  if (l_1_1.context).attemptedFWBlock == true and (l_1_1.context).WFBlockSucceeded == true then
    l_1_2 = "The ip[" .. l_1_1.ip .. "] is blocked by firewall rule, Based on the user\'s Remote Encryption config and aggressiveness level."
  else
    if (l_1_1.context).attemptedFWBlock == true and (l_1_1.context).WFBlockSucceeded == false and l_1_0.State == MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_ENABLED then
      l_1_2 = "The ip[" .. l_1_1.ip .. "] is should be blocked but failed to add firewall rule!"
    else
      if (l_1_1.context).attemptedFWBlock == true and l_1_0.State == MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_AUDIT then
        l_1_2 = "The ip[" .. l_1_1.ip .. "] should get blocked, skipped due to audit mode"
      end
    end
  end
  return l_1_2
end

local l_0_1 = 0
local l_0_2 = 1
local l_0_3 = 2
local l_0_4 = 1
local l_0_5 = 2
local l_0_6 = 900
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_7 = {}
  l_0_7["5a9342bd58c799c7ad6ee5ee4cf97cae63f9e3d4"] = true
  l_0_7.a738f2d8360e0243af067b2bb537c54d52bf679f = true
  l_0_7["2b0d8125167d52a26327884a925c7f3e9ba95475"] = true
  l_0_7["727b866d2353a5d95a5eb36ca5c6c5cb3c82d7a4"] = true
  local l_0_8 = (versioning.GetOrgID)()
  if isnull(l_0_8) then
    return mp.CLEAN
  end
  local l_0_9 = scrubData(l_0_8)
  if not l_0_7[l_0_9] then
    return mp.CLEAN
  end
  local l_0_10 = mp.CLEAN
  local l_0_11 = safeJsonDeserialize((this_sigattrlog[1]).utf8p2)
  -- DECOMPILER ERROR at PC67: Confused about usage of register: R12 in 'UnsetPending'

  if not isnull(l_0_11) and l_0_11.ip and l_0_11.confidence and (l_0_11.determination == l_0_3 or l_0_11.determination == l_0_2) then
    (l_0_11.context).attemptedFWBlock = false
    l_0_11.sessionInfo = reportSessionInformationInclusive()
    local l_0_12 = l_0_11.context
    if l_0_12 and tonumber(l_0_12.ForTest) == 1 then
      local l_0_13 = 1
      if tonumber(l_0_12.FWBlock) == l_0_13 then
        local l_0_14 = tonumber((l_0_11.action).parameter)
        local l_0_15 = pcall
        local l_0_16 = bm.add_blocking_firewall_rule
        local l_0_17 = l_0_11.ip
        do
          local l_0_18, l_0_20, l_0_23 = (l_0_11.action).ttl or l_0_6
          -- DECOMPILER ERROR at PC121: Confused about usage of register: R18 in 'UnsetPending'

          l_0_15 = l_0_15(l_0_16, l_0_17, l_0_18, (mp.bitand)(l_0_14, l_0_4) == l_0_4, (mp.bitand)(l_0_14, l_0_5) == l_0_5, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION, true, false, "445")
          l_0_17 = pcall
          local l_0_26 = bm.add_blocking_firewall_rule
          local l_0_27 = l_0_11.ip
          do
            do
              do
                do
                  local l_0_28, l_0_30, l_0_33 = (l_0_11.action).ttl or l_0_6
                  -- DECOMPILER ERROR at PC154: Confused about usage of register: R20 in 'UnsetPending'

                  l_0_17 = l_0_17(l_0_26, l_0_27, l_0_28, (mp.bitand)(l_0_14, l_0_4) == l_0_4, (mp.bitand)(l_0_14, l_0_5) == l_0_5, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION, true, false, "139")
                  l_0_27 = l_0_11.context
                  l_0_27.attemptedFWBlock = true
                  l_0_27 = l_0_11.context
                  l_0_27.WFBlockSucceeded = l_0_15
                  l_0_27 = l_0_11.context
                  l_0_27.firewallBlockerror = tostring(R21_PC162)
                  l_0_27 = l_0_11.context
                  l_0_27.WFBlockSucceeded2 = l_0_17
                  l_0_27 = l_0_11.context
                  l_0_27.firewallBlockerror2 = tostring(R21_PC162)
                  l_0_27 = l_0_11.context
                  -- DECOMPILER ERROR at PC173: Overwrote pending register: R21 in 'AssignReg'

                  l_0_27.EDRMsg = l_0_0(R21_PC162, l_0_11)
                  l_0_27 = versioning
                  l_0_27 = l_0_27.IsSeville
                  l_0_27 = l_0_27()
                  if l_0_27 then
                    l_0_27 = tonumber
                    l_0_27 = l_0_27(l_0_12.notifyEDR)
                    if not l_0_27 then
                      l_0_27 = tonumber
                      l_0_27 = l_0_27(l_0_12.alertEDR)
                    end
                    if l_0_27 then
                      l_0_27 = bm
                      l_0_27 = l_0_27.set_detection_string
                      -- DECOMPILER ERROR at PC195: Overwrote pending register: R21 in 'AssignReg'

                      l_0_27(safeJsonSerialize(R21_PC162))
                    end
                  end
                  l_0_27 = mp
                  l_0_10 = l_0_27.INFECTED
                  l_0_11.client_reason = "CloudActionNoBlockNotset"
                  if isnull(l_0_12) then
                    l_0_11.reason = "Error: context not found"
                  elseif tonumber(l_0_12.ForTest) == 0 then
                    l_0_11.reason = "Test is not enabled from cloud"
                  end
                  do
                    local l_0_36 = {}
                    if isnull(l_0_11) then
                      l_0_36.error = "Error: Remote Data is empty"
                      l_0_36.ip = "0.0.0.0"
                      l_0_36.p2 = (this_sigattrlog[1]).utf8p2
                      l_0_11 = l_0_36
                    elseif l_0_11.determination == l_0_1 then
                      l_0_11.reason = "CleanDetermination"
                    end
                    l_0_10 = mp.CLEAN
                    local l_0_37 = SafeGetUrlReputation
                    local l_0_38 = {}
                    -- DECOMPILER ERROR at PC240: No list found for R13 , SetList fails

                    do
                      do
                        local l_0_39 = {}
                        l_0_39.SIG_CONTEXT = "BM"
                        l_0_39.CONTEXT_SOURCE = "GenRansomRemoteFWReport"
                        l_0_39.TAG = "NOLOOKUP"
                        l_0_39.data = safeJsonSerialize(l_0_11)
                        l_0_37 = l_0_37(l_0_38, l_0_39, false, 3000, false)
                        if l_0_37 then
                          l_0_38 = l_0_37.error
                          if l_0_38 == 3 then
                            l_0_11.CRReportError = "Failed the first attempt"
                            l_0_38 = SafeGetUrlReputation
                            local l_0_40 = {}
                            l_0_40.SIG_CONTEXT = "BM"
                            l_0_40.CONTEXT_SOURCE = "GenRansomRemoteFWReport"
                            l_0_40.TAG = "NOLOOKUP"
                            l_0_40.data = safeJsonSerialize(l_0_11)
                            l_0_38, l_0_39 = l_0_38(l_0_39, l_0_40, false, 3000, false), {l_0_11.ip}
                            l_0_37 = l_0_38
                          end
                        end
                        l_0_38 = mp
                        l_0_38 = l_0_38.INFECTED
                        if l_0_10 == l_0_38 then
                          l_0_38 = mp
                          l_0_38 = l_0_38.INFECTED
                          return l_0_38
                        end
                        do return mp.CLEAN end
                        -- DECOMPILER ERROR: 16 unprocessed JMP targets
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
end

