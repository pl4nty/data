-- Threat: !InfrastructureShared
-- Name: 41b39083d951
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if StringEndsWith(l_0_3, ".vbs") or StringEndsWith(l_0_3, ".js") then
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    if sysio.IsFileExists(l_0_3) then
      local l_0_4 = sysio.GetFileLastWriteTime(l_0_3)
      if sysio.GetLastResult().Success and l_0_4 ~= 0 then
        l_0_4 = l_0_4 / 10000000 - 11644473600
        local l_0_5 = MpCommon.GetCurrentTimeT()
        if l_0_4 < l_0_5 and l_0_5 - l_0_4 <= 600 then
          bm.add_related_file(l_0_3)
        end
      end
    end
  end
end
return mp.INFECTED
