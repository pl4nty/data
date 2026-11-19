-- Threat: !InfrastructureShared
-- Name: 2db3f1a2d3b4
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_1 = string.lower(l_0_0)
if string.find(l_0_1, "\\program files", 1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
local l_0_3 = 0
if l_0_2 ~= nil then
  for l_0_4, l_0_5 in ipairs(l_0_2) do
    l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
    if sysio.IsFileExists(l_0_5) then
      local l_0_6 = sysio.GetFileLastWriteTime(l_0_5)
      if sysio.GetLastResult().Success and l_0_6 ~= 0 then
        l_0_6 = l_0_6 / 10000000 - 11644473600
        local l_0_7 = MpCommon.GetCurrentTimeT()
        if l_0_6 < l_0_7 and l_0_7 - l_0_6 < 600 then
          l_0_3 = 1
          bm.add_related_file(l_0_5)
        end
      end
    end
  end
end
if l_0_3 == 1 then
  return mp.INFECTED
end
return mp.CLEAN
