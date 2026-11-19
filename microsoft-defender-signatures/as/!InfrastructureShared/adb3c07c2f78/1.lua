-- Threat: !InfrastructureShared
-- Name: adb3c07c2f78
-- Type: 21
-- Includes: LuaFuncHelper, TechniqueTracker

local l_0_0
local l_0_1 = "|.js|jse|vbs|vbe|"
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if sysio.IsFileExists(l_0_4) then
    if checkFileLastWriteTime(l_0_4, 600) ~= false then
      return mp.CLEAN
    end
    local l_0_5 = string.lower(string.sub(l_0_4, -3))
    if string.find(l_0_1, l_0_5, 1, true) then
      local l_0_6, l_0_7 = mp.GetMotwReferrerUrlForFile(l_0_4)
      if not l_0_6 then
        return mp.CLEAN
      end
      if l_0_7 then
        local l_0_8 = {}
        l_0_8.SIG_CONTEXT = "ScriptDropPE"
        l_0_8.CONTENT_SOURCE = "ScriptDropPE"
        l_0_8.TAG = "INTERFLOW"
        local l_0_9 = SafeGetUrlReputation({l_0_7}, l_0_8, false, 2000)
        if l_0_9.urls[l_0_7] and l_0_9.urls[l_0_7].determination ~= 1 and l_0_9.urls[l_0_7].confidence ~= 90 then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
