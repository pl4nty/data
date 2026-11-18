-- Threat: !InfrastructureShared
-- Name: !#Lua:FynloskiFilenames
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = {
    ["msdcsc.exe"] = true,
    ["mdcsc.exe"] = true,
    ["msdcs.exe"] = true,
    ["msdc.exe"] = true,
    ["IMDCSC.exe"] = true,
    ["IMJDC.exe"] = true,
    ["facecall.exe"] = true,
    ["svcost.exe"] = true,
    ["svhost.exe"] = true,
    ["sv_chost.exe"] = true,
    ["svhostss.exe"] = true,
    ["Profoma Invoice.exe"] = true,
    ["Profoma_Invoice.exe"] = true,
    ["monthlyreport.exe"] = true,
    ["ttpayment.scr"] = true,
    ["crypted server.exe"] = true,
    ["DCModule.exe"] = true,
    ["lssass.exe"] = true,
    ["DarkCommet.exe"] = true
  }
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_1[l_0_2] then
    if string.match(l_0_3, "\\.-documents\\.+") or string.match(l_0_3, "\\start menu\\.+") or string.match(l_0_3, "\\programdata") or string.match(l_0_3, "\\administrator\\application data") or string.match(l_0_3, "\\appdata\\local") or string.match(l_0_3, "\\appdata\\roaming") or string.match(l_0_3, "\\desktop\\.+") or string.match(l_0_3, "\\windows\\system32\\.+") or string.match(l_0_3, "\\local settings\\application data") or string.match(l_0_3, "\\local settings\\temp") then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end
return mp.CLEAN
