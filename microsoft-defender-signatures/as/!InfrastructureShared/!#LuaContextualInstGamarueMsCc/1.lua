-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextualInstGamarueMsCc
-- Type: 9

if not peattributes.isexe then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1 ~= "svchost.exe" or l_0_1 ~= "wuauclt.exe" then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_2:sub(-17) == "\\windows\\system32" then
    local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
    local l_0_4 = string.lower(l_0_3)
    if #l_0_4 < 9 or 16 < #l_0_4 then
      return mp.CLEAN
    end
    local l_0_5 = {
      [".exe"] = "",
      [".cmd"] = "",
      [".bat"] = "",
      [".com"] = "",
      [".pif"] = "",
      [".scr"] = ""
    }
    if l_0_5[l_0_4:sub(-4)] and (l_0_4:match("^ms%l%l%l+%.%l%l%l$") ~= nil or l_0_4:match("^cc%l%l%l+%.%l%l%l$") ~= nil) then
      local l_0_6 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
      local l_0_7 = string.lower(l_0_6)
      if l_0_7:sub(-11) == "\\local\\temp" or l_0_7:sub(-20) == "\\local settings\\temp" then
        local l_0_8 = MpCommon.PathToWin32Path(l_0_6) .. "\\" .. l_0_4
        mp.ReportLowfi(l_0_8, 2487859005)
      end
    end
  end
end
return mp.CLEAN
