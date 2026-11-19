-- Threat: !InfrastructureShared
-- Name: 11fb3118cf320
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, HvaLookupHelpers

if not IsDeviceHVA() then
  return mp.CLEAN
end
if not this_sigattrlog[6].matched or this_sigattrlog[6].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[6].utf8p1)
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
local l_0_2 = {
  "\\certutil.exe",
  "\\certreq.exe",
  "\\mmc.exe",
  "\\certsrv.exe",
  "\\iisexpress.exe",
  "\\inetinfo.exe",
  "\\w3wp.exe",
  "\\letsencrypt",
  "\\openssl.exe",
  "\\dotnet.exe"
}
if contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  "\\windows\\system32\\",
  "\\programdata\\microsoft\\crypto\\",
  "\\microsoft\\systemcertificates\\",
  "\\program files",
  "\\inetpub\\"
}
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if string.find(l_0_0, l_0_5, 1, true) then
    return mp.CLEAN
  end
end
local l_0_6 = {
  "\\users\\public\\",
  "\\temp\\",
  "\\appdata\\local\\temp\\",
  "\\downloads\\",
  "\\desktop\\",
  "\\documents\\",
  "\\music\\"
}
local l_0_7 = {
  "administrator.pfx",
  "administrator.p12",
  "admin.pfx",
  "admin.p12",
  "krbtgt.pfx",
  "domain_admin",
  "da.pfx"
}
local l_0_8 = contains(l_0_0, l_0_6) or contains(l_0_0, l_0_7)
if not l_0_8 then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
add_parents()
TrackPidAndTechniqueBM("BM", "T1649", "susp_pfx_file_drop")
return mp.INFECTED
