-- Threat: !InfrastructureShared
-- Name: !#LUA:PayloadTempDropFile
-- Type: 10

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = {
    ["payload.exe"] = true
  }
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1[l_0_2] then
    local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
    if string.find(l_0_3, "\\local settings\\temp", 1, true) or string.find(l_0_3, "\\appdata\\local\\temp", 1, true) then
      local l_0_4, l_0_5, l_0_6
      l_0_6 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
      l_0_4 = string.lower(l_0_6)
      l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
      if l_0_4 == nil or l_0_5 == nil then
        return mp.CLEAN
      end
      if string.sub(l_0_4, -4) == ".exe" then
        mp.ReportLowfi(MpCommon.PathToWin32Path(l_0_5) .. "\\" .. l_0_6, 1932906471)
      end
    end
    return mp.CLEAN
  end
end
return mp.CLEAN
