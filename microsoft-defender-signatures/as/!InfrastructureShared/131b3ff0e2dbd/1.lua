-- Threat: !InfrastructureShared
-- Name: 131b3ff0e2dbd
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, HvaLookupHelpers

if not IsDeviceHVA() then
  return mp.CLEAN
end
if not this_sigattrlog[5].matched or this_sigattrlog[5].utf8p2 == nil then
  return mp.CLEAN
end
if not this_sigattrlog[6].matched or this_sigattrlog[6].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[5].utf8p2
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0 ~= 389 and l_0_0 ~= 636 and l_0_0 ~= 88 then
  return mp.CLEAN
end
local l_0_1 = string.lower(this_sigattrlog[6].utf8p1)
local l_0_2 = {
  "\\windows\\system32\\",
  "\\programdata\\microsoft\\crypto\\",
  "\\microsoft\\systemcertificates\\"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_4, 1, true) then
    return mp.CLEAN
  end
end
local l_0_5 = bm.get_imagepath()
if isnull(l_0_5) then
  return mp.CLEAN
end
l_0_5 = string.lower(l_0_5)
if string.find(l_0_5, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
bm.add_related_file(l_0_1)
add_parents()
TrackPidAndTechniqueBM("BM", "T1649", "python_cert_abuse")
return mp.INFECTED
