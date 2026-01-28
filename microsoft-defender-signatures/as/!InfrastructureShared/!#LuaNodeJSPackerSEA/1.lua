-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaNodeJSPackerSEA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1, l_1_2, l_1_3)
  -- function num : 0_0
  local l_1_19, l_1_20 = nil
  local l_1_4 = ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE]).RVA
  local l_1_5 = l_1_4 + l_1_0
  if not l_1_5 or not (pe.contains_rva)(l_1_3, l_1_5) or not (pe.contains_rva)(l_1_3, l_1_5 + 16) then
    return nil
  end
  local l_1_6 = (pe.mmap_rva)(l_1_5, 16)
  local l_1_7 = (mp.readu_u16)(l_1_6, 13) + (mp.readu_u16)(l_1_6, 15)
  if l_1_7 >= 10 then
    return nil
  end
  local l_1_8 = l_1_5 + 16
  if not (pe.contains_rva)(l_1_3, l_1_8) or not (pe.contains_rva)(l_1_3, l_1_8 + l_1_7 * 8) then
    return nil
  end
  do
    local l_1_9 = (pe.mmap_rva)(l_1_8, l_1_7 * 8)
    for l_1_13 = 1, l_1_7 * 8, 8 do
      local l_1_14 = (mp.readu_u32)(l_1_9, l_1_13)
      if l_1_1 == 1 and l_1_14 == l_1_2 then
        local l_1_15 = mp.bitand
        do
          local l_1_18 = mp.readu_u32
          l_1_18 = l_1_18(l_1_9, l_1_13 + 4)
          local l_1_16 = nil
          l_1_16 = 2147483647
          local l_1_17 = nil
          do return l_1_15(l_1_18, l_1_16) end
          -- DECOMPILER ERROR at PC91: Confused about usage of register R16 for local variables in 'ReleaseLocals'

          if l_1_1 == 2 and (mp.bitand)(l_1_14, 2147483648) then
            local l_1_21 = nil
            l_1_21 = l_1_4 + (mp.bitand)(l_1_14, 2147483647)
            local l_1_22 = nil
            l_1_22 = pe
            l_1_22 = l_1_22.contains_rva
            l_1_22 = l_1_22(l_1_3, l_1_21)
            if l_1_22 then
              l_1_22 = pe
              l_1_22 = l_1_22.contains_rva
              l_1_22 = l_1_22(l_1_3, l_1_21 + 2)
            end
            if not l_1_22 then
              l_1_22 = false
              return l_1_22
            end
            l_1_22 = mp
            l_1_22 = l_1_22.readu_u16
            l_1_22 = l_1_22((pe.mmap_rva)(l_1_21, 2), 1)
            if l_1_22 == #l_1_2 then
              l_1_22 = pe
              l_1_22 = l_1_22.mmap_rva
              l_1_22 = l_1_22(l_1_21 + 2, #l_1_2 * 2)
              l_1_22 = l_1_22 .. "\000\000"
              local l_1_23 = nil
              l_1_23 = mp
              l_1_23 = l_1_23.utf16to8
              l_1_23 = l_1_23(l_1_22)
              if l_1_23 == l_1_2 then
                do
                  do return (mp.bitand)(l_1_14, 2147483647) end
                  -- DECOMPILER ERROR at PC150: Confused about usage of register R15 for local variables in 'ReleaseLocals'

                  -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
    do return nil end
    -- DECOMPILER ERROR at PC153: Confused about usage of register R13 for local variables in 'ReleaseLocals'

  end
end

if ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE]).RVA == 0 or ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE]).RVA == nil then
  return mp.CLEAN
end
do
  local l_0_1, l_0_2 = pehdr.NumberOfSections < 10 and pehdr.NumberOfSections or 10
  local l_0_3 = nil
  for l_0_7 = 1, l_0_3 do
    local l_0_4 = -1
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R6 in 'UnsetPending'

    if (pe.contains_rva)(R6_PC36, ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE]).RVA) then
      l_0_4 = R6_PC36
    end
  end
  -- DECOMPILER ERROR at PC48: Confused about usage of register: R2 in 'UnsetPending'

  if l_0_4 == -1 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC57: Confused about usage of register: R2 in 'UnsetPending'

  local l_0_8 = nil
  if l_0_0(0, 1, 10, l_0_4) == nil then
    return mp.CLEAN
  end
  if l_0_0(l_0_0(0, 1, 10, l_0_4), 2, "NODE_SEA_BLOB", l_0_8) == nil then
    return mp.CLEAN
  end
  return mp.INFECTED
end

