-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7bb31a6ad616\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2 = nil
  end
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

  if isnull(l_0_0) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_3 = nil
  for l_0_7,l_0_8 in ipairs((mp.GetExecutablesFromCommandLine)(l_0_0)) do
    local l_0_4 = nil
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R6 in 'UnsetPending'

    if (sysio.IsFileExists)(R6_PC31) then
      (bm.add_related_file)(R6_PC31)
    end
  end
  return mp.INFECTED
end

