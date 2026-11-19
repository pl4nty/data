-- Threat: !InfrastructureShared
-- Name: !#ALF:SuspiciousMalformedDoc.B
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
if 5376 < l_0_1 then
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
    ".wz",
    ".pkm",
    ".cache",
    ".pkgd",
    ".sfc",
    ".dcp",
    ".p00"
  }
  if l_0_0(l_0_2, l_0_3) == true then
    return mp.CLEAN
  end
  local l_0_4 = mp.readheader(2, 2)
  if l_0_4 == "\003\004" then
    return mp.CLEAN
  end
  mp.readprotection(false)
  local l_0_5 = mp.readfile(l_0_1 - 512, 512)
  mp.readprotection(true)
  local l_0_6 = string.find(l_0_5, "PK\005\006", 1, true)
  if l_0_6 == nil then
    return mp.CLEAN
  end
  if l_0_1 < l_0_1 - 512 + l_0_6 + 16 + 4 then
    return mp.CLEAN
  end
  local l_0_7 = mp.readu_u32(l_0_5, l_0_6 + 12)
  local l_0_8 = mp.readu_u32(l_0_5, l_0_6 + 16)
  l_0_6 = 512 - l_0_6
  if l_0_6 < 0 or l_0_1 < l_0_6 + l_0_7 + 4 then
    return mp.CLEAN
  end
  mp.readprotection(false)
  local l_0_9 = mp.readfile(l_0_1 - l_0_6 - l_0_7 - 1, 4)
  mp.readprotection(true)
  if l_0_9 ~= "PK\001\002" then
    return mp.CLEAN
  end
  if l_0_1 < l_0_6 + l_0_7 + l_0_8 + 4 then
    return mp.CLEAN
  end
  mp.readprotection(false)
  local l_0_10 = mp.readfile(l_0_1 - l_0_6 - l_0_7 - l_0_8 - 1, 4)
  mp.readprotection(true)
  if l_0_10 ~= "PK\003\004" then
    return mp.CLEAN
  end
  if 512 < l_0_1 - l_0_6 - l_0_7 - l_0_8 then
    return mp.INFECTED
  end
end
return mp.CLEAN
