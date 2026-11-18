-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextSvchostDropFromService
-- Type: 10
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
l_0_0 = (l_0_0 == nil and "" or l_0_0):lower()
if l_0_0 ~= "svchost.exe" then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_2 = mp.GetProcessCommandLine(l_0_1)
l_0_2 = (l_0_2 == nil and "" or l_0_2):lower()
local l_0_3 = string.match(l_0_2, "-s%s+([^%s]+)")
local l_0_4 = string.match(l_0_2, "-k%s+([^%s]+)")
if l_0_3 ~= nil and l_0_3:len() < 100 then
  mp.set_mpattribute("Lua:ContextSvchostDropFromService:" .. l_0_3)
elseif l_0_4 ~= nil and l_0_4:len() < 100 then
  mp.set_mpattribute("Lua:ContextSvchostDropFromService:" .. l_0_4)
else
  mp.set_mpattribute("Lua:ContextSvchostDropFromService")
end
local l_0_5 = mp.getfilename()
if not mp.IsKnownFriendlyFile(l_0_5, true, false) and l_0_3 ~= nil and l_0_3 == "winhttpautoproxysvc" then
  mp.ReportLowfi(l_0_5, 5866790093402)
end
return mp.CLEAN
