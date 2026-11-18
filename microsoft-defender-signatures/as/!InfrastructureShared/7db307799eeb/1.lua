-- Threat: !InfrastructureShared
-- Name: 7db307799eeb
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end

local function l_0_1(l_1_0)
  local l_1_1 = {}
  for l_1_2 in string.gmatch(l_1_0, "http[s]?://[^\"%s]+") do
    table.insert(l_1_1, l_1_2)
  end
  return l_1_1
end

if l_0_0 ~= nil and string.find(l_0_0, "/create", 1, true) and string.find(l_0_0, "msbuild", 1, true) then
  local l_0_2 = l_0_1(l_0_0)
  local l_0_3 = {}
  l_0_3.SIG_CONTEXT = "BM"
  l_0_3.CONTENT_SOURCE = "MSBUILD_SCHTASK_OFN"
  l_0_3.PROCESS_CONTEXT = "schtasks.exe"
  l_0_3.FILELESS = "true"
  l_0_3.CMDLINE_URL = "true"
  for l_0_4, l_0_5 in ipairs(l_0_2) do
    if string.match(l_0_5, "^https?://") then
      local l_0_6 = SafeGetUrlReputation({l_0_5}, l_0_3, false, 3000)
      if l_0_6.urls[l_0_5] and l_0_6.urls[l_0_5].determination == 2 and l_0_6.urls[l_0_5].confidence >= 60 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
