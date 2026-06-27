-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanAIAgentMCPSSHKeyLeakA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.get_mpattribute)("Lua:FnameAttr!mcp.json")
local l_0_2 = (mp.get_mpattribute)("Lua:FnameAttr!claude_desktop_config.json")
local l_0_3 = (mp.get_mpattribute)("Lua:FnameAttr!openclaw.json")
if not l_0_1 and not l_0_2 and not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = (mp.getfilesize)()
if l_0_4 < 50 or l_0_4 > 524288 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_5 = tostring((mp.readfile)(0, l_0_4))
;
(mp.readprotection)(true)
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = (string.lower)(l_0_5)
if not (string.find)(l_0_6, "mcpservers", 1, true) and not (string.find)(l_0_6, "mcp_servers", 1, true) and not (string.find)(l_0_6, "\"servers\"", 1, true) then
  return mp.CLEAN
end
local l_0_7 = nil
if (string.find)(l_0_5, "-----BEGIN RSA PRIVATE KEY-----", 1, true) then
  l_0_7 = "rsa"
else
  if (string.find)(l_0_5, "-----BEGIN DSA PRIVATE KEY-----", 1, true) then
    l_0_7 = "dsa"
  else
    if (string.find)(l_0_5, "-----BEGIN EC PRIVATE KEY-----", 1, true) then
      l_0_7 = "ec"
    else
      if (string.find)(l_0_5, "-----BEGIN OPENSSH PRIVATE KEY-----", 1, true) then
        l_0_7 = "openssh"
      else
        if (string.find)(l_0_5, "-----BEGIN PRIVATE KEY-----", 1, true) then
          l_0_7 = "generic"
        end
      end
    end
  end
end
if l_0_7 == nil then
  return mp.CLEAN
end
local l_0_8 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_9 = {}
do
  l_0_9.file = l_0_8 or "unknown"
  l_0_9.key_type = l_0_7
  set_research_data("AIAgent_MCPSSHKeyLeak", safeJsonSerialize(l_0_9), false)
  ;
  (mp.SetDetectionString)(safeJsonSerialize(l_0_9))
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC192: freeLocal<0 in 'ReleaseLocals'

end

