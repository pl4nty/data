-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5eb37450eec4\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
if (this_sigattrlog[1]).matched then
  do
    if (this_sigattrlog[1]).utf8p1 ~= nil then
      local l_0_2 = false
      if StringStartsWith((string.lower)((this_sigattrlog[1]).utf8p1), "\\device\\harddiskvolumeshadowcopy") or (string.find)((string.lower)((this_sigattrlog[1]).utf8p1), "\\microsoft\\onedrive\\", 1, true) ~= nil or (string.find)((string.lower)((this_sigattrlog[1]).utf8p1), "\\microsoft onedrive\\", 1, true) ~= nil then
        return mp.CLEAN
      end
    end
    if (this_sigattrlog[1]).utf8p2 ~= nil then
      l_0_1 = (string.lower)((this_sigattrlog[1]).utf8p2)
      if not (sysio.IsFileExists)(l_0_1) then
        return mp.CLEAN
      end
      local l_0_3 = nil
      if (mp.IsKnownFriendlyFile)(l_0_1, true, false) == true then
        return mp.CLEAN
      end
      local l_0_4 = nil
      -- DECOMPILER ERROR at PC89: Confused about usage of register: R4 in 'UnsetPending'

      -- DECOMPILER ERROR at PC93: Unhandled construct in 'MakeBoolean' P3

      if ((sysio.GetPEVersionInfo)(l_0_1) and (sysio.GetPEVersionInfo)(l_0_1) == nil) or (string.lower)(((sysio.GetPEVersionInfo)(l_0_1)).OriginalFilename) ~= "filesyncclient.dll" then
        l_0_3 = true
      end
    end
    do
      -- DECOMPILER ERROR at PC94: Confused about usage of register: R1 in 'UnsetPending'

      -- DECOMPILER ERROR at PC96: Confused about usage of register: R0 in 'UnsetPending'

      -- DECOMPILER ERROR at PC100: Confused about usage of register: R0 in 'UnsetPending'

      if l_0_3 == true and l_0_1 ~= nil then
        (bm.add_related_file)(l_0_1)
        return mp.INFECTED
      end
      do return mp.CLEAN end
      -- DECOMPILER ERROR at PC108: freeLocal<0 in 'ReleaseLocals'

    end
  end
end

