-- Threat: !InfrastructureShared
-- Name: 47d7fb281b20
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.match(string.lower(l_0_1), "https?://[%w-_%.%?%.:/%+=&]+")
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3, l_0_4 = mp.CheckUrl(l_0_2)
if l_0_3 == 1 and l_0_4 == 1 then
  return mp.CLEAN
end
local l_0_5 = {}
table.insert(l_0_5, l_0_2)
local l_0_6 = {}
l_0_6.SIG_CONTEXT = "CMD"
l_0_6.CONTENT_SOURCE = "CURL"
l_0_6.PROCESS_CONTEXT = "CURL.EXE"
l_0_6.PARENT_CONTEXT = nil
l_0_6.FILELESS = "false"
l_0_6.CMDLINE_URL = "true"
l_0_6.BREAK_AT_FIRST_HIT_MALWARE = "40"
local l_0_7 = mp.GetUrlReputation(l_0_5, l_0_6)
if l_0_7 ~= nil then
  local l_0_8 = l_0_7.urls
  for l_0_9, l_0_10 in ipairs(l_0_8) do
    if l_0_10 ~= nil and l_0_10.determination ~= nil then
      local l_0_11 = l_0_10.determination
      local l_0_12 = l_0_10.confidence
      if l_0_11 == 2 and 60 <= l_0_12 then
        return mp.INFECTED
      elseif l_0_11 == 1 then
        return mp.CLEAN
      elseif l_0_11 == 4 and 10 <= l_0_12 then
        mp.set_mpattribute("CMDHSTR:Win32/Suspilruc!unknown")
      else
        mp.set_mpattribute("CMDHSTR:Win32/Suspilruc!others")
      end
    end
  end
end
return mp.CLEAN
