-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\285b3387555be\0x00000c78_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

  do
    if l_0_0 then
      local l_0_2, l_0_3 = , pcall(string.match, l_0_0, "fsize:(%d+)")
      if not l_0_3 or isnull(R4_PC29) then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC41: Confused about usage of register: R2 in 'UnsetPending'

      if tonumber(R4_PC29) and tonumber(R4_PC29) >= 1000 then
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end

