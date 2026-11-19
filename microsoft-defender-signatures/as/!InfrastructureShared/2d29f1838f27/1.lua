-- Threat: !InfrastructureShared
-- Name: 2d29f1838f27
-- Type: 21
-- Includes: ResearchData

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if string.match(l_0_0, "\\tasks") ~= nil and string.match(l_0_1, "[^ ]+ +[^ ]+$") == nil and mp.get_mpattribute("BM_XML_FILE") and not mp.get_mpattribute("MpInternal_IsPliScan") and not mp.get_mpattribute("MpAlwaysLowfiMatch") then
  local l_0_2 = mp.GetBruteMatchData()
  local l_0_3 = l_0_2.match_offset + 1
  local l_0_4 = 128
  local l_0_5 = ""
  if l_0_2.is_header then
    l_0_5 = tostring(headerpage):sub(l_0_3, l_0_3 + l_0_4)
  else
    l_0_5 = tostring(footerpage):sub(l_0_3, l_0_3 + l_0_4)
  end
  local l_0_6 = string.lower(l_0_5)
  local l_0_7 = {
    "youtube-dl%.exe",
    "ffmpeg%.exe",
    "curl%.exe",
    "vstoinstaller%.exe",
    "microsoft%.com",
    "/feedstation/",
    "=updateindex",
    "/iplog%.php%?",
    "/default%.aspx%?",
    "localhost",
    "%:[0-9]+/",
    "%.co%.kr",
    "%.cf/",
    "cleveraccounts%.com",
    "syncfx%.com",
    "pass-pdam%.com"
  }
  local l_0_8 = #l_0_7
  for l_0_9 = 1, l_0_8 do
    if string.match(l_0_6, l_0_7[l_0_9]) ~= nil then
      return mp.CLEAN
    end
  end
  local l_0_10 = l_0_5:find("http", 1, true)
  if l_0_10 ~= nil then
    l_0_5 = l_0_5:sub(l_0_10, l_0_4 - 1)
    local l_0_11, l_0_12 = l_0_5:find("<", 1, true)
    if l_0_12 ~= nil then
      local l_0_13, l_0_14 = l_0_5:find(" ", 1, true)
      local l_0_15 = ""
      if l_0_14 ~= nil and l_0_12 > l_0_14 then
        l_0_15 = l_0_5:sub(1, l_0_14 - 1)
      else
        l_0_15 = l_0_5:sub(1, l_0_12 - 1)
      end
      local l_0_16 = MpCommon.Base64Encode(l_0_15)
      set_research_data("taskRenamedMsiUrl", l_0_16, false)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
