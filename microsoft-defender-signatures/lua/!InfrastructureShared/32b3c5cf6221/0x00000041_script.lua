-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3c5cf6221\0x00000041_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_2 = nil
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_1 = nil
    l_0_1 = ((string.lower)((this_sigattrlog[1]).utf8p2)):match("remoteip=(%d+%.%d+%.%d+%.%d+);file1=([^;]+);file2=([^;]+)")
  end
  local l_0_3 = nil
  do
    if MpCommon.GetBehavioralNetworkBlocksSettings then
      local l_0_4, l_0_5 = nil, pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
      if l_0_5 and MpCommon.GetBehavioralNetworkBlocksSettings and not isnull((MpCommon.GetBehavioralNetworkBlocksSettings).State) then
        l_0_4 = (MpCommon.GetBehavioralNetworkBlocksSettings).State
      end
    end
    -- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC48: Confused about usage of register: R1 in 'UnsetPending'

    if not isnull(l_0_4) and l_0_4 == MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_ENABLED then
      local l_0_6 = nil
      local l_0_7, l_0_8 = , pcall(bm.add_blocking_firewall_rule, l_0_3, 900, true, false, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION, true, true)
      if l_0_8 == true and isnull(R6_PC67) then
        return mp.INFECTED
      end
    end
    do
      return mp.CLEAN
    end
  end
end

