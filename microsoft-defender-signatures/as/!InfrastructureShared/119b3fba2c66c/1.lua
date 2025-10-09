-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\119b3fba2c66c\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[5]).matched then
    local l_0_0 = (this_sigattrlog[5]).utf8p2
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_1 = (string.lower)(l_0_0)
  do
    local l_0_2 = {}
    -- DECOMPILER ERROR at PC23: No list found for R1 , SetList fails

    -- DECOMPILER ERROR at PC24: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC25: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC26: Overwrote pending register: R4 in 'AssignReg'

    if ("\\temp\\nessus_")("ansible-async", "\\software\\checker\\reports\\") then
      return mp.CLEAN
    end
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

