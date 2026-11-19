-- Threat: !InfrastructureShared
-- Name: !#Lua:PossibleMiuref_DropBlob
-- Type: 13

local l_0_0
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_1 == mp.SCANREASON_ONOPEN or l_0_1 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_0 == nil then
    return mp.CLEAN
  end
  if l_0_0:sub(-4):lower() == ".lck" or l_0_0:sub(-4):lower() == ".idx" then
    local l_0_2
    l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
    if l_0_2 == nil then
      return mp.CLEAN
    end
    if (string.find(l_0_2, "\\application data", 1, true) or string.find(l_0_2, "\\appdata\\roaming", 1, true) or string.find(l_0_2, "\\appdata\\local", 1, true)) and (string.find(l_0_0, "%w+%.lck", 1, true) or string.find(l_0_0, "%w+%.idx", 1, true)) then
      local l_0_3, l_0_4, l_0_5
      l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
      l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
      l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
      if l_0_3 == nil or l_0_4 == nil then
        return mp.CLEAN
      end
      if string.sub(l_0_3, -4) == ".exe" then
        mp.ReportLowfi(MpCommon.PathToWin32Path(l_0_4) .. "\\" .. l_0_5, 2068892749)
      end
    end
  end
end
return mp.CLEAN
