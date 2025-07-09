-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b3a2e63775\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil
  end
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  if isnull(l_0_0) or (string.len)(l_0_0) == 0 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

  for l_0_7 in l_0_0:gmatch("([^\r\n]*)\n?") do
    local l_0_4 = nil
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R4 in 'UnsetPending'

    local l_0_9 = pcall(mp.ContextualExpandEnvironmentVariables, R4_PC34)
    if l_0_9 and mp.ContextualExpandEnvironmentVariables and (sysio.IsFileExists)(R8_PC43) then
      (bm.add_related_file)(R8_PC43)
    end
  end
  return mp.INFECTED
end

