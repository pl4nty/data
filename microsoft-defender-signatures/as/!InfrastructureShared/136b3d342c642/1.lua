-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\136b3d342c642\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC37: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[3]).matched or (this_sigattrlog[4]).matched then
      local l_0_1, l_0_2, l_0_3 = (string.lower)((this_sigattrlog[3]).utf8p1)
    else
    end
    if (this_sigattrlog[5]).matched then
      do return mp.CLEAN end
      local l_0_4 = nil
      if (string.match)((string.lower)((this_sigattrlog[5]).utf8p1), "\\([^\\]+)$") == nil then
        return mp.CLEAN
      end
      local l_0_5 = nil
      -- DECOMPILER ERROR at PC77: Confused about usage of register: R2 in 'UnsetPending'

      -- DECOMPILER ERROR at PC86: Confused about usage of register: R2 in 'UnsetPending'

      -- DECOMPILER ERROR at PC95: Confused about usage of register: R2 in 'UnsetPending'

      -- DECOMPILER ERROR at PC103: Confused about usage of register: R2 in 'UnsetPending'

      -- DECOMPILER ERROR at PC111: Confused about usage of register: R2 in 'UnsetPending'

      -- DECOMPILER ERROR at PC117: Confused about usage of register: R2 in 'UnsetPending'

      -- DECOMPILER ERROR at PC119: Confused about usage of register: R2 in 'UnsetPending'

      -- DECOMPILER ERROR at PC123: Confused about usage of register: R2 in 'UnsetPending'

      if (string.find)((string.match)((string.lower)((this_sigattrlog[5]).utf8p1), "\\([^\\]+)$"), "$normal.dot", 1, true) or (string.find)((string.match)((string.lower)((this_sigattrlog[5]).utf8p1), "\\([^\\]+)$"), "normal.dotm", 1, true) or (string.find)((string.match)((string.lower)((this_sigattrlog[5]).utf8p1), "\\([^\\]+)$"), "buildingblocks.dotx", 1, true) or (string.sub)((string.match)((string.lower)((this_sigattrlog[5]).utf8p1), "\\([^\\]+)$"), 1, 4) == "~wrd" or (string.sub)((string.match)((string.lower)((this_sigattrlog[5]).utf8p1), "\\([^\\]+)$"), 1, 2) == "~$" or (string.sub)((string.match)((string.lower)((this_sigattrlog[5]).utf8p1), "\\([^\\]+)$"), 1, 4) == "~tmp" or (string.match)((string.lower)((this_sigattrlog[5]).utf8p1), "\\([^\\]+)$") == "thumbs.db" or (string.match)((string.lower)((this_sigattrlog[5]).utf8p1), "\\([^\\]+)$") == "desktop.ini" or (string.sub)((string.match)((string.lower)((this_sigattrlog[5]).utf8p1), "\\([^\\]+)$"), -4) == ".tmp" then
        return mp.CLEAN
      end
      local l_0_6 = nil
      if not isnull((bm.get_imagepath)()) then
        local l_0_7 = nil
        -- DECOMPILER ERROR at PC151: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC153: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC155: Confused about usage of register: R4 in 'UnsetPending'

        if (string.match)((string.lower)((bm.get_imagepath)()), "\\([^\\]+)$") then
          if (string.match)((string.lower)((bm.get_imagepath)()), "\\([^\\]+)$") == "officeclicktorun.exe" or (string.match)((string.lower)((bm.get_imagepath)()), "\\([^\\]+)$") == "officec2rclient.exe" or (string.match)((string.lower)((bm.get_imagepath)()), "\\([^\\]+)$") == "msiexec.exe" then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC160: Confused about usage of register: R4 in 'UnsetPending'

          -- DECOMPILER ERROR at PC164: Confused about usage of register: R4 in 'UnsetPending'

          if (string.match)((string.lower)((bm.get_imagepath)()), "\\([^\\]+)$") == "setup.exe" and (string.find)((string.match)((string.lower)((bm.get_imagepath)()), "\\([^\\]+)$"), "microsoft office", 1, true) then
            return mp.CLEAN
          end
        end
        local l_0_8 = nil
        if not isnull((mp.ContextualExpandEnvironmentVariables)(l_0_4)) and (sysio.IsFileExists)((mp.ContextualExpandEnvironmentVariables)(l_0_4)) then
          (bm.add_related_file)((mp.ContextualExpandEnvironmentVariables)(l_0_4))
          ;
          (bm.add_related_string)("[->] MEDICATED PATH: ", (mp.ContextualExpandEnvironmentVariables)(l_0_4), bm.RelatedStringBMReport)
        end
        add_parents()
        TrackPidAndTechniqueBM("BM", "T1137", "office_application_startup")
        return mp.INFECTED
      end
      do
        return mp.CLEAN
      end
    end
  end
end

