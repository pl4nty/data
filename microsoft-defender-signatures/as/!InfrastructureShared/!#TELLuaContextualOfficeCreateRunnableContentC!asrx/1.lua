-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:ContextualOfficeCreateRunnableContent.C!asrx
-- Type: 13
-- MpAttributes: MpIsJScriptAMSIScan | MpIsVBScriptAMSIScan | MpIsPowerShellAMSIScan

local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_0 == false or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = MpCommon.GetPersistContext(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = false
for l_0_4, l_0_5 in ipairs(l_0_2) do
  if string.lower(l_0_5) == "contextualofficecreaterunnablecontent" then
    l_0_3 = true
    break
  end
end
if not l_0_3 then
  return mp.CLEAN
end
return mp.INFECTED
