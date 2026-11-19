-- Threat: !InfrastructureShared
-- Name: !#LUA:PowershellDropsNewPE.A
-- Type: 9
-- Includes: PHelpers
-- MpAttributes: RPF:TopLevelFile & pea_isexe & !pea_isdll & !pea_isdriver

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_1 ~= nil and ".exe" == l_0_1:sub(-4) and "powershell.exe" == mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME):lower() then
    if nil ~= l_0_0:find("\\appdata\\", 1, true) then
      mp.set_mpattribute("LUA:PowershellDropsNewPEInAppDataPath.A")
    end
    if false == IsChainNPath(l_0_0) then
      if MpCommon.QueryPersistContextNoPath("CLF_AM", "OfcUsrTruDocRec") then
        mp.set_mpattribute("Lua:OfcUsrTruDocRecPsNewPeDrop")
      end
      local l_0_2 = false
      if MpCommon.QueryPersistContextNoPath("CLF_AM", "CLF_AM_EC") then
        mp.set_mpattribute("Lua:EmailClientChainPsNewPeDrop")
        l_0_2 = true
      end
      if MpCommon.QueryPersistContextNoPath("CLF_AM", "CLF_AM_WM") then
        mp.set_mpattribute("Lua:WebMailChainPsNewPeDrop")
        l_0_2 = true
      end
      if l_0_2 then
        local l_0_3 = MpCommon.GetPersistContextNoPath("CLF_IC")
        for l_0_4, l_0_5 in ipairs(l_0_3) do
          mp.ReportLowfi(l_0_5, 1933116662)
        end
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
