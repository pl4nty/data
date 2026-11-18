-- Threat: !InfrastructureShared
-- Name: 8c8daed5badd
-- Type: 21

local l_0_0 = versioning.GetOrgID()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "767a35f6-ae33-4609-8630-c7d7a86ed134" then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = mp.GetCertificateInfo()
if (l_0_2 == nil or #l_0_2 < 1) and (string.find(l_0_1, "^/users/[^/]+/library/caches/google/chrome/", 1, false) or string.find(l_0_1, "^/users/[^/]+/library/caches/[^/]+/[^/]+%.app/contents/macos/", 1, false) or string.find(l_0_1, "^/users/[^/]+/library/application support/[^/]+/[^/]+%.app/contents/macos/", 1, false)) then
  return mp.INFECTED
end
return mp.CLEAN
