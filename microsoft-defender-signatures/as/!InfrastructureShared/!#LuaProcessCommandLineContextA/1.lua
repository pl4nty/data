-- Threat: !InfrastructureShared
-- Name: !#Lua:ProcessCommandLineContext.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & MpNewlyCreatedHint & (AGGR:PossibleExecutableFileExt.A | AGGR:SpecialFileExt.B)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_1 == nil or #l_0_1 < 4 or 50 < #l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if l_0_1 == "powershell.exe" then
  local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = mp.GetProcessCommandLine(l_0_2)
  if l_0_3 == nil and #l_0_3 <= 5 then
    return mp.CLEAN
  end
  local l_0_4 = string.lower(string.gsub(l_0_3, " ", ""))
  local l_0_5 = "Lua:ProcCmdLineContext.A!"
  if 100 < #l_0_4 and #l_0_4 < 350 and string.find(l_0_4, "-command\"if(get-command'get-windowsfeature'-erroractionsilentlycontinue){get-windowsfeature-nameweb-server|convertto-json|out-file", 1, true) ~= nil then
    local l_0_6 = l_0_5 .. "PsAzureArc"
    mp.set_mpattribute(l_0_6)
  end
end
return mp.CLEAN
