-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\185b35df59759\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 30
if l_0_0 * 10000000 < (bm.GetSignatureMatchDuration)() then
  return mp.CLEAN
end
local l_0_1 = (bm.get_current_process_startup_info)()
if isnull(l_0_1) or isnull(l_0_1.ppid) then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.GetProcessElevationAndIntegrityLevel)(l_0_1.ppid)
if isnull(l_0_2) or isnull(l_0_2.IntegrityLevel) or l_0_2.IntegrityLevel ~= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.CLEAN
end
local l_0_3 = tonumber((string.match)(l_0_1.ppid, "pid:(%w+),ProcessStart:%w+"))
if isnull(l_0_3) or l_0_3 ~= 4 then
  return mp.CLEAN
end
local l_0_4 = nil
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_5 = (string.lower)((this_sigattrlog[1]).utf8p2)
    l_0_4 = l_0_5:match("remotesrcip_([%d%.]+):")
  end
  if isnull(l_0_4) then
    return mp.CLEAN
  end
  local l_0_6, l_0_7 = nil, nil
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[2]).utf8p2 ~= nil then
    l_0_7 = (string.lower)((this_sigattrlog[2]).utf8p1)
    local l_0_8 = (string.lower)((this_sigattrlog[2]).utf8p2)
    l_0_6 = l_0_8:match("remoteip:([%d%.]+):")
  end
  do
    if isnull(l_0_6) or isnull(l_0_7) then
      return mp.CLEAN
    end
    if l_0_4 ~= l_0_6 then
      return mp.CLEAN
    end
    local l_0_9, l_0_10 = nil, nil
    if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil and (this_sigattrlog[4]).utf8p2 ~= nil then
      l_0_10 = (string.lower)((this_sigattrlog[4]).utf8p1)
      local l_0_11 = (string.lower)((this_sigattrlog[4]).utf8p2)
      l_0_9 = l_0_11:match("remoteip:([%d%.]+):")
    end
    do
      if isnull(l_0_9) or isnull(l_0_10) then
        return mp.CLEAN
      end
      if l_0_4 ~= l_0_9 then
        return mp.CLEAN
      end
      if l_0_7 == l_0_10 then
        return mp.CLEAN
      end
      local l_0_12, l_0_13, l_0_14, l_0_15 = nil, nil, nil, nil
      local l_0_16 = false
      if MpCommon.GetBehavioralNetworkBlocksSettings then
        l_0_12 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
        if l_0_12 and l_0_13 then
          do
            if not isnull(l_0_13.Exclusions) and l_0_13.Exclusions ~= "" then
              local l_0_17 = split(l_0_13.Exclusions, "|")
              l_0_17 = convert_to_hashtable(l_0_17)
              l_0_16 = isIPInExclusionList(l_0_4, l_0_17, true)
            end
            if not isnull(l_0_13.AggressiveLevel) then
              l_0_14 = l_0_13.AggressiveLevel
            end
            if not isnull(l_0_13.State) then
              l_0_15 = l_0_13.State
            end
            if l_0_16 == true then
              return mp.CLEAN
            end
            if isnull(l_0_15) or l_0_15 ~= MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_ENABLED and l_0_15 ~= MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_AUDIT then
              return mp.CLEAN
            end
            if isnull(l_0_14) or l_0_14 ~= 2 then
              return mp.CLEAN
            end
            if not isnull(ipv4ToInt(l_0_4)) then
              local l_0_18 = ipv4IsPrivateRange(l_0_4)
              if not isnull(l_0_18) then
                local l_0_19 = "RemoteIP=" .. l_0_4 .. ";File1=" .. l_0_7 .. ";File2=" .. l_0_10 .. ";"
                if l_0_18 == true then
                  (bm.trigger_sig)("Ransomware!RemoteGenZeroPlus.A!RemoteIpPrivate", l_0_19)
                  return mp.INFECTED
                else
                  ;
                  (bm.trigger_sig)("Ransomware!RemoteGenZeroPlus.A!RemoteIpPublic", l_0_19)
                  return mp.INFECTED
                end
              end
            end
            do
              return mp.CLEAN
            end
          end
        end
      end
    end
  end
end

