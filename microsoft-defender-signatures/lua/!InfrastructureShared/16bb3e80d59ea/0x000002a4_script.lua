-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\16bb3e80d59ea\0x000002a4_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[3]).matched) and (this_sigattrlog[3]).utf8p2 ~= nil then
      local l_0_1 = (this_sigattrlog[2]).utf8p2
    else
    end
    -- DECOMPILER ERROR at PC68: Overwrote pending register: R0 in 'AssignReg'

    if (not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p2 == nil or (this_sigattrlog[5]).matched) and (this_sigattrlog[5]).utf8p2 ~= nil then
      local l_0_2, l_0_3 = (this_sigattrlog[4]).utf8p2
    else
      do
        do return mp.CLEAN end
        -- DECOMPILER ERROR at PC75: Confused about usage of register: R0 in 'UnsetPending'

        local l_0_4 = nil
        if (string.find)((string.lower)(l_0_2), "/bin/", 1, true) == 1 or (((string.find)((string.lower)(l_0_2), "/usr/", 1, true) == 1 and not (string.find)((string.lower)(l_0_2), "/usr/local/", 1, true) == 1) or (string.find)((string.lower)(l_0_2), "/applications/microsoft defender.app/", 1, true) == 1) then
          return mp.CLEAN
        end
        if (string.match)(l_0_4, "/%.") then
          TrackPidAndTechniqueBM("BM", "T1059.006", "Execution_CommandandScriptingInterpreter_Python")
          return mp.INFECTED
        end
        return mp.CLEAN
      end
    end
  end
end

