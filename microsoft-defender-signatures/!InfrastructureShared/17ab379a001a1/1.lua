-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\17ab379a001a1\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC23: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[2]).matched or (this_sigattrlog[3]).matched then
      local l_0_1 = (this_sigattrlog[2]).utf8p2
    end
    -- DECOMPILER ERROR at PC39: Overwrote pending register: R0 in 'AssignReg'

    do
      if not (this_sigattrlog[4]).matched or (this_sigattrlog[5]).matched then
        local l_0_2 = (this_sigattrlog[4]).utf8p2
      end
      -- DECOMPILER ERROR at PC55: Overwrote pending register: R0 in 'AssignReg'

      do
        if not (this_sigattrlog[6]).matched or (this_sigattrlog[7]).matched then
          local l_0_3 = (this_sigattrlog[6]).utf8p2
        end
        -- DECOMPILER ERROR at PC71: Overwrote pending register: R0 in 'AssignReg'

        do
          if not (this_sigattrlog[8]).matched or (this_sigattrlog[9]).matched then
            local l_0_4 = (this_sigattrlog[8]).utf8p2
          end
          -- DECOMPILER ERROR at PC72: Confused about usage of register: R0 in 'UnsetPending'

          if l_0_4 == nil then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

          local l_0_5 = (string.lower)(l_0_4)
          local l_0_6 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%WINDIR%\\SYSTEM32\\"))
          if not l_0_5:find(l_0_6, 1, true) then
            return mp.CLEAN
          end
          if (mp.IsKnownFriendlyFile)(l_0_5, false, true) == false then
            (bm.add_related_string)("FriendlyFile", "false", bm.RelatedStringBMReport)
            return mp.INFECTED
          end
          local l_0_7 = (sysio.GetPEVersionInfo)(l_0_5)
          if not l_0_7 or not l_0_7.OriginalFilename or l_0_7.OriginalFilename == "" then
            (bm.add_related_string)("OriginalFileName_PeParser", "null", bm.RelatedStringBMReport)
            return mp.INFECTED
          end
          local l_0_8 = (string.lower)(l_0_7.OriginalFilename)
          ;
          (MpCommon.SetOriginalFileName)(l_0_5, l_0_8)
          local l_0_9 = l_0_5:match("(%w+%.exe)$")
          if l_0_8 == l_0_9 then
            return mp.CLEAN
          end
          if l_0_8 == "register-cimprovider2.exe" and l_0_9 == "register-cimprovider.exe" then
            return mp.CLEAN
          end
          ;
          (bm.add_related_string)("OriginalFileName_PeParser", l_0_8, bm.RelatedStringBMReport)
          return mp.INFECTED
        end
      end
    end
  end
end

