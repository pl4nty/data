-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f1b30b4ab94f\0x0000c2c1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[5]).matched then
  local l_0_0, l_0_1 = nil
else
  do
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_0 == nil then
      return mp.CLEAN
    end
    local l_0_2 = nil
    local l_0_3 = contains
    local l_0_4 = l_0_2
    l_0_3 = l_0_3(l_0_4, {"rundll32.exe", "regsvr32.exe"})
    if l_0_3 then
      l_0_3 = mp
      l_0_3 = l_0_3.CLEAN
      return l_0_3
    end
    l_0_3 = string
    l_0_3 = l_0_3.match
    l_0_4 = l_0_2
    l_0_3 = l_0_3(l_0_4, "targetprocessppid:(%d+):(%d+)")
    if not l_0_3 or not l_0_4 then
      return mp.CLEAN
    end
    local l_0_5 = nil
    if (sysio.GetFileNameFromProcess)("pid:" .. l_0_3 .. ",ProcessStart:" .. R6_PC49) and contains(R6_PC49, "\\windows\\syswow64") then
      local l_0_6 = nil
      -- DECOMPILER ERROR at PC63: Overwrote pending register: R6 in 'AssignReg'

      local l_0_7 = contains
      local l_0_8 = R6_PC49
      l_0_7 = l_0_7(l_0_8, {"svchost.exe"})
      if l_0_7 then
        l_0_7 = mp
        l_0_7 = l_0_7.CLEAN
        return l_0_7
      end
      l_0_7 = bm
      l_0_7 = l_0_7.add_related_string
      -- DECOMPILER ERROR at PC75: Overwrote pending register: R6 in 'AssignReg'

      l_0_7(l_0_8, l_0_6, bm.RelatedStringBMReport)
      l_0_7 = triggerMemoryScanOnProcessTree
      -- DECOMPILER ERROR at PC81: Overwrote pending register: R6 in 'AssignReg'

      l_0_7(l_0_8, true, "SMS_M", 100, "Behavior:Win32/DllInject.SE")
      l_0_7 = mp
      l_0_7 = l_0_7.INFECTED
      return l_0_7
    end
    do
      return mp.CLEAN
    end
  end
end

