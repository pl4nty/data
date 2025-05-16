-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ScanMacro-92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b\0x000006de_luac 

-- params : ...
-- function num : 0
if not (mp.IsHipsRuleEnabled)("92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b") then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if (mp.get_mpattribute)("BM_OFFICE_FILE") then
  return mp.CLEAN
else
  local l_0_2, l_0_3 = nil, nil
  if (string.len)(l_0_1) >= 5 then
    l_0_2 = (string.sub)(l_0_1, -4)
  end
  if (string.len)(l_0_1) >= 20 then
    l_0_3 = (string.sub)(l_0_1, -14)
  end
  if l_0_2 ~= ".xls" and l_0_2 ~= ".doc" and l_0_3 ~= "vbaproject.bin" then
    return mp.CLEAN
  end
end
do
  local l_0_4 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_CNAME, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_4 == nil or l_0_4 == "" then
    return mp.CLEAN
  end
  if not (mp.get_mpattribute)("SCRIPT:LoadWin32importsfromMacro") and not (mp.get_mpattribute)("MHSTR:LoadWin32importsfromMacro") and not (MpCommon.QueryPersistContext)(l_0_4, "enghipscpy:MHSTRLoadWin32importsfromMacroInside") then
    return mp.CLEAN
  end
  local l_0_5 = GetCtxOfficeProc()
  if l_0_5 ~= "productivity" and l_0_5 ~= "productivity2" then
    return mp.CLEAN
  end
  if (string.find)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)), ">%[msilres", 1, true) then
    (mp.set_mpattribute)("LUA:InsideMSILRES")
    return mp.CLEAN
  end
  local l_0_6 = false
  l_0_4 = (MpCommon.PathToWin32Path)(l_0_4)
  if l_0_4 ~= nil and l_0_4 ~= "" then
    l_0_4 = (string.lower)(l_0_4)
    if (sysio.IsFileExists)(l_0_4) then
      l_0_6 = true
    end
  end
  if l_0_6 then
    if (string.find)(l_0_4, "\\program files\\microsoft office\\", 1, true) then
      return mp.CLEAN
    end
    if (string.find)(l_0_4, "\\program files (x86)\\microsoft office\\", 1, true) then
      return mp.CLEAN
    end
    if (string.find)(l_0_4, "\\program files\\windowsapps\\microsoft.office.desktop.excel", 1, true) then
      return mp.CLEAN
    end
    if (string.find)(l_0_4, "\\program files (x86)\\windowsapps\\microsoft.office.desktop.excel", 1, true) then
      return mp.CLEAN
    end
    if (mp.IsPathExcludedForHipsRule)(l_0_4, "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b") then
      return mp.CLEAN
    end
    local l_0_7 = (versioning.GetEngineRing)()
    local l_0_8 = (versioning.GetOrgID)()
    if l_0_8 ~= nil and l_0_8 ~= "" then
      l_0_8 = (string.lower)(l_0_8)
    end
    -- DECOMPILER ERROR at PC271: Unhandled construct in 'MakeBoolean' P3

    if (l_0_7 ~= nil and l_0_7 < versioning.ENGINE_RING_2_PREVIEW) or l_0_8 == "ba11743e-6a8f-4599-93fb-2425110e2a75" then
      local l_0_9 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
      if l_0_9 ~= nil and l_0_9 ~= "" then
        l_0_9 = (MpCommon.PathToWin32Path)(l_0_9)
        if l_0_9 ~= nil and l_0_9 ~= "" and (mp.IsPathExcludedForHipsRule)(l_0_9, "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b") then
          return mp.CLEAN
        end
      end
    end
  end
  do
    local l_0_10 = nil
    l_0_10 = GetInvolvedFileInCmdLnIfExistOnMachine()
    if l_0_10 ~= nil and (mp.IsPathExcludedForHipsRule)(l_0_10, "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b") then
      return mp.CLEAN
    end
    ;
    (mp.set_mpattribute)("MpDisableCaching")
    ;
    (mp.SetHipsRule)("92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b")
    return mp.BLOCKACCESS
  end
end

