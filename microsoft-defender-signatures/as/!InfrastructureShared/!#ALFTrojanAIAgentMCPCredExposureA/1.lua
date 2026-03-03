-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanAIAgentMCPCredExposureA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.get_mpattribute)("Lua:FnameAttr!mcp.json")
local l_0_2 = (mp.get_mpattribute)("Lua:FnameAttr!claude_desktop_config.json")
if not l_0_1 and not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilesize)()
if l_0_3 < 20 or l_0_3 > 524288 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_4 = tostring((mp.readfile)(0, l_0_3))
;
(mp.readprotection)(true)
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = (string.lower)(l_0_4)
if not (string.find)(l_0_5, "mcpservers", 1, true) and not (string.find)(l_0_5, "\"servers\"", 1, true) then
  return mp.CLEAN
end
local l_0_6 = {}
if (string.find)(l_0_5, "openai_api_key", 1, true) or (string.find)(l_0_5, "anthropic_api_key", 1, true) or (string.find)(l_0_5, "github_token", 1, true) or (string.find)(l_0_5, "aws_secret_access_key", 1, true) or (string.find)(l_0_5, "azure_openai_key", 1, true) then
  l_0_6[#l_0_6 + 1] = "known_secret_env"
end
if (string.find)(l_0_5, "bearer ", 1, true) then
  l_0_6[#l_0_6 + 1] = "bearer_token"
end
if #l_0_6 == 0 then
  return mp.CLEAN
end
if not (string.find)(l_0_4, "\"sk%-") ~= nil or (string.find)(l_0_4, "\"ghp_", 1, true) ~= nil or (string.find)(l_0_4, "\"gho_", 1, true) ~= nil or (string.find)(l_0_4, "\"Bearer ", 1, true) ~= nil or (string.find)(l_0_4, "\"AKIA", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_10 = nil
local l_0_11 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
do
  (mp.SetDetectionString)(safeJsonSerialize({file = l_0_11 or "unknown", cred_types = (table.concat)(l_0_6, ",")}))
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC233: freeLocal<0 in 'ReleaseLocals'

  -- DECOMPILER ERROR: 3 unprocessed JMP targets
end

