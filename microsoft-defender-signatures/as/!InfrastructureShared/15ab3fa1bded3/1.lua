-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15ab3fa1bded3\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 then
  local l_0_0 = (this_sigattrlog[6]).utf8p1
  if (MpCommon.PathToWin32Path)(l_0_0) or not l_0_0 then
    return mp.CLEAN
  end
  l_0_0 = (string.lower)(l_0_0)
  local l_0_1 = l_0_0:match("^(.*)\\")
  local l_0_2 = (bm.get_imagepath)()
  if not l_0_2 then
    return mp.CLEAN
  end
  if not (MpCommon.PathToWin32Path)(l_0_2) then
    l_0_2 = (string.lower)(l_0_2)
    local l_0_3 = l_0_2:match("^(.*)\\")
    if l_0_3 ~= l_0_1 then
      return mp.CLEAN
    end
    if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
      return mp.CLEAN
    end
    do
      if not (sysio.GetPEVersionInfo)(l_0_2) then
        local l_0_4, l_0_5, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14 = {}
      end
      -- DECOMPILER ERROR at PC77: Confused about usage of register: R4 in 'UnsetPending'

      if l_0_4.OriginalFilename then
        local l_0_6 = nil
        local l_0_7 = contains
        local l_0_8 = l_0_6.OriginalFilename
        l_0_7 = l_0_7(l_0_8, {"U3BoostSvr", "AgentInstall", "USHSVC"})
      end
      if not l_0_7 then
        l_0_7 = l_0_6.LegalCopyright
        if l_0_7 then
          l_0_7 = contains
          l_0_8 = l_0_6.LegalCopyright
          l_0_7 = l_0_7(l_0_8, "asus")
          if l_0_7 then
            l_0_7 = l_0_6.OriginalFilename
            if not l_0_7 then
              l_0_7 = ""
            end
            l_0_8 = "|"
            l_0_7 = l_0_7 .. l_0_8 .. (l_0_6.CompanyName or "") .. "|" .. (l_0_6.LegalCopyright or "")
            local l_0_15 = nil
            l_0_8 = bm
            l_0_8 = l_0_8.add_related_string
            l_0_15 = "version_info"
            l_0_8(l_0_15, l_0_7, bm.RelatedStringBMReport)
            l_0_8 = bm
            l_0_8 = l_0_8.add_related_string
            l_0_15 = "BinaryPaths"
            l_0_8(l_0_15, l_0_2 .. "|" .. l_0_0, bm.RelatedStringBMReport)
            l_0_8 = bm
            l_0_8 = l_0_8.add_related_file
            l_0_15 = l_0_2
            l_0_8(l_0_15)
            l_0_8 = bm
            l_0_8 = l_0_8.add_related_file
            l_0_15 = l_0_0
            l_0_8(l_0_15)
            l_0_8 = mp
            l_0_8 = l_0_8.INFECTED
            return l_0_8
          end
        end
        do
          l_0_0 = mp
          l_0_0 = l_0_0.CLEAN
          return l_0_0
        end
      end
    end
  end
end

