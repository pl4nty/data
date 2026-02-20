-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\136b3066e37e9\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p1 == nil or (this_sigattrlog[4]).matched) and (this_sigattrlog[4]).utf8p1 ~= nil then
      local l_0_1, l_0_2 = (this_sigattrlog[3]).utf8p1
    else
    end
    if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
      do return mp.CLEAN end
      local l_0_3 = (string.lower)((this_sigattrlog[5]).utf8p1)
      local l_0_4 = (string.match)(l_0_3, "\\([^\\]+)$")
      if l_0_4 == nil then
        return mp.CLEAN
      end
      local l_0_5 = {}
      l_0_5[".dotm"] = true
      l_0_5[".xlsm"] = true
      l_0_5[".xltm"] = true
      l_0_5[".pptm"] = true
      l_0_5[".potm"] = true
      l_0_5[".sldm"] = true
      l_0_5[".xlam"] = true
      l_0_5[".ppam"] = true
      local l_0_6 = (string.match)(l_0_4, "%.[^%.]+$")
      if l_0_6 == nil or not l_0_5[l_0_6] then
        return mp.CLEAN
      end
      if (string.find)(l_0_4, "$normal.dot", 1, true) or (string.find)(l_0_4, "normal.dotm", 1, true) or (string.find)(l_0_4, "buildingblocks.dotx", 1, true) or (string.sub)(l_0_4, 1, 4) == "~wrd" or (string.sub)(l_0_4, 1, 2) == "~$" or (string.sub)(l_0_4, 1, 4) == "~tmp" or l_0_4 == "thumbs.db" or l_0_4 == "desktop.ini" or (string.sub)(l_0_4, -4) == ".tmp" then
        return mp.CLEAN
      end
      local l_0_7 = (bm.get_imagepath)()
      if isnull(l_0_7) then
        return mp.CLEAN
      end
      local l_0_8 = (string.lower)(l_0_7)
      local l_0_9 = (string.match)(l_0_8, "\\([^\\]+)$")
      if l_0_9 == nil then
        return mp.CLEAN
      end
      local l_0_10 = {}
      l_0_10["winword.exe"] = true
      l_0_10["excel.exe"] = true
      l_0_10["powerpnt.exe"] = true
      l_0_10["outlook.exe"] = true
      l_0_10["msaccess.exe"] = true
      l_0_10["onenote.exe"] = true
      l_0_10["officeclicktorun.exe"] = true
      l_0_10["officec2rclient.exe"] = true
      l_0_10["msiexec.exe"] = true
      l_0_10["trustedinstaller.exe"] = true
      l_0_10["tiworker.exe"] = true
      l_0_10["msmpeng.exe"] = true
      if l_0_10[l_0_9] then
        return mp.CLEAN
      end
      if l_0_9 == "setup.exe" and (string.find)(l_0_8, "microsoft office", 1, true) then
        return mp.CLEAN
      end
      local l_0_11 = (mp.ContextualExpandEnvironmentVariables)(l_0_3)
      if not isnull(l_0_11) then
        l_0_11 = (string.lower)(l_0_11)
      else
        l_0_11 = l_0_3
      end
      if (mp.IsKnownFriendlyFile)(l_0_11, true, false) then
        return mp.CLEAN
      end
      if (sysio.IsFileExists)(l_0_11) then
        (bm.add_related_file)(l_0_11)
        ;
        (bm.add_threat_file)(l_0_11)
      end
      ;
      (bm.add_related_string)("DroppedTemplate", l_0_11, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("DroppingProcess", l_0_8, bm.RelatedStringBMReport)
      add_parents()
      TrackPidAndTechniqueBM("BM", "T1137", "office_application_startup")
      return mp.INFECTED
    end
  end
end

