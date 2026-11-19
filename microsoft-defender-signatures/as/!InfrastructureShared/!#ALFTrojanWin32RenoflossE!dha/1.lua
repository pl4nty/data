-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Renofloss.E!dha
-- Type: 10

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if mp.SCANREASON_ONMODIFIEDHANDLECLOSE == l_0_0 and true == mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) then
  if mp.get_mpattribute("HSTR:RenoFlossLoader") then
    local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
    local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
    if l_0_2 ~= nil and l_0_1 ~= nil then
      mp.ReportLowfi(MpCommon.PathToWin32Path(l_0_1) .. "\\" .. l_0_2, 2439729955)
    end
  end
elseif mp.SCANREASON_ONOPEN == l_0_0 and true == mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  local l_0_3, l_0_4 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  local l_0_5 = string.lower(mp.ContextualExpandEnvironmentVariables("%temp%") .. "\\" .. "rarsfx")
  if l_0_3:find(l_0_5, 1, true) ~= nil then
    local l_0_6 = {
      ["ccmexec.exe"] = "",
      ["tpvcgateway.exe"] = "",
      ["cmrcviewer.exe"] = ""
    }
    if l_0_6[l_0_4] then
      local l_0_7 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
      local l_0_8 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
      if l_0_8 ~= nil and l_0_7 ~= nil then
        mp.ReportLowfi(MpCommon.PathToWin32Path(l_0_7) .. "\\" .. l_0_8, 2439729955)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
