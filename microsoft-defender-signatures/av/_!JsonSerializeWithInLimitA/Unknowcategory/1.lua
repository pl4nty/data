-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!JsonSerializeWithInLimitA\Unknowcategory\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.crc32)(-1, "4afa309c-a1b3-455b-ab91-da731ec077c4", 1, 36)
local l_0_1 = (mp.crc32)(-1, headerpage, 1, 36)
if l_0_1 ~= l_0_0 then
  return mp.CLEAN
end
local l_0_2 = function(l_1_0, l_1_1)
  -- function num : 0_0
  do
    local l_1_3 = function(l_2_0)
    -- function num : 0_0_0 , upvalues : l_1_2
    if l_2_0 == 1 then
      local l_2_1 = {}
      l_2_1.value = "some_value"
      return l_2_1
    else
      do
        local l_2_2 = {}
        l_2_2.key1 = l_1_2(l_2_0 - 1)
        do return l_2_2 end
      end
    end
  end

    for l_1_7 = 1, l_1_0 do
      local l_1_4 = {}
      -- DECOMPILER ERROR at PC8: Confused about usage of register: R7 in 'UnsetPending'

      l_1_4["key" .. R7_PC8] = l_1_3(l_1_1)
    end
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R3 in 'UnsetPending'

    do return l_1_4 end
    -- DECOMPILER ERROR at PC16: freeLocal<0 in 'ReleaseLocals'

  end
end

local l_0_3 = 260
local l_0_4 = 30
local l_0_5 = l_0_2(l_0_3, l_0_4)
if not pcall(MpCommon.JsonSerialize, l_0_5) then
  return mp.CLEAN
end
if not MpCommon.JsonSerialize then
  return mp.CLEAN
end
return mp.INFECTED

