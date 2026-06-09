-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFAIMCPSuspPromptEncodingA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_NET_PROMPTSTREAM then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK)
if l_0_1 == nil then
  return mp.CLEAN
end
do
  if (mp.getfilesize)() > 1536000 then
    local l_0_2, l_0_3, l_0_4 = 1536000
  end
  ;
  (mp.readprotection)(false)
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

  local l_0_5 = nil
  ;
  (mp.readprotection)(true)
  if tostring((mp.readfile)(0, l_0_2)) or not (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE) then
    return mp.CLEAN
  end
  local l_0_6 = nil
  local l_0_7 = {"󠁴󠁨", "󠁔󠁈", "󠁔󠁨", "󠁴󠁈", "󠁨󠁥", "󠁈󠁅", "󠁈󠁥", "󠁨󠁅", "󠁩󠁮", "󠁉󠁎", "󠁉󠁮", "󠁩󠁎", "󠁥󠁲", "󠁅󠁒", "󠁅󠁲", "󠁥󠁒", "󠁡󠁮", "󠁁󠁎", "󠁁󠁮", "󠁡󠁎", "󠁲󠁥", "󠁒󠁅", "󠁒󠁥", "󠁲󠁅", "󠁡󠁴", "󠁁󠁔", "󠁁󠁴", "󠁡󠁔", "󠁯󠁮", "󠁏󠁎", "󠁏󠁮", "󠁯󠁎", "󠁮󠁤", "󠁎󠁄", "󠁎󠁤", "󠁮󠁄", "󠁥󠁮", "󠁅󠁎", "󠁅󠁮", "󠁥󠁎", "󠁥󠁳", "󠁅󠁓", "󠁅󠁳", "󠁥󠁓"}
  local l_0_8 = 0
  for l_0_12,l_0_13 in ipairs(l_0_7) do
    local l_0_9 = {}
    -- DECOMPILER ERROR at PC113: Confused about usage of register: R11 in 'UnsetPending'

    local l_0_15 = (string.find)(l_0_6, "󠁈󠁥", 1, true)
    if l_0_6 then
      l_0_8 = l_0_8 + 1
      local l_0_16 = nil
      do
        if l_0_16 - 80 < 0 then
          local l_0_17, l_0_18, l_0_19 = 512, 0
        end
        -- DECOMPILER ERROR at PC128: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC129: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC129: Confused about usage of register: R14 in 'UnsetPending'

        local l_0_20 = nil
        do
          local l_0_21 = nil
          ;
          (table.insert)(l_0_9, (MpCommon.Base64Encode)((string.sub)(l_0_6, l_0_18, l_0_18 + l_0_17)))
          -- DECOMPILER ERROR at PC140: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC140: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC140: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  if l_0_8 > 0 then
    local l_0_22 = nil
    local l_0_23 = safeJsonSerialize
    l_0_23 = l_0_23({MatchedSurroundings = l_0_22})
    ;
    (mp.SetDetectionString)(l_0_23)
    set_research_data("MatchedSurroundings", l_0_23, false)
    return mp.INFECTED
  end
  do
    return mp.CLEAN
  end
end

