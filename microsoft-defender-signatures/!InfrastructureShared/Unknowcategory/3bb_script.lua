-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\3bb_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_2 = nil
  local l_0_3 = nil
  if (string.match)(l_0_2:lower(), "c:\\programdata\\%l+%d%d%d%.ps1") == nil then
    return mp.CLEAN
  end
  if (string.match)(l_0_2:lower(), "c:\\programdata\\%l+%d%d%d%.ps1") ~= nil and (sysio.IsFileExists)((string.match)(l_0_2:lower(), "c:\\programdata\\%l+%d%d%d%.ps1")) then
    (mp.ReportLowfi)((string.match)(l_0_2:lower(), "c:\\programdata\\%l+%d%d%d%.ps1"), 2840082329)
    ;
    (bm.add_related_file)((string.match)(l_0_2:lower(), "c:\\programdata\\%l+%d%d%d%.ps1"))
    local l_0_4 = nil
    if (sysio.GetFileSize)((string.match)(l_0_2:lower(), "c:\\programdata\\%l+%d%d%d%.ps1")) > 2048 then
      return mp.INFECTED
    end
    local l_0_5 = nil
    if tostring((sysio.ReadFile)(l_0_4, 0, (sysio.GetFileSize)((string.match)(l_0_2:lower(), "c:\\programdata\\%l+%d%d%d%.ps1")))) == nil then
      return mp.INFECTED
    end
    local l_0_6 = nil
    local l_0_7 = (string.match)((tostring((sysio.ReadFile)(l_0_4, 0, (sysio.GetFileSize)((string.match)(l_0_2:lower(), "c:\\programdata\\%l+%d%d%d%.ps1"))))):lower(), "-name%s+(%w+)")
    if l_0_7 == nil or (string.gsub)((string.match)(l_0_6:lower(), "-path%s+\"(.-)\""), ":", "") == nil then
      return mp.CLEAN
    end
    local l_0_8 = nil
    local l_0_9 = nil
    if (sysio.RegExpandUserKey)(l_0_8) then
      for l_0_13,l_0_14 in pairs((sysio.RegExpandUserKey)(l_0_8)) do
        local l_0_10 = nil
        -- DECOMPILER ERROR at PC106: Confused about usage of register: R13 in 'UnsetPending'

        if (sysio.RegOpenKey)(R13_PC106) then
          local l_0_16 = nil
          for l_0_20,l_0_21 in pairs((sysio.RegEnumValues)((sysio.RegOpenKey)(R13_PC106))) do
            local l_0_17 = nil
            -- DECOMPILER ERROR at PC120: Confused about usage of register: R20 in 'UnsetPending'

            if (string.lower)(R20_PC120) == l_0_7 then
              l_0_9 = (string.lower)((sysio.GetRegValueAsString)(l_0_16, R20_PC120))
            end
          end
        end
      end
    end
    do
      if l_0_9 ~= nil then
        (bm.add_related_string)("b64_SuspQuickRapidsPSFile_regvalue", (MpCommon.Base64Encode)(l_0_9), bm.RelatedStringBMReport)
        -- DECOMPILER ERROR at PC149: Confused about usage of register R9 for local variables in 'ReleaseLocals'

      end
      l_0_5 = mp
      l_0_5 = l_0_5.INFECTED
      return l_0_5
    end
  end
end

