-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb388702013\0x00001258_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_1 = safeJsonDeserialize(l_0_0)
  local l_0_2 = 0
  do
    if not l_0_1.sig_count then
      local l_0_3 = l_0_1 == nil or nil
    end
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC31: Confused about usage of register: R2 in 'UnsetPending'

    if l_0_3 ~= nil and l_0_3 < 60 then
      local l_0_4 = 1
      local l_0_5 = l_0_1.file_size
      local l_0_6 = {}
      local l_0_7 = true
      local l_0_8, l_0_9, l_0_10, l_0_11 = nil, nil, nil, nil
      if l_0_5 ~= nil then
        for l_0_15 = 1, #l_0_5, 4 do
          l_0_8 = l_0_5[l_0_15]
          l_0_9 = l_0_5[l_0_15 + 1]
          l_0_10 = l_0_5[l_0_15 + 2]
          l_0_11 = l_0_5[l_0_15 + 3]
          if l_0_8 ~= nil and l_0_9 ~= nil and l_0_10 ~= nil and l_0_11 ~= nil then
            if l_0_6[l_0_9] == nil then
              l_0_6[l_0_9] = 1
              l_0_2 = l_0_2 + 1
            end
            if l_0_6[l_0_11] == nil then
              l_0_6[l_0_11] = 1
              l_0_2 = l_0_2 + 1
            end
            if l_0_9 < 1024 or l_0_11 < 1024 then
              l_0_7 = false
            end
          end
        end
      end
      do
        do
          if l_0_7 == true and l_0_2 >= 8 then
            return mp.INFECTED
          end
          return mp.CLEAN
        end
      end
    end
  end
end

