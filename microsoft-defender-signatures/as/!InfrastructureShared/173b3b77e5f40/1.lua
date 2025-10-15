-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\173b3b77e5f40\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_3, l_0_4 = nil, nil
  end
  do
    if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
      local l_0_2, l_0_5 = , (mp.GetExecutablesFromCommandLine)((this_sigattrlog[4]).utf8p2)
    end
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC40: Confused about usage of register: R1 in 'UnsetPending'

    if next(l_0_2) ~= nil and next(l_0_5) ~= nil then
      local l_0_6, l_0_7 = nil
      -- DECOMPILER ERROR at PC46: Overwrote pending register: R2 in 'AssignReg'

      -- DECOMPILER ERROR at PC48: Overwrote pending register: R3 in 'AssignReg'

      -- DECOMPILER ERROR at PC51: Confused about usage of register: R2 in 'UnsetPending'

      if nil ~= nil and nil == nil then
        local l_0_8 = nil
        if (bm.get_imagepath)() ~= nil and ((string.match)((bm.get_imagepath)(), "/bin/%a*sh") or (string.find)((bm.get_imagepath)(), "perl", 1, true) or (string.find)((bm.get_imagepath)(), "python", 1, true)) then
          local l_0_9, l_0_10 = nil
          for l_0_14,l_0_15 in ipairs(R8_PC88) do
            local l_0_11, l_0_12 = (bm.get_process_relationships)()
            -- DECOMPILER ERROR at PC94: Confused about usage of register: R11 in 'UnsetPending'

            ;
            (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", R11_PC94.ppid)
          end
          return mp.INFECTED
        end
      end
    end
    do
      return mp.CLEAN
    end
  end
end

