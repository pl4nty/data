-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanAIAgentMCPSupplyChainA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.get_mpattribute)("Lua:FnameAttr!mcp.json")
local l_0_2 = (mp.get_mpattribute)("Lua:FnameAttr!claude_desktop_config.json")
local l_0_3 = (mp.get_mpattribute)("Lua:FnameAttr!settings.json")
if not l_0_1 and not l_0_2 and not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = (mp.getfilesize)()
if l_0_4 < 20 or l_0_4 > 524288 then
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
if not (string.find)(l_0_6, "mcp", 1, true) then
  return mp.CLEAN
end
local l_0_7 = {}
-- DECOMPILER ERROR at PC110: No list found for R7 , SetList fails

local l_0_8 = {}
-- DECOMPILER ERROR at PC112: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC113: Overwrote pending register: R10 in 'AssignReg'

for l_0_12,l_0_13 in ("cloude-code")("cloude") do
  -- DECOMPILER ERROR at PC116: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC118: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC119: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC120: Overwrote pending register: R17 in 'AssignReg'

end
if not (("@modelcontextprotoco1").find)("@mode1contextprotocol", "mcp-server-fetch-", "mcp-server--", true) or #l_0_8 == 0 then
  return mp.CLEAN
end
local l_0_14 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_15 = {}
do
  ;
  (mp.SetDetectionString)(safeJsonSerialize(l_0_15))
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC166: freeLocal<0 in 'ReleaseLocals'

  -- WARNING: undefined locals caused missing assignments!
end

