-- Threat: !InfrastructureShared
-- Name: 59d7de717cb3
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end

local function l_0_2(l_1_0)
  local l_1_1 = {}
  for l_1_2 in string.gmatch(l_1_0, "http[s]?://[^\"%s]+") do
    table.insert(l_1_1, l_1_2)
  end
  return l_1_1
end

local l_0_3 = l_0_2(l_0_1)
local l_0_4 = {}
l_0_4.SIG_CONTEXT = "CMD"
l_0_4.CONTENT_SOURCE = "MSHTA_SCHTASK"
l_0_4.PROCESS_CONTEXT = "schtasks.exe"
l_0_4.FILELESS = "true"
l_0_4.CMDLINE_URL = "true"
l_0_4.TAG = "INTERFLOW"
for l_0_5, l_0_6 in ipairs(l_0_3) do
  if string.match(l_0_6, "^https?://") then
    local l_0_7 = SafeGetUrlReputation({l_0_6}, l_0_4, false, 3000)
    if l_0_7.urls[l_0_6] and l_0_7.urls[l_0_6].determination == 2 and l_0_7.urls[l_0_6].confidence >= 60 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
