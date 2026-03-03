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
if not l_0_1 and not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilesize)()
if l_0_3 < 50 or l_0_3 > 524288 then
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
if not (string.find)(l_0_5, "mcpservers", 1, true) and not (string.find)(l_0_5, "mcp_servers", 1, true) and not (string.find)(l_0_5, "\"servers\"", 1, true) then
  return mp.CLEAN
end
local l_0_6 = nil
if (string.find)(l_0_4, "-----BEGIN RSA PRIVATE KEY-----", 1, true) then
  l_0_6 = "rsa"
else
  if (string.find)(l_0_4, "-----BEGIN DSA PRIVATE KEY-----", 1, true) then
    l_0_6 = "dsa"
  else
    if (string.find)(l_0_4, "-----BEGIN EC PRIVATE KEY-----", 1, true) then
      l_0_6 = "ec"
    else
      if (string.find)(l_0_4, "-----BEGIN OPENSSH PRIVATE KEY-----", 1, true) then
        l_0_6 = "openssh"
      else
        if (string.find)(l_0_4, "-----BEGIN PRIVATE KEY-----", 1, true) then
          l_0_6 = "generic"
        end
      end
    end
  end
end
if l_0_6 == nil then
  return mp.CLEAN
end
local l_0_7 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_8 = {}
do
  l_0_8.file = l_0_7 or "unknown"
  l_0_8.key_type = l_0_6
  ;
  (mp.SetDetectionString)(safeJsonSerialize(l_0_8))
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC180: freeLocal<0 in 'ReleaseLocals'

end

