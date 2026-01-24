-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\126b3bef20691\1.luac 

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

  -- DECOMPILER ERROR at PC55: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC60: Unhandled construct in 'MakeBoolean' P3

  if ((this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil and not (this_sigattrlog[3]).matched) or not nil then
    return mp.CLEAN
  end
  local l_0_3 = nil
  local l_0_4 = l_0_2:match("^(.*)\\")
  if l_0_4 ~= l_0_3:match("^(.*)\\") then
    return mp.CLEAN
  end
  do
    if not (sysio.GetPEVersionInfo)(l_0_3) then
      local l_0_5, l_0_6, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14, l_0_15 = , {}
    end
    -- DECOMPILER ERROR at PC79: Confused about usage of register: R4 in 'UnsetPending'

    if l_0_6.OriginalFilename then
      local l_0_7 = nil
      -- DECOMPILER ERROR at PC83: Confused about usage of register: R4 in 'UnsetPending'

      local l_0_8 = nil
      local l_0_9 = contains
      l_0_9 = l_0_9(l_0_6.OriginalFilename, {"U3BoostSvr", "AgentInstall", "USHSVC"})
    end
    if not l_0_9 then
      l_0_9 = l_0_8.LegalCopyright
      if l_0_9 then
        l_0_9 = contains
        l_0_9 = l_0_9(l_0_8.LegalCopyright, "asus")
        if l_0_9 then
          l_0_9 = l_0_8.OriginalFilename
          if not l_0_9 then
            l_0_9 = ""
          end
          l_0_9 = l_0_9 .. "|" .. (l_0_8.CompanyName or "") .. "|" .. (l_0_8.LegalCopyright or "")
          local l_0_16 = nil
          l_0_16 = bm
          l_0_16 = l_0_16.add_related_string
          l_0_16("version_info", l_0_9, bm.RelatedStringBMReport)
          l_0_16 = bm
          l_0_16 = l_0_16.add_related_string
          l_0_16("BinaryPaths", l_0_3 .. "|" .. l_0_2, bm.RelatedStringBMReport)
          l_0_16 = bm
          l_0_16 = l_0_16.add_related_file
          l_0_16(l_0_3)
          l_0_16 = bm
          l_0_16 = l_0_16.add_related_file
          l_0_16(l_0_2)
          l_0_16 = mp
          l_0_16 = l_0_16.INFECTED
          return l_0_16
        end
      end
      do
        l_0_9 = mp
        l_0_9 = l_0_9.CLEAN
        return l_0_9
      end
    end
  end
end

