-- Threat: !InfrastructureShared
-- Name: 177b322178657
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if bm.GetSignatureMatchDuration() > 100000000 then
  return mp.CLEAN
end
local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and l_0_0 ~= "" and (IsExcludedByImagePath(l_0_0) or string.find(l_0_0, "/usr/lib/jvm/java", 1, true) == 1 or string.find(l_0_0, "/usr/lib/jvm/jre", 1, true) == 1) then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 ~= nil and l_0_1.ppid ~= nil and isParentPackageManager(l_0_1.ppid, true) then
  return mp.CLEAN
end
local l_0_2 = 5
local l_0_3 = 16384
local l_0_4 = 16389
local l_0_5 = {
  txt = true,
  js = true,
  pptx = true,
  ppt = true,
  doc = true,
  docx = true,
  xlsx = true,
  xls = true,
  ["7z"] = true,
  zip = true,
  tar = true,
  gz = true,
  rar = true,
  pdf = true,
  png = true,
  jpg = true,
  pst = true,
  ost = true,
  html = true,
  htm = true,
  py = true,
  sh = true,
  pl = true,
  php = true
}
local l_0_6 = {}

local function l_0_7(l_1_0)
  if l_1_0 == nil or not l_1_0.matched then
    return
  end
  local l_1_1 = l_1_0.attribute
  local l_1_2 = l_1_0.utf8p1
  if type(l_1_2) ~= "string" or l_1_2 == "" then
    return
  end
  local l_1_3 = string.match(l_1_2, "([^/]+)$")
  if l_1_3 == nil then
    return
  end
  local l_1_4, l_1_5, l_1_6 = string.match(l_1_3, "^(.+)%.([^%.]+)%.([^%.]+)$")
  if l_1_4 == nil or l_1_6 == nil then
    return
  end
  if not l_0_5[string.lower(l_1_5)] then
    return
  end
  local l_1_7 = l_0_6[l_1_2]
  if l_1_7 == nil then
    l_1_7 = {}
    l_0_6[l_1_2] = l_1_7
  end
  if l_1_1 == l_0_3 then
    l_1_7.created = true
  elseif l_1_1 == l_0_4 then
    l_1_7.unknown = true
  end
end

l_0_7(this_sigattrlog[1])
l_0_7(this_sigattrlog[2])
l_0_7(this_sigattrlog[3])
l_0_7(this_sigattrlog[4])
l_0_7(this_sigattrlog[5])
l_0_7(this_sigattrlog[6])
l_0_7(this_sigattrlog[7])
l_0_7(this_sigattrlog[8])
l_0_7(this_sigattrlog[9])
l_0_7(this_sigattrlog[10])
if next(l_0_6) == nil then
  return mp.CLEAN
end
local l_0_8 = 0
for l_0_9, l_0_10 in pairs(l_0_6) do
  if l_0_10.created and l_0_10.unknown then
    l_0_8 = l_0_8 + 1
  end
end
if l_0_2 > l_0_8 then
  return mp.CLEAN
end
bm.add_related_string("ImagePath", l_0_0, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
return mp.INFECTED
