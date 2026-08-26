-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\beb36b3d999e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = GetRollingQueueKeys("IsTerminalFixCMD")
if l_0_0 == nil then
  return mp.CLEAN
end
for l_0_4,l_0_5 in ipairs(l_0_0) do
  if type(l_0_5) == "string" and l_0_5 ~= "" then
    (bm.add_related_string)((string.format)("ETW_ClipWrite_CMD%s", tostring(l_0_4)), tostring(l_0_5), bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN

