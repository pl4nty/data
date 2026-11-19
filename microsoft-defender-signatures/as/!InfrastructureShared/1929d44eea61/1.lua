-- Threat: !InfrastructureShared
-- Name: 1929d44eea61
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = string.lower(tostring(headerpage))
else
  l_0_1 = string.lower(tostring(footerpage))
end
local l_0_2, l_0_3 = string.gsub(l_0_1, "function%(_0x", "")
if 3 < l_0_3 then
  local l_0_4 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_4 then
    if string.find(l_0_4, "node_modules", 1, true) and string.find(l_0_4, "[/\\]%.bun[/\\]", 1, false) == nil then
      mp.set_mpattribute("SCPT:SuspNpmObsJS")
    end
    if string.find(l_0_4, "/.npm/", 1, true) or string.find(l_0_4, "\\npm-cache\\", 1, true) then
      mp.set_mpattribute("SCPT:SuspNpmObsJS1")
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
