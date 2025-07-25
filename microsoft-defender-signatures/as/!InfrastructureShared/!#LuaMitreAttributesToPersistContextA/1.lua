-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaMitreAttributesToPersistContextA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("AGGR:FileDroppedOverSmbExcl") then
  return mp.CLEAN
end
local l_0_0 = "BM_MT"
local l_0_1 = (mp.enum_mpattributesubstring)(l_0_0)
if l_0_1 == nil or #l_0_1 == 0 or type(l_0_1) ~= "table" then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_3 == nil then
  return mp.CLEAN
end
for l_0_7,l_0_8 in ipairs(l_0_1) do
  local l_0_9 = (string.sub)(l_0_8, #l_0_0, #l_0_8)
  if l_0_9 ~= nil and #l_0_9 >= 4 and (string.match)(l_0_9, "^[tT][0-9][0-9][0-9][0-9]") then
    if not (MpCommon.QueryPersistContext)(l_0_2, l_0_9) then
      (MpCommon.AppendPersistContext)(l_0_2, l_0_9, 600)
    end
    local l_0_10, l_0_11 = (string.match)(l_0_9, "^([tT][0-9][0-9][0-9][0-9][%.]?[0-9]?[0-9]?[0-9]?):?(.*)")
    TT_SendBMSigTrigger(l_0_3, l_0_10, l_0_11)
  end
end
return mp.CLEAN

