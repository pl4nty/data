-- Threat: !InfrastructureShared
-- Name: !#ALF:SuspiciousMalformedDoc
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_ZIP_FILE

local function l_0_0(l_1_0, l_1_1)
  for l_1_2, l_1_3 in ipairs(l_1_1) do
    if string.find(l_1_0, l_1_3, 1, true) then
      return true
    end
  end
  return false
end

local l_0_1 = mp.getfilesize()
if 8192 < l_0_1 then
  local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  l_0_2 = l_0_2:match("\\[^\\]+$")
  if l_0_2 == nil then
    return mp.CLEAN
  end
  if string.find(l_0_2, "antiransomelastic", 1, true) then
    return mp.CLEAN
  end
  local l_0_3 = {
    ".zip",
    "wz",
    "pkm",
    "cache",
    "pkgd",
    "sfc",
    "dcp",
    "P00"
  }
  if l_0_0(l_0_2, l_0_3) == true then
    return mp.CLEAN
  end
  local l_0_4 = mp.readheader(2, 2)
  if l_0_4 == "\003\004" then
    return mp.CLEAN
  end
  mp.readprotection(false)
  local l_0_5 = mp.readfile(l_0_1 - 640, 624)
  mp.readprotection(true)
  if string.find(l_0_5, "/styles.xmlPK", 1, true) or string.find(l_0_5, "/settings.xmlPK", 1, true) or string.find(l_0_5, "/core.xmlPK", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
