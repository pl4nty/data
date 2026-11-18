-- Threat: !InfrastructureShared
-- Name: 79b339932064
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if string.find(l_0_0, "sqlite.dll", 1, true) or string.find(l_0_0, "axhub.dll", 1, true) or string.find(l_0_0, ".ocx", 1, true) then
  return mp.CLEAN
end
local l_0_1 = extractDllForRegproc(l_0_0)
if l_0_1 then
  l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
  if sysio.IsFileExists(l_0_1) then
    local l_0_2 = sysio.GetFileLastWriteTime(l_0_1)
    if sysio.GetLastResult().Success and l_0_2 ~= 0 then
      l_0_2 = l_0_2 / 10000000 - 11644473600
      local l_0_3 = MpCommon.GetCurrentTimeT()
      if l_0_2 > l_0_3 or 3600 < l_0_3 - l_0_2 then
        bm.add_related_file(l_0_1)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
