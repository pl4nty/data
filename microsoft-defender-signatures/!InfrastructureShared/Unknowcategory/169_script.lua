-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\169_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0, l_0_1, l_0_2 = nil
  end
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil then
    local l_0_3 = nil
    if (string.match)(l_0_0, "\\([^\\]+)\\[^\\]+$") == "adfs" then
      local l_0_4 = nil
      local l_0_5 = (string.match)(l_0_3, "\\([^\\]+)$")
      if (sysio.IsFileExists)((string.lower)((MpCommon.ExpandEnvironmentVariables)("%WINDIR%\\SYSTEM32\\")) .. l_0_5) then
        (bm.add_related_file)(l_0_3)
        return mp.INFECTED
      end
    end
  end
  do
    return mp.CLEAN
  end
end

