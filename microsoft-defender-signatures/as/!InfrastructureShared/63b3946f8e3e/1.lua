-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\63b3946f8e3e\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_1 = normalize_path(l_0_0)
  local l_0_2 = nil
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    l_0_2 = (string.lower)((this_sigattrlog[2]).utf8p1)
  end
  if l_0_2 == nil then
    return mp.CLEAN
  end
  l_0_2 = normalize_path(l_0_2)
  local l_0_3 = function(l_1_0)
  -- function num : 0_0
  local l_1_1, l_1_2 = l_1_0:match, l_1_0
  do
    local l_1_3 = "^(.*)[/\\][^/\\]+$"
    do return l_1_1(l_1_2, l_1_3) end
    -- DECOMPILER ERROR at PC4: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

  if l_0_3(l_0_1) == l_0_3(l_0_2) then
    return mp.INFECTED
  end
  return mp.CLEAN
end

