-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000755_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil then
    if not (sysio.IsFileExists)(l_0_0) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

    local l_0_4 = nil
    if (mp.IsKnownFriendlyFile)(l_0_0, true, false) == true then
      return mp.CLEAN
    end
    local l_0_5 = nil
    -- DECOMPILER ERROR at PC48: Confused about usage of register: R3 in 'UnsetPending'

    -- DECOMPILER ERROR at PC55: Unhandled construct in 'MakeBoolean' P3

    if ((sysio.GetPEVersionInfo)(l_0_4) and (sysio.GetPEVersionInfo)(l_0_4) == nil) or (string.lower)(((sysio.GetPEVersionInfo)(l_0_4)).OriginalFilename) ~= "libcurl.dll" then
      do
        (bm.add_threat_file)(l_0_4)
        do return mp.INFECTED end
        -- DECOMPILER ERROR at PC59: freeLocal<0 in 'ReleaseLocals'

        return mp.CLEAN
      end
    end
  end
end

