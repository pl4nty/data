-- Threat: \xac!SuspPfxDrop.AM
-- Type: 13
-- Includes: ResearchData, LuaFuncHelper, HvaLookupHelpers, BMLuaLib
-- MpAttributes: (RPF:TopLevelFile) & (Lua:TopLevelUnsigned)

if not IsDeviceHVA() then
  return mp.CLEAN
end
local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_0) or isnull(l_0_1) then
  return mp.CLEAN
end
if not StringEndsWith(l_0_1, ".pfx") and not StringEndsWith(l_0_1, ".p12") then
  return mp.CLEAN
end
local l_0_2 = {
  "\\windows\\system32\\",
  "\\programdata\\microsoft\\crypto\\",
  "\\microsoft\\systemcertificates\\",
  "\\program files",
  "\\inetpub\\"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.find(l_0_0, l_0_4, 1, true) then
    return mp.CLEAN
  end
end
local l_0_5 = false
local l_0_6 = {
  "\\users\\public\\",
  "\\temp\\",
  "\\appdata\\local\\temp\\",
  "\\downloads\\",
  "\\desktop\\",
  "\\documents\\",
  "\\music\\"
}
for l_0_7, l_0_8 in ipairs(l_0_6) do
  if string.find(l_0_0, l_0_8, 1, true) then
    l_0_5 = true
    break
  end
end
local l_0_9 = {
  "administrator.pfx",
  "administrator.p12",
  "admin.pfx",
  "admin.p12",
  "krbtgt.pfx",
  "domain_admin",
  "da.pfx"
}
local l_0_10 = false
for l_0_11, l_0_12 in ipairs(l_0_9) do
  if string.find(l_0_1, l_0_12, 1, true) then
    l_0_10 = true
    break
  end
end
if not l_0_5 and not l_0_10 then
  return mp.CLEAN
end
local l_0_13 = mp.getfilesize()
if l_0_13 == nil or l_0_13 < 32 then
  return mp.CLEAN
end
if 50000000 < l_0_13 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_14 = mp.readfile(0, 64)
mp.readprotection(true)
if isnull(l_0_14) then
  return mp.CLEAN
end
l_0_14 = tostring(l_0_14)
local l_0_15 = string.byte(l_0_14, 1)
if l_0_15 ~= 48 then
  return mp.CLEAN
end
local l_0_16 = "\006\t*\134H\134\247\r\001\a\001"
if not string.find(l_0_14, l_0_16, 1, true) then
  return mp.CLEAN
end
set_research_data("susp_pfx_path", l_0_0, false)
set_research_data("susp_pfx_name", l_0_1, false)
set_research_data("susp_pfx_size", tostring(l_0_13), false)
set_research_data("susp_pfx_in_path", tostring(l_0_5), false)
set_research_data("susp_pfx_has_name", tostring(l_0_10), false)
return mp.INFECTED
