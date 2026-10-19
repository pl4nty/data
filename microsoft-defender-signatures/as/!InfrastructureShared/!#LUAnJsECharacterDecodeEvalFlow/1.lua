-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAnJsECharacterDecodeEvalFlow\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = string.gsub
  local l_1_2 = l_1_0
  local l_1_3 = "([^%w])"
  do
    local l_1_4 = "%%%1"
    do return l_1_1(l_1_2, l_1_3, l_1_4) end
    -- DECOMPILER ERROR at PC7: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

do
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  if not (function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_0
  if l_2_0 == nil then
    return false
  end
  local l_2_1 = (string.lower)(tostring(l_2_0))
  do
    local l_2_2 = (string.gsub)(l_2_1, "%s+", "")
    for l_2_6 in (string.gmatch)(l_2_2, "eval%(([%a_$][%w_$]*)%)") do
      local l_2_7 = l_0_0(l_2_6)
      local l_2_8 = "eval%(" .. l_2_7 .. "%)"
      local l_2_9 = 1
      while 1 do
        local l_2_10 = (string.find)(l_2_2, l_2_8, l_2_9)
        if l_2_10 == nil then
          break
        end
        local l_2_11 = (string.sub)(l_2_2, 1, l_2_10 - 1)
        local l_2_12 = l_2_7 .. "%+=string%.fromcharcode%("
        local l_2_13 = l_2_7 .. "%+=fromcharcode%("
        local l_2_14 = l_2_7 .. "=" .. l_2_7 .. "%+string%.fromcharcode%("
        local l_2_15 = l_2_7 .. "=" .. l_2_7 .. "%+fromcharcode%("
        if (string.find)(l_2_11, l_2_12) ~= nil or (string.find)(l_2_11, l_2_13) ~= nil or (string.find)(l_2_11, l_2_14) ~= nil or (string.find)(l_2_11, l_2_15) ~= nil and (string.find)(l_2_11, "charcodeat%(") ~= nil then
          return true
        end
        l_2_9 = l_2_10 + 1
      end
    end
    do return false end
    -- DECOMPILER ERROR: 3 unprocessed JMP targets
  end
end
)(headerpage) and not (function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_0
  if l_2_0 == nil then
    return false
  end
  local l_2_1 = (string.lower)(tostring(l_2_0))
  do
    local l_2_2 = (string.gsub)(l_2_1, "%s+", "")
    for l_2_6 in (string.gmatch)(l_2_2, "eval%(([%a_$][%w_$]*)%)") do
      local l_2_7 = l_0_0(l_2_6)
      local l_2_8 = "eval%(" .. l_2_7 .. "%)"
      local l_2_9 = 1
      while 1 do
        local l_2_10 = (string.find)(l_2_2, l_2_8, l_2_9)
        if l_2_10 == nil then
          break
        end
        local l_2_11 = (string.sub)(l_2_2, 1, l_2_10 - 1)
        local l_2_12 = l_2_7 .. "%+=string%.fromcharcode%("
        local l_2_13 = l_2_7 .. "%+=fromcharcode%("
        local l_2_14 = l_2_7 .. "=" .. l_2_7 .. "%+string%.fromcharcode%("
        local l_2_15 = l_2_7 .. "=" .. l_2_7 .. "%+fromcharcode%("
        if (string.find)(l_2_11, l_2_12) ~= nil or (string.find)(l_2_11, l_2_13) ~= nil or (string.find)(l_2_11, l_2_14) ~= nil or (string.find)(l_2_11, l_2_15) ~= nil and (string.find)(l_2_11, "charcodeat%(") ~= nil then
          return true
        end
        l_2_9 = l_2_10 + 1
      end
    end
    do return false end
    -- DECOMPILER ERROR: 3 unprocessed JMP targets
  end
end
)(footerpage) then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC19: freeLocal<0 in 'ReleaseLocals'

end

