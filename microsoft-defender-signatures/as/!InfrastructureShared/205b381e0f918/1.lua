-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\205b381e0f918\1.luac 

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
      local l_0_1 = (this_sigattrlog[3]).utf8p1
    else
    end
    -- DECOMPILER ERROR at PC68: Overwrote pending register: R0 in 'AssignReg'

    if (not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p1 == nil or (this_sigattrlog[6]).matched) and (this_sigattrlog[6]).utf8p1 ~= nil then
      local l_0_2, l_0_3 = (this_sigattrlog[5]).utf8p1
    else
      do
        do return mp.CLEAN end
        -- DECOMPILER ERROR at PC75: Confused about usage of register: R0 in 'UnsetPending'

        local l_0_4 = nil
        if not (string.find)((string.lower)(l_0_2), "%.%.\\", 1, true) then
          return mp.CLEAN
        end
        local l_0_5 = nil
        if (string.match)((string.lower)(l_0_2), "\\([^\\]+)$") == nil then
          return mp.CLEAN
        end
        if (string.match)((string.lower)(l_0_2), "\\([^\\]+)$") == "desktop.ini" or (string.match)((string.lower)(l_0_2), "\\([^\\]+)$") == "thumbs.db" or (string.sub)((string.match)((string.lower)(l_0_2), "\\([^\\]+)$"), -4) == ".tmp" or (string.sub)((string.match)((string.lower)(l_0_2), "\\([^\\]+)$"), 1, 2) == "~$" then
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
          if (mp.IsKnownFriendlyFile)(l_0_5, true, false) then
            return mp.CLEAN
          end
          if (sysio.IsFileExists)(l_0_5) then
            (bm.add_related_file)(l_0_5)
            ;
            (bm.add_threat_file)(l_0_5)
          end
          ;
          (bm.add_related_string)("TraversalPath", l_0_5, bm.RelatedStringBMReport)
          ;
          (bm.add_related_string)("TraversalType", l_0_4, bm.RelatedStringBMReport)
          add_parents()
          TrackFileAndTechnique(l_0_5, "T1203:cve_2025_8088_path_traversal", 1000)
          TrackPidAndTechniqueBM("BM", "T1547.001", "path_traversal_persistence")
          return mp.INFECTED
        end
      end
    end
  end
end

