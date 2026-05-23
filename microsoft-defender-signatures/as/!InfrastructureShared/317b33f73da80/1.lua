-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\317b33f73da80\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[17]).matched and (this_sigattrlog[17]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_8 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil then
    local l_0_2 = nil
    for l_0_6,l_0_7 in ipairs((mp.GetExecutablesFromCommandLine)(l_0_0)) do
      local l_0_3 = nil
      -- DECOMPILER ERROR at PC25: Confused about usage of register: R6 in 'UnsetPending'

      if (sysio.IsFileExists)(R6_PC25) then
        (bm.add_related_file)(R6_PC25)
      end
    end
  end
  do
    local l_0_9, l_0_10 = (bm.get_process_relationships)()
    if l_0_9 ~= nil then
      for l_0_14,l_0_15 in ipairs(l_0_9) do
        if l_0_15.image_path and (string.find)((string.lower)(l_0_15.image_path), "\\bun.exe", -8, true) then
          return mp.CLEAN
        end
      end
    end
    do
      for l_0_19,l_0_20 in ipairs(l_0_10) do
        if l_0_20.image_path and (string.find)((string.lower)(l_0_20.image_path), "\\bun.exe", -8, true) then
          TrackPidAndTechniqueBM(l_0_20.ppid, "T1195.001", "SuspBunProcess", 1800)
        end
      end
      return mp.INFECTED
    end
  end
end

