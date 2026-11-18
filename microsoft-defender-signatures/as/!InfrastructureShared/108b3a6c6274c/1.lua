-- Threat: !InfrastructureShared
-- Name: 108b3a6c6274c
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, HvaLookupHelpers

if not IsDeviceHVA() then
  return mp.CLEAN
end
if not this_sigattrlog[4].matched or this_sigattrlog[4].utf8p2 == nil then
  return mp.CLEAN
end
if not this_sigattrlog[5].matched or this_sigattrlog[5].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[4].utf8p2
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0 ~= 389 and l_0_0 ~= 636 and l_0_0 ~= 88 then
  return mp.CLEAN
end
local l_0_1 = string.lower(this_sigattrlog[5].utf8p1)
local l_0_2 = {
  "/etc/ssl/",
  "/etc/pki/",
  "/usr/share/ca-certificates/"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_4, 1, true) then
    return mp.CLEAN
  end
end
bm.add_related_file(l_0_1)
add_parents()
TrackPidAndTechniqueBM("BM", "T1649", "python_cert_abuse_linux")
return mp.INFECTED
