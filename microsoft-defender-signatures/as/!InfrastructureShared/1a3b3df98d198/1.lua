-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1a3b3df98d198\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_3, l_0_6, l_0_7 = nil, nil, nil
  end
  do
    if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
      local l_0_2, l_0_4, l_0_8 = , (mp.GetExecutablesFromCommandLine)((this_sigattrlog[4]).utf8p2)
    end
    do
      if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil then
        local l_0_5, l_0_9 = nil
      end
      -- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

      -- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

      if next(l_0_5) ~= nil and next(l_0_9) ~= nil and next((mp.GetExecutablesFromCommandLine)((this_sigattrlog[5]).utf8p2)) ~= nil then
        local l_0_10, l_0_11, l_0_12 = nil
        -- DECOMPILER ERROR at PC68: Overwrote pending register: R3 in 'AssignReg'

        -- DECOMPILER ERROR at PC70: Overwrote pending register: R4 in 'AssignReg'

        -- DECOMPILER ERROR at PC72: Overwrote pending register: R5 in 'AssignReg'

        -- DECOMPILER ERROR at PC75: Confused about usage of register: R3 in 'UnsetPending'

        -- DECOMPILER ERROR at PC77: Confused about usage of register: R4 in 'UnsetPending'

        if nil ~= nil and nil == nil and nil == nil then
          local l_0_13 = nil
          if (bm.get_imagepath)() ~= nil and ((string.match)((bm.get_imagepath)(), "/bin/%a*sh") or (string.find)((bm.get_imagepath)(), "perl", 1, true) or (string.find)((bm.get_imagepath)(), "python", 1, true)) then
            local l_0_14, l_0_15 = nil
            for l_0_19,l_0_20 in ipairs(R10_PC114) do
              local l_0_16, l_0_17, l_0_18 = , (bm.get_process_relationships)()
              -- DECOMPILER ERROR at PC120: Confused about usage of register: R13 in 'UnsetPending'

              ;
              (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", R13_PC120.ppid)
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
end

