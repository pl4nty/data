-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanSuspPromptEditA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)()
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.sub)(l_0_1, -12) ~= "extension.js" then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\dist\\", 1, true) ~= nil and (string.find)(l_0_1, "\\.vscode\\extensions\\", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

