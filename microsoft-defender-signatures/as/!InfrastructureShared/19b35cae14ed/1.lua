-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\19b35cae14ed\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[1]).matched then
  local l_0_0 = nil
  -- DECOMPILER ERROR at PC8: Overwrote pending register: R1 in 'AssignReg'

  local l_0_1 = nil
end
do
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_1 ~= nil and l_0_0 ~= nil then
    local l_0_2 = nil
    local l_0_3 = nil
    local l_0_4 = nil
    local l_0_5 = table.insert
    l_0_5({}, {Context = l_0_3, PackageInfo = l_0_2})
    l_0_5 = #l_0_4
    if l_0_5 > 0 then
      l_0_5 = bm
      l_0_5 = l_0_5.set_detection_string
      l_0_5(safeJsonSerialize(l_0_4))
      l_0_5 = mp
      l_0_5 = l_0_5.INFECTED
      return l_0_5
    end
  end
  do
    return mp.CLEAN
  end
end

