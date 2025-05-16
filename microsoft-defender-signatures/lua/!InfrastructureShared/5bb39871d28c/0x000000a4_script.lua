-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb39871d28c\0x000000a4_luac 

-- params : ...
-- function num : 0
local l_0_0 = 2
if this_sigattrlog[1] and (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_1 = safeJsonDeserialize((this_sigattrlog[1]).utf8p2)
  if isnull(l_0_1) or isnull(l_0_1.determination) or isnull(l_0_1.confidence) then
    return mp.CLEAN
  end
  if l_0_1.ip == nil or l_0_1.ip == "" then
    return mp.CLEAN
  end
  if l_0_1.determination ~= l_0_0 or l_0_1.confidence < 50 then
    return mp.CLEAN
  end
  local l_0_2, l_0_3 = nil, nil
  local l_0_4 = false
  if MpCommon.GetBehavioralNetworkBlocksSettings then
    l_0_2 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
    if l_0_2 and l_0_3 and not isnull(l_0_3.Exclusions) and l_0_3.Exclusions ~= "" then
      local l_0_5 = split(l_0_3.Exclusions, "|")
      l_0_5 = convert_to_hashtable(l_0_5)
      l_0_4 = isIPInExclusionList(l_0_1.ip, l_0_5, true)
    end
  end
  do
    do
      if l_0_4 == true then
        return mp.CLEAN
      end
      TrackAttackerServer(l_0_1.ip)
      AddResearchData((this_sigattrlog[1]).ppid, true)
      do return mp.INFECTED end
      return mp.CLEAN
    end
  end
end

