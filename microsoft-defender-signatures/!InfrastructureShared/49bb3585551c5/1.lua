-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\49bb3585551c5\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC3: Overwrote pending register: R0 in 'AssignReg'

local l_0_0 = nil
-- DECOMPILER ERROR at PC11: Overwrote pending register: R1 in 'AssignReg'

do
  if (this_sigattrlog[7]).matched then
    local l_0_1, l_0_9, l_0_10 = nil
  end
  if l_0_0 then
    l_0_0 = (string.lower)(l_0_0)
    if (string.find)(l_0_0, "\\services.exe", -13, true) and ((string.find)(l_0_0, "\\windows\\system32\\", -30, true) or (string.find)(l_0_0, "\\windows\\winsxs\\", 1, true)) then
      return mp.CLEAN
    end
    if (string.find)(l_0_0, "\\reg.exe", -8, true) or (string.find)(l_0_0, "\\regedit.exe", -12, true) or (string.find)(l_0_0, "\\powershell.exe", -15, true) or (string.find)(l_0_0, "\\cmd.exe", -8, true) then
      local l_0_2, l_0_3 = , (bm.get_process_relationships)()
      if l_0_3 then
        for l_0_7,l_0_8 in ipairs(l_0_3) do
          local l_0_4 = nil
          -- DECOMPILER ERROR at PC94: Confused about usage of register: R8 in 'UnsetPending'

          if R8_PC94.ppid and (mp.bitand)(R8_PC94.reason_ex, 1) == 1 then
            (bm.add_related_process)(R8_PC94.ppid)
          end
        end
      end
    end
  end
  do
    if l_0_2 then
      l_0_3 = string
      l_0_3 = l_0_3.lower
      l_0_3 = l_0_3(l_0_2)
      l_0_2 = l_0_3
      local l_0_11 = nil
      l_0_3 = string
      l_0_3 = l_0_3.find
      l_0_11 = l_0_2
      l_0_3 = l_0_3(l_0_11, "\\programdata\\microsoft\\windows defender\\definition updates\\{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}\\mpksldrv%.sys")
      if l_0_3 then
        l_0_3 = mp
        l_0_3 = l_0_3.CLEAN
        return l_0_3
      end
    end
    do
      l_0_3 = mp
      l_0_3 = l_0_3.INFECTED
      return l_0_3
    end
  end
end

