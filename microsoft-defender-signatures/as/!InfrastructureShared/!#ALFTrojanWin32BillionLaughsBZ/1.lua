-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32BillionLaughsBZ\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 > 512000 then
  l_0_0 = 512000
end
;
(mp.readprotection)(false)
local l_0_1 = (mp.readfile)(0, l_0_0)
;
(mp.readprotection)(true)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = tostring(l_0_1)
local l_0_3 = (string.lower)(l_0_2)
local l_0_4 = 26
do
  if (function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_4
  local l_1_1 = {}
  for l_1_5 in l_1_0:gmatch("[^\r\n]+") do
    local l_1_6 = l_1_5:match("&([%w_%-]+)")
    if l_1_6 then
      local l_1_7 = {}
      for l_1_11 in l_1_5:gmatch("%*([%w_%-]+)") do
        l_1_7[#l_1_7 + 1] = l_1_11
      end
      l_1_1[l_1_6] = l_1_7
    end
  end
  local l_1_12 = {}
  local l_1_13 = {}
  do
    for l_1_18,l_1_19 in pairs(l_1_1) do
      local l_1_15 = function(l_2_0, l_2_1)
    -- function num : 0_0_0 , upvalues : l_0_4, l_1_12, l_1_13, l_1_1, l_1_14
    if l_0_4 <= l_2_1 then
      return nil, false
    end
    if l_1_12[l_2_0] ~= nil then
      return l_1_12[l_2_0], false
    end
    if l_1_13[l_2_0] then
      return nil, true
    end
    -- DECOMPILER ERROR at PC22: Confused about usage of register: R2 in 'UnsetPending'

    l_1_13[l_2_0] = true
    local l_2_2 = l_1_1[l_2_0]
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R3 in 'UnsetPending'

    if l_2_2 == nil or #l_2_2 == 0 then
      l_1_13[l_2_0] = nil
      -- DECOMPILER ERROR at PC33: Confused about usage of register: R3 in 'UnsetPending'

      l_1_12[l_2_0] = 0
      return 0, false
    end
    local l_2_3 = 0
    for l_2_7,l_2_8 in ipairs(l_2_2) do
      if l_1_1[l_2_8] ~= nil then
        local l_2_9, l_2_10 = l_1_14(l_2_8, l_2_1 + 1)
        -- DECOMPILER ERROR at PC53: Confused about usage of register: R11 in 'UnsetPending'

        if l_2_10 then
          l_1_13[l_2_0] = nil
          return nil, true
        end
        -- DECOMPILER ERROR at PC60: Confused about usage of register: R11 in 'UnsetPending'

        if l_2_9 == nil then
          l_1_13[l_2_0] = nil
          return nil, false
        end
        if l_2_3 < l_2_9 then
          l_2_3 = l_2_9
        end
      end
    end
    -- DECOMPILER ERROR at PC70: Confused about usage of register: R4 in 'UnsetPending'

    l_1_13[l_2_0] = nil
    local l_2_11 = l_2_3 + 1
    -- DECOMPILER ERROR at PC73: Confused about usage of register: R5 in 'UnsetPending'

    l_1_12[l_2_0] = l_2_11
    return l_2_11, false
  end

      if l_1_19 or l_1_15(l_1_19, 0) == nil or l_1_15(l_1_19, 0) and l_0_4 <= l_1_15(l_1_19, 0) then
        return true
      end
    end
    do return false end
    -- DECOMPILER ERROR at PC54: freeLocal<0 in 'ReleaseLocals'

  end
end
)(l_0_3) then
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC47: freeLocal<0 in 'ReleaseLocals'

end

