-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/RightToLeftOverride.gen!D
-- Type: 12
-- MpAttributes: MpOnOpenOrCloseRtpScan

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_0 ~= nil and 5 < #l_0_0 then
  if string.find(l_0_0, "\226\128\174", 1, true) == nil then
    return mp.CLEAN
  end
  local l_0_1 = string.sub(l_0_0, -7)
  if l_0_1 == nil or #l_0_1 < 1 then
    return mp.CLEAN
  end
  local l_0_2 = {
    ["\226\128\174.bat"] = "Lua:Context/RightToLeftOverride.DA",
    ["\226\128\174.cmd"] = "Lua:Context/RightToLeftOverride.DA",
    ["\226\128\174.lnk"] = "Lua:Context/RightToLeftOverride.DA",
    ["\226\128\174.ps1"] = "Lua:Context/RightToLeftOverride.DA",
    ["\226\128\174.vbe"] = "Lua:Context/RightToLeftOverride.DB",
    ["\226\128\174.vbs"] = "Lua:Context/RightToLeftOverride.DB",
    ["\226\128\174.js"] = "Lua:Context/RightToLeftOverride.DB",
    ["\226\128\174.jse"] = "Lua:Context/RightToLeftOverride.DB",
    ["\226\128\174.wsh"] = "Lua:Context/RightToLeftOverride.DB",
    ["\226\128\174.wsf"] = "Lua:Context/RightToLeftOverride.DB",
    ["\226\128\174.hta"] = "Lua:Context/RightToLeftOverride.DB",
    ["\226\128\174.jar"] = "Lua:Context/RightToLeftOverride.DC",
    ["\226\128\174.com"] = "Lua:Context/RightToLeftOverride.DD",
    ["\226\128\174.exe"] = "Lua:Context/RightToLeftOverride.DD",
    ["\226\128\174.scr"] = "Lua:Context/RightToLeftOverride.DD",
    ["\226\128\174.pif"] = "Lua:Context/RightToLeftOverride.DD"
  }
  local l_0_3 = l_0_2[l_0_1]
  if l_0_3 == nil then
    return mp.CLEAN
  end
  mp.set_mpattribute(l_0_3)
  return mp.INFECTED
end
return mp.CLEAN
