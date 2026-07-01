-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b366ad135e\1.luac 

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
  local l_0_7 = mp.CLEAN
  local l_0_8 = safeJsonDeserialize((this_sigattrlog[1]).utf8p2)
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R9 in 'UnsetPending'

  if not isnull(l_0_8) and l_0_8.ip and l_0_8.confidence and (l_0_8.determination == l_0_3 or l_0_8.determination == l_0_2) then
    (l_0_8.context).attemptedFWBlock = false
    l_0_8.sessionInfo = reportSessionInformationInclusive()
    local l_0_9 = l_0_8.context
    if l_0_9 and tonumber(l_0_9.ForTest) == 1 then
      local l_0_10 = 1
      if tonumber(l_0_9.FWBlock) == l_0_10 then
        local l_0_11 = tonumber((l_0_8.action).parameter)
        local l_0_12 = pcall
        local l_0_13 = bm.add_blocking_firewall_rule
        local l_0_14 = l_0_8.ip
        do
          local l_0_15, l_0_17, l_0_20 = (l_0_8.action).ttl or l_0_6
          -- DECOMPILER ERROR at PC96: Confused about usage of register: R15 in 'UnsetPending'

          l_0_12 = l_0_12(l_0_13, l_0_14, l_0_15, (mp.bitand)(l_0_11, l_0_4) == l_0_4, (mp.bitand)(l_0_11, l_0_5) == l_0_5, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION, true, false, "445")
          l_0_14 = pcall
          local l_0_23 = bm.add_blocking_firewall_rule
          local l_0_24 = l_0_8.ip
          do
            do
              do
                do
                  local l_0_25, l_0_27, l_0_30 = (l_0_8.action).ttl or l_0_6
                  -- DECOMPILER ERROR at PC129: Confused about usage of register: R17 in 'UnsetPending'

                  l_0_14 = l_0_14(l_0_23, l_0_24, l_0_25, (mp.bitand)(l_0_11, l_0_4) == l_0_4, (mp.bitand)(l_0_11, l_0_5) == l_0_5, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION, true, false, "139")
                  l_0_24 = l_0_8.context
                  l_0_24.attemptedFWBlock = true
                  l_0_24 = l_0_8.context
                  l_0_24.WFBlockSucceeded = l_0_12
                  l_0_24 = l_0_8.context
                  l_0_24.firewallBlockerror = tostring(R18_PC137)
                  l_0_24 = l_0_8.context
                  l_0_24.WFBlockSucceeded2 = l_0_14
                  l_0_24 = l_0_8.context
                  l_0_24.firewallBlockerror2 = tostring(R18_PC137)
                  l_0_24 = l_0_8.context
                  -- DECOMPILER ERROR at PC148: Overwrote pending register: R18 in 'AssignReg'

                  l_0_24.EDRMsg = l_0_0(R18_PC137, l_0_8)
                  l_0_24 = versioning
                  l_0_24 = l_0_24.IsSeville
                  l_0_24 = l_0_24()
                  if l_0_24 then
                    l_0_24 = tonumber
                    l_0_24 = l_0_24(l_0_9.notifyEDR)
                    if not l_0_24 then
                      l_0_24 = tonumber
                      l_0_24 = l_0_24(l_0_9.alertEDR)
                    end
                    if l_0_24 then
                      l_0_24 = bm
                      l_0_24 = l_0_24.set_detection_string
                      -- DECOMPILER ERROR at PC170: Overwrote pending register: R18 in 'AssignReg'

                      l_0_24(safeJsonSerialize(R18_PC137))
                    end
                  end
                  l_0_24 = mp
                  l_0_7 = l_0_24.INFECTED
                  l_0_8.client_reason = "CloudActionNoBlockNotset"
                  if isnull(l_0_9) then
                    l_0_8.reason = "Error: context not found"
                  elseif tonumber(l_0_9.ForTest) == 0 then
                    l_0_8.reason = "Test is not enabled from cloud"
                  end
                  do
                    local l_0_33 = {}
                    if isnull(l_0_8) then
                      l_0_33.error = "Error: Remote Data is empty"
                      l_0_33.ip = "0.0.0.0"
                      l_0_33.p1 = (this_sigattrlog[1]).utf8p1
                      l_0_33.p2 = (this_sigattrlog[1]).utf8p2
                      local l_0_34, l_0_35 = pcall(getBmInfo)
                      if l_0_34 and l_0_35 then
                        l_0_33.BmInfo = l_0_35
                      end
                      l_0_8 = l_0_33
                    elseif l_0_8.determination == l_0_1 then
                      l_0_8.reason = "CleanDetermination"
                    end
                    l_0_7 = mp.CLEAN
                    local l_0_36 = SafeGetUrlReputation
                    local l_0_37 = {}
                    -- DECOMPILER ERROR at PC227: No list found for R10 , SetList fails

                    do
                      do
                        local l_0_38 = {}
                        l_0_38.SIG_CONTEXT = "BM"
                        l_0_38.CONTEXT_SOURCE = "GenRansomRemoteFWReport"
                        l_0_38.TAG = "NOLOOKUP"
                        l_0_38.data = safeJsonSerialize(l_0_8)
                        l_0_36 = l_0_36(l_0_37, l_0_38, false, 3000, false)
                        if l_0_36 then
                          l_0_37 = l_0_36.error
                          if l_0_37 == 3 then
                            l_0_8.CRReportError = "Failed the first attempt"
                            l_0_37 = SafeGetUrlReputation
                            local l_0_39 = {}
                            l_0_39.SIG_CONTEXT = "BM"
                            l_0_39.CONTEXT_SOURCE = "GenRansomRemoteFWReport"
                            l_0_39.TAG = "NOLOOKUP"
                            l_0_39.data = safeJsonSerialize(l_0_8)
                            l_0_37, l_0_38 = l_0_37(l_0_38, l_0_39, false, 3000, false), {l_0_8.ip}
                            l_0_36 = l_0_37
                          end
                        end
                        l_0_37 = mp
                        l_0_37 = l_0_37.INFECTED
                        if l_0_7 == l_0_37 then
                          l_0_37 = mp
                          l_0_37 = l_0_37.INFECTED
                          return l_0_37
                        end
                        do return mp.CLEAN end
                        -- DECOMPILER ERROR: 17 unprocessed JMP targets
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

