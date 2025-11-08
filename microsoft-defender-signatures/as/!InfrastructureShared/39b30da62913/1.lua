-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\39b30da62913\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

  if isnull(l_0_0) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_2 = (string.lower)(l_0_0)
  do
    local l_0_3 = {}
    -- DECOMPILER ERROR at PC38: No list found for R1 , SetList fails

    -- DECOMPILER ERROR at PC39: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC40: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC41: Overwrote pending register: R4 in 'AssignReg'

    if ("invoke-expression")("downloadstring", "downloadfile") then
      return mp.INFECTED
    end
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

