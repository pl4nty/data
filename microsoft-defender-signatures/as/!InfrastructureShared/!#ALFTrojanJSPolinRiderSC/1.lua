-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanJSPolinRiderSC\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = (string.match)(l_1_0, "return%s+([%a_$][%w_$]*)%s*%.%s*join%s*%(%s*([\'\"])%2%s*%)")
  if l_1_1 == nil then
    return false
  end
  local l_1_2 = (string.lower)((string.gsub)(l_1_0, "%s+", ""))
  local l_1_3 = (string.find)(l_1_2, ".charat(", 1, true)
  if l_1_3 == nil then
    return false
  end
  l_1_2 = (string.sub)(l_1_2, l_1_3)
  if not (string.find)(l_1_2, "^%.charat%([%a_$][%w_$]*%);?};for%(var([%a_$][%w_$]*)=0;%1<[%a_$][%w_$]*;%1%+%+%){var") then
    return false
  end
  local l_1_4, l_1_5, l_1_6, l_1_7 = (string.find)(l_1_2, "var([%a_$][%w_$]*)=([%a_$][%w_$]*)%[([%a_$][%w_$]*)%];%2%[%3%]=%2%[([%a_$][%w_$]*)%];%2%[%4%]=%1;")
  if l_1_4 == nil or (string.lower)(l_1_1) ~= l_1_7 then
    return false
  end
  local l_1_8, l_1_9 = (string.find)(l_1_2, "};return" .. l_1_7 .. ".join(", l_1_5 + 1, true)
  if l_1_8 == nil or l_1_8 - l_1_5 > 128 then
    return false
  end
  local l_1_10 = (string.sub)(l_1_2, l_1_5 + 1, l_1_8 - 1)
  if not (string.find)(l_1_10, "^[%a_$][%w_$]*=%([%a_$][%w_$]*%+[%a_$][%w_$]*%)%%%d+;$") then
    return false
  end
  do
    local l_1_11 = (string.sub)(l_1_2, l_1_9 + 1, l_1_9 + 3)
    do return l_1_11 == "\'\')" or l_1_11 == "\"\")" end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

local l_0_1 = (mp.getfilesize)()
local l_0_2 = 512
if l_0_1 == nil or l_0_1 <= l_0_2 or l_0_1 > 8388608 then
  return mp.CLEAN
end
local l_0_3 = l_0_2
for l_0_7 = 1, 64 do
  if l_0_1 - 6 < l_0_3 then
    return mp.CLEAN
  end
  local l_0_8 = l_0_1 - l_0_3
  ;
  (mp.readprotection)(false)
  local l_0_9, l_0_10 = pcall(mp.BMSearchFile, l_0_3, l_0_8, "global\144\000")
  ;
  (mp.readprotection)(true)
  if not l_0_9 then
    (mp.set_mpattribute)("Lua:PaddedGlobalScriptSearchFailed")
    return mp.CLEAN
  end
  if l_0_10 == nil or l_0_10 < 0 or l_0_8 - 6 < l_0_10 then
    return mp.CLEAN
  end
  local l_0_11 = l_0_3 + l_0_10
  local l_0_12 = l_0_11 - l_0_2
  do
    if l_0_2 + 2048 < l_0_1 - l_0_12 then
      local l_0_13, l_0_14, l_0_15 = l_0_2 + 2048
    end
    ;
    (mp.readprotection)(false)
    -- DECOMPILER ERROR at PC74: Confused about usage of register: R13 in 'UnsetPending'

    local l_0_16 = nil
    ;
    (mp.readprotection)(true)
    if (mp.readfile)(l_0_12, l_0_13) == nil then
      (mp.set_mpattribute)("Lua:PaddedGlobalScriptReadFailed")
      return mp.CLEAN
    end
    local l_0_17 = nil
    if #tostring((mp.readfile)(l_0_12, l_0_13)) ~= l_0_16 then
      (mp.set_mpattribute)("Lua:PaddedGlobalScriptReadFailed")
      return mp.CLEAN
    end
    local l_0_18 = nil
    if not (string.find)((string.sub)(tostring((mp.readfile)(l_0_12, l_0_13)), 1, l_0_2), "[^ \t\r\n]") then
      local l_0_19 = nil
      local l_0_20 = nil
      local l_0_21 = (string.find)((string.sub)(l_0_18, l_0_2 + 1), "^global%s*[%[%.]")
      if ((string.find)((string.sub)(l_0_20, 1, 512), "global%s*%.%s*[%a_$][%w_$]*%s*=%s*require%s*;") or l_0_21) and (string.find)((string.sub)(l_0_20, 1, 512), "global%s*%[%s*([\'\"])[%w_$]+%1%s*%]%s*=%s*require%s*;") and l_0_0(l_0_20) then
        return mp.INFECTED
      end
    end
    do
      do
        l_0_3 = l_0_11 + 6
        -- DECOMPILER ERROR at PC156: LeaveBlock: unexpected jumping out DO_STMT

        -- DECOMPILER ERROR at PC156: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
end
return mp.CLEAN

