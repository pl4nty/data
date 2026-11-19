-- Threat: !InfrastructureShared
-- Name: beb36b3d999e
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = GetRollingQueueKeys("IsTerminalFixCMD")
if l_0_0 == nil then
  return mp.CLEAN
end
for l_0_1, l_0_2 in ipairs(l_0_0) do
  if type(l_0_2) == "string" and l_0_2 ~= "" then
    bm.add_related_string(string.format("ETW_ClipWrite_CMD%s", tostring(l_0_1)), tostring(l_0_2), bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
