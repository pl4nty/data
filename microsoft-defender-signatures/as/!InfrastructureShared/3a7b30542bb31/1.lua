-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3a7b30542bb31\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[19]).matched and (this_sigattrlog[19]).utf8p2 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[20]).matched or (this_sigattrlog[20]).utf8p2 == nil or (this_sigattrlog[21]).matched) and (this_sigattrlog[21]).utf8p2 ~= nil then
      local l_0_1, l_0_2, l_0_9 = (this_sigattrlog[20]).utf8p2
    end
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC45: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_1 ~= nil then
      local l_0_3 = nil
      for l_0_7,l_0_8 in ipairs((mp.GetExecutablesFromCommandLine)(l_0_1)) do
        local l_0_4 = nil
        -- DECOMPILER ERROR at PC53: Confused about usage of register: R6 in 'UnsetPending'

        if (sysio.IsFileExists)(R6_PC53) then
          (bm.add_related_file)(R6_PC53)
        end
      end
    end
    do
      local l_0_10, l_0_11 = (bm.get_process_relationships)()
      if l_0_10 ~= nil then
        for l_0_15,l_0_16 in ipairs(l_0_10) do
          if l_0_16.image_path and (string.find)((string.lower)(l_0_16.image_path), "\\bun.exe", -8, true) then
            return mp.CLEAN
          end
        end
      end
      do
        for l_0_20,l_0_21 in ipairs(l_0_11) do
          if l_0_21.image_path and (string.find)((string.lower)(l_0_21.image_path), "\\bun.exe", -8, true) then
            TrackPidAndTechniqueBM(l_0_21.ppid, "T1195.001", "SuspBunProcess", 1800)
          end
        end
        local l_0_22, l_0_23 = pcall(reportBmInfo)
        if not l_0_22 and l_0_23 then
          (bm.add_related_string)("bmInfoFailReason", tostring(l_0_23), bm.RelatedStringBMReport)
        end
        return mp.INFECTED
      end
    end
  end
end

