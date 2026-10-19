-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAnJsBBase64EvalFlow\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 80
local l_0_1 = 3072
local l_0_3 = function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_0, l_0_1
  do
    local l_1_1 = (string.len)(l_1_0)
    do return l_0_0 <= l_1_1 and l_1_1 <= l_0_1 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

do
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R6 in 'UnsetPending'

  if not (function(l_5_0)
  -- function num : 0_4 , upvalues : l_0_4, l_0_5
  if l_5_0 == nil then
    return false
  end
  local l_5_1 = (string.lower)(tostring(l_5_0))
  if not l_0_4(l_5_1) then
    return l_0_5(l_5_1)
  end
end
)(headerpage) and not (function(l_5_0)
  -- function num : 0_4 , upvalues : l_0_4, l_0_5
  if l_5_0 == nil then
    return false
  end
  local l_5_1 = (string.lower)(tostring(l_5_0))
  if not l_0_4(l_5_1) then
    return l_0_5(l_5_1)
  end
end
)(footerpage) then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC30: freeLocal<0 in 'ReleaseLocals'

  -- WARNING: undefined locals caused missing assignments!
end

