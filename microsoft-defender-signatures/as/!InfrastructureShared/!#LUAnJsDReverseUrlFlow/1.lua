-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAnJsDReverseUrlFlow\1.luac 

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

local l_0_1 = function(l_2_0)
  -- function num : 0_1
  local l_2_1 = "function([%a_$][%w_$]*)%(([%a_$][%w_$]*)%)%{" .. "return([%a_$][%w_$]*)%.split%([\'\"][\'\"]%)" .. "%.reverse%(%)%.join%([\'\"][\'\"]%)"
  for l_2_5,l_2_6,l_2_7 in (string.gmatch)(l_2_0, l_2_1) do
    if l_2_6 == l_2_7 then
      return l_2_5
    end
  end
  return nil
end

do
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R3 in 'UnsetPending'

  if not (function(l_4_0)
  -- function num : 0_3 , upvalues : l_0_1, l_0_2
  if l_4_0 == nil then
    return false
  end
  local l_4_1 = (string.lower)(tostring(l_4_0))
  local l_4_2 = (string.gsub)(l_4_1, "%s+", "")
  local l_4_3 = l_0_1(l_4_2)
  if l_4_3 == nil then
    return false
  end
  local l_4_4 = l_0_2
  local l_4_5 = l_4_2
  do
    local l_4_6 = l_4_3
    do return l_4_4(l_4_5, l_4_6) end
    -- DECOMPILER ERROR at PC28: Confused about usage of register R5 for local variables in 'ReleaseLocals'

  end
end
)(headerpage) and not (function(l_4_0)
  -- function num : 0_3 , upvalues : l_0_1, l_0_2
  if l_4_0 == nil then
    return false
  end
  local l_4_1 = (string.lower)(tostring(l_4_0))
  local l_4_2 = (string.gsub)(l_4_1, "%s+", "")
  local l_4_3 = l_0_1(l_4_2)
  if l_4_3 == nil then
    return false
  end
  local l_4_4 = l_0_2
  local l_4_5 = l_4_2
  do
    local l_4_6 = l_4_3
    do return l_4_4(l_4_5, l_4_6) end
    -- DECOMPILER ERROR at PC28: Confused about usage of register R5 for local variables in 'ReleaseLocals'

  end
end
)(footerpage) then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC23: freeLocal<0 in 'ReleaseLocals'

  -- WARNING: undefined locals caused missing assignments!
end

