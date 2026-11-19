-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan/SuspPromptEdit.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename()
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.sub(l_0_1, -12) ~= "extension.js" then
  return mp.CLEAN
end
if string.find(l_0_1, "\\dist\\", 1, true) ~= nil and string.find(l_0_1, "\\.vscode\\extensions\\", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
