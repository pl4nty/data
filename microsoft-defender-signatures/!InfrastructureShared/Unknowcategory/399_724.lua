-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\399_724.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[3]).matched then
  do
    if (this_sigattrlog[3]).utf8p1 ~= nil then
      local l_0_0 = nil
    end
    -- DECOMPILER ERROR at PC20: Overwrote pending register: R1 in 'AssignReg'

    do
      if (this_sigattrlog[3]).np2 ~= nil then
        local l_0_2, l_0_3, l_0_4, l_0_5 = , nil
      end
      -- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

      if not l_0_2 then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

      if not l_0_3 then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC33: Confused about usage of register: R0 in 'UnsetPending'

      local l_0_1 = (string.lower)(l_0_2)
      -- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

      -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

      if l_0_3 == 3 or l_0_3 == 0 then
        return mp.CLEAN
      end
      if l_0_1 == "customblocklist" then
        return mp.CLEAN
      end
      local l_0_6 = nil
      ;
      (nri.AddTelemetry)((mp.bitor)((mp.bitor)(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), {useragent = (nri.GetHttpRequestHeader)("User-Agent"), SmartScreen_category = l_0_1, SmartScreen_determination = l_0_6})
      return mp.INFECTED
    end
  end
end

