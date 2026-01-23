-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\126b35cdcfdda\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
    return mp.CLEAN
  end
  local l_0_2 = nil
  -- DECOMPILER ERROR at PC42: Overwrote pending register: R1 in 'AssignReg'

  if not (this_sigattrlog[1]).matched or (this_sigattrlog[1]).utf8p1 == nil or not nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

  do
    if not (sysio.GetPEVersionInfo)(nil) then
      local l_0_3, l_0_4, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13 = , {}
    end
    -- DECOMPILER ERROR at PC55: Confused about usage of register: R2 in 'UnsetPending'

    if l_0_4.OriginalFilename then
      local l_0_5 = nil
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R2 in 'UnsetPending'

      local l_0_6 = nil
      local l_0_7 = contains
      l_0_7 = l_0_7(l_0_4.OriginalFilename, {"U3BoostSvr", "AgentInstall", "USHSVC"})
    end
    if not l_0_7 then
      l_0_7 = l_0_6.LegalCopyright
      if l_0_7 then
        l_0_7 = contains
        l_0_7 = l_0_7(l_0_6.LegalCopyright, "asus")
        if l_0_7 then
          l_0_7 = l_0_6.OriginalFilename
          if not l_0_7 then
            l_0_7 = ""
          end
          l_0_7 = l_0_7 .. "|" .. (l_0_6.CompanyName or "") .. "|" .. (l_0_6.LegalCopyright or "")
          local l_0_14 = nil
          l_0_14 = bm
          l_0_14 = l_0_14.add_related_string
          l_0_14("version_info", l_0_7, bm.RelatedStringBMReport)
          l_0_14 = bm
          l_0_14 = l_0_14.add_related_string
          l_0_14("BinaryPaths", l_0_5 .. "|" .. l_0_2, bm.RelatedStringBMReport)
          l_0_14 = bm
          l_0_14 = l_0_14.add_related_file
          l_0_14(l_0_5)
          l_0_14 = bm
          l_0_14 = l_0_14.add_related_file
          l_0_14(l_0_2)
          l_0_14 = mp
          l_0_14 = l_0_14.INFECTED
          return l_0_14
        end
      end
      do
        l_0_7 = mp
        l_0_7 = l_0_7.CLEAN
        return l_0_7
      end
    end
  end
end

