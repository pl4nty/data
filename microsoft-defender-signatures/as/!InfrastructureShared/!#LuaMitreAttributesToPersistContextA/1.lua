-- Threat: !InfrastructureShared
-- Name: !#Lua:MitreAttributesToPersistContext.A
-- Type: 24
-- Includes: TechniqueTracker
-- MpAttributes: RPF:TopLevelFile

if mp.get_mpattribute("AGGR:FileDroppedOverSmbExcl") then
  return mp.CLEAN
end
local l_0_0 = "BM_MT"
local l_0_1 = mp.enum_mpattributesubstring(l_0_0)
if l_0_1 == nil or #l_0_1 == 0 or type(l_0_1) ~= "table" then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_3 == nil then
  return mp.CLEAN
end
for l_0_4, l_0_5 in ipairs(l_0_1) do
  local l_0_6 = string.sub(l_0_5, #l_0_0, #l_0_5)
  if l_0_6 ~= nil and 4 <= #l_0_6 and string.match(l_0_6, "^[tT][0-9][0-9][0-9][0-9]") then
    if not MpCommon.QueryPersistContext(l_0_2, l_0_6) then
      MpCommon.AppendPersistContext(l_0_2, l_0_6, 600)
    end
    local l_0_7, l_0_8 = string.match(l_0_6, "^([tT][0-9][0-9][0-9][0-9][%.]?[0-9]?[0-9]?[0-9]?):?(.*)")
    TT_SendBMSigTrigger(l_0_3, l_0_7, l_0_8)
  end
end
return mp.CLEAN
