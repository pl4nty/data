-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\249b39b4bedd3\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p1 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[11]).matched or (this_sigattrlog[11]).utf8p1 == nil or (this_sigattrlog[12]).matched) and (this_sigattrlog[12]).utf8p1 ~= nil then
      local l_0_1, l_0_2, l_0_3 = (this_sigattrlog[11]).utf8p1
    else
    end
    if (this_sigattrlog[13]).matched and (this_sigattrlog[13]).utf8p1 ~= nil then
      do return mp.CLEAN end
      local l_0_4 = nil
      local l_0_5 = nil
      if (string.match)((string.lower)((this_sigattrlog[13]).utf8p1), "\\([^\\]+)$") == nil then
        return mp.CLEAN
      end
      if (string.match)((string.lower)((this_sigattrlog[13]).utf8p1), "\\([^\\]+)$") == "desktop.ini" or (string.match)((string.lower)((this_sigattrlog[13]).utf8p1), "\\([^\\]+)$") == "thumbs.db" or (string.sub)((string.match)((string.lower)((this_sigattrlog[13]).utf8p1), "\\([^\\]+)$"), -4) == ".tmp" or (string.sub)((string.match)((string.lower)((this_sigattrlog[13]).utf8p1), "\\([^\\]+)$"), 1, 2) == "~$" or (string.sub)((string.match)((string.lower)((this_sigattrlog[13]).utf8p1), "\\([^\\]+)$"), 1, 4) == "~wrd" then
        return mp.CLEAN
      end
      local l_0_6 = nil
      do
        if not isnull((bm.get_imagepath)()) then
          local l_0_7 = nil
          if (string.find)((string.lower)((bm.get_imagepath)()), "\\windows defender\\msmpeng.exe", 1, true) then
            return mp.CLEAN
          end
        end
        local l_0_8 = nil
        -- DECOMPILER ERROR at PC142: Overwrote pending register: R4 in 'AssignReg'

        if isnull((mp.ContextualExpandEnvironmentVariables)(l_0_5)) or (mp.IsKnownFriendlyFile)((string.lower)((mp.ContextualExpandEnvironmentVariables)(l_0_5)), true, false) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC156: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC162: Confused about usage of register: R4 in 'UnsetPending'

        if (sysio.IsFileExists)((string.lower)((mp.ContextualExpandEnvironmentVariables)(l_0_5))) then
          (bm.add_related_file)((string.lower)((mp.ContextualExpandEnvironmentVariables)(l_0_5)))
          -- DECOMPILER ERROR at PC166: Confused about usage of register: R4 in 'UnsetPending'

          ;
          (bm.add_threat_file)((string.lower)((mp.ContextualExpandEnvironmentVariables)(l_0_5)))
        end
        -- DECOMPILER ERROR at PC171: Confused about usage of register: R4 in 'UnsetPending'

        ;
        (bm.add_related_string)("DroppedFile", (string.lower)((mp.ContextualExpandEnvironmentVariables)(l_0_5)), bm.RelatedStringBMReport)
        ;
        (bm.add_related_string)("DropTarget", l_0_4, bm.RelatedStringBMReport)
        add_parents()
        -- DECOMPILER ERROR at PC185: Confused about usage of register: R4 in 'UnsetPending'

        TrackFileAndTechnique((string.lower)((mp.ContextualExpandEnvironmentVariables)(l_0_5)), "T1203:cve_2025_8088_archive_startup_drop", 1000)
        TrackPidAndTechniqueBM("BM", "T1547.001", "archive_startup_persistence")
        return mp.INFECTED
      end
    end
  end
end

