-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a630_799.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_5, l_0_6, l_0_7, l_0_8 = nil
for l_0_4 = pehdr.NumberOfSections, 1, -1 do
  local l_0_1 = nil
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R4 in 'UnsetPending'

  -- DECOMPILER ERROR at PC10: Confused about usage of register: R4 in 'UnsetPending'

  if (pesecs[l_0_8]).Name == ".data" then
    l_0_1 = l_0_8
    break
  end
end
do
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_9 = nil
  local l_0_10 = (pesecs[l_0_1]).PointerToRawData
  local l_0_11 = (pesecs[l_0_9]).SizeOfRawData
  if (hstrlog[1]).VA_all then
    (table.insert)({}, (hstrlog[1]).VA_all)
  end
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R3 in 'UnsetPending'

  if (hstrlog[2]).VA_all then
    (table.insert)({}, (hstrlog[2]).VA_all)
  end
  -- DECOMPILER ERROR at PC56: Confused about usage of register: R3 in 'UnsetPending'

  if (hstrlog[3]).VA_all then
    (table.insert)({}, (hstrlog[3]).VA_all)
  end
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R3 in 'UnsetPending'

  if (hstrlog[4]).VA_all then
    (table.insert)({}, (hstrlog[4]).VA_all)
  end
  -- DECOMPILER ERROR at PC80: Confused about usage of register: R3 in 'UnsetPending'

  if (hstrlog[5]).VA_all then
    (table.insert)({}, (hstrlog[5]).VA_all)
  end
  -- DECOMPILER ERROR at PC92: Confused about usage of register: R3 in 'UnsetPending'

  if (hstrlog[6]).VA_all then
    (table.insert)({}, (hstrlog[6]).VA_all)
  end
  -- DECOMPILER ERROR at PC98: Confused about usage of register: R3 in 'UnsetPending'

  for l_0_15,l_0_16 in ipairs({}) do
    local l_0_12 = nil
    -- DECOMPILER ERROR at PC102: Confused about usage of register: R8 in 'UnsetPending'

    for l_0_20,l_0_21 in ipairs(R8_PC102) do
      -- DECOMPILER ERROR at PC105: Confused about usage of register: R13 in 'UnsetPending'

      if l_0_10 < R13_PC105 and R13_PC105 < l_0_10 + l_0_11 then
        return mp.INFECTED
      end
    end
  end
  return mp.CLEAN
end

