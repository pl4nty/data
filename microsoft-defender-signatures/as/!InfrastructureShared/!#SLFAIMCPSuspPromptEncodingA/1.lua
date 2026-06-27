-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFAIMCPSuspPromptEncodingA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_NET_PROMPTSTREAM then
  return mp.CLEAN
end
do
  if (mp.getfilesize)() > 1536000 then
    local l_0_1, l_0_2, l_0_3 = 1536000
  end
  ;
  (mp.readprotection)(false)
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_4 = nil
  ;
  (mp.readprotection)(true)
  if tostring((mp.readfile)(0, l_0_1)) or not (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE) then
    return mp.CLEAN
  end
  local l_0_5 = nil
  local l_0_6 = {"󠁴󠁨", "󠁔󠁈", "󠁔󠁨", "󠁴󠁈", "󠁨󠁥", "󠁈󠁅", "󠁈󠁥", "󠁨󠁅", "󠁩󠁮", "󠁉󠁎", "󠁉󠁮", "󠁩󠁎", "󠁥󠁲", "󠁅󠁒", "󠁅󠁲", "󠁥󠁒", "󠁡󠁮", "󠁁󠁎", "󠁁󠁮", "󠁡󠁎", "󠁲󠁥", "󠁒󠁅", "󠁒󠁥", "󠁲󠁅", "󠁡󠁴", "󠁁󠁔", "󠁁󠁴", "󠁡󠁔", "󠁯󠁮", "󠁏󠁎", "󠁏󠁮", "󠁯󠁎", "󠁮󠁤", "󠁎󠁄", "󠁎󠁤", "󠁮󠁄", "󠁥󠁮", "󠁅󠁎", "󠁅󠁮", "󠁥󠁎", "󠁥󠁳", "󠁅󠁓", "󠁅󠁳", "󠁥󠁓"}
  local l_0_7 = 0
  for l_0_11,l_0_12 in ipairs(l_0_6) do
    local l_0_8 = {}
    -- DECOMPILER ERROR at PC103: Confused about usage of register: R10 in 'UnsetPending'

    local l_0_14 = (string.find)(l_0_5, "󠁈󠁥", 1, true)
    if l_0_5 then
      l_0_7 = l_0_7 + 1
      local l_0_15 = nil
      do
        if l_0_15 - 80 < 0 then
          local l_0_16, l_0_17, l_0_18 = 512, 0
        end
        -- DECOMPILER ERROR at PC118: Confused about usage of register: R14 in 'UnsetPending'

        -- DECOMPILER ERROR at PC119: Confused about usage of register: R14 in 'UnsetPending'

        -- DECOMPILER ERROR at PC119: Confused about usage of register: R13 in 'UnsetPending'

        local l_0_19 = nil
        do
          local l_0_20 = nil
          ;
          (table.insert)(l_0_8, (MpCommon.Base64Encode)((string.sub)(l_0_5, l_0_17, l_0_17 + l_0_16)))
          -- DECOMPILER ERROR at PC130: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC130: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC130: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  if l_0_7 > 0 then
    local l_0_21 = nil
    local l_0_22 = safeJsonSerialize
    l_0_22 = l_0_22({MatchedSurroundings = l_0_21})
    ;
    (mp.SetDetectionString)(l_0_22)
    set_research_data("MatchedSurroundings", l_0_22, false)
    return mp.INFECTED
  end
  do
    return mp.CLEAN
  end
end

