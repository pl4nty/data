-- Threat: \xac!MpTestCommandline
-- Type: 10

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) ~= true then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
l_0_1 = (l_0_1 == nil and "" or l_0_1):lower()
if l_0_1:find("-checkcommandline", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
