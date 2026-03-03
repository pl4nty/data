-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanAIAgentMCPSchemaPoisoningA\1.luac 

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
if not (string.find)(l_0_6, "mcpservers", 1, true) and not (string.find)(l_0_6, "mcp_servers", 1, true) and not (string.find)(l_0_6, "description", 1, true) then
  return mp.CLEAN
end
local l_0_7 = {}
-- DECOMPILER ERROR at PC112: No list found for R7 , SetList fails

local l_0_8 = {}
-- DECOMPILER ERROR at PC114: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC115: Overwrote pending register: R10 in 'AssignReg'

for l_0_12,l_0_13 in ("ignore all previous")("disregard instructions") do
  -- DECOMPILER ERROR at PC118: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC120: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC121: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC122: Overwrote pending register: R17 in 'AssignReg'

end
if not (("new instructions:").find)("override system prompt", "forget your rules", "act as if you", true) or #l_0_8 == 0 then
  return mp.CLEAN
end
do
  if not (string.find)(l_0_6, "inputschema", 1, true) and not (string.find)(l_0_6, "tool_input", 1, true) then
    local l_0_14 = (string.find)(l_0_6, "mcpservers", 1, true)
  end
  -- DECOMPILER ERROR at PC163: Confused about usage of register: R9 in 'UnsetPending'

  if not l_0_14 then
    return mp.CLEAN
  end
  if (string.find)(l_0_6, "example of prompt injection", 1, true) or (string.find)(l_0_6, "security testing", 1, true) or (string.find)(l_0_6, "unit test", 1, true) then
    return mp.CLEAN
  end
  local l_0_15 = nil
  local l_0_16 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  do
    ;
    (mp.SetDetectionString)(safeJsonSerialize({file = l_0_16 or "unknown", injections = (table.concat)(l_0_8, ",")}))
    do return mp.INFECTED end
    -- DECOMPILER ERROR at PC228: freeLocal<0 in 'ReleaseLocals'

  end
end

