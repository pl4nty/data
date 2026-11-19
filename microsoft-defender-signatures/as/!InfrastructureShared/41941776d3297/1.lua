-- Threat: !InfrastructureShared
-- Name: 41941776d3297
-- Type: 21

local function l_0_0(l_1_0)
  if l_1_0 == nil then
    return ""
  end
  return string.lower(tostring(l_1_0))
end

local function l_0_1(l_2_0, l_2_1)
  if l_2_0 == nil then
    return ""
  end
  return string.sub(tostring(l_2_0), 1, l_2_1)
end

local function l_0_2(l_3_0, l_3_1)
  local l_3_2 = l_0_0(l_3_0)
  for l_3_3, l_3_4 in ipairs(l_3_1) do
    if string.find(l_3_2, l_3_4, 1, true) then
      return true
    end
  end
  return false
end

local function l_0_3(l_4_0)
  return l_4_0 ~= nil and l_4_0.matched
end

local l_0_4 = nri.GetHttpCommand()
local l_0_5 = l_0_0(nri.GetURI())
local l_0_6 = l_0_0(nri.GetHttpRequestHeader("Authorization"))
local l_0_7 = l_0_0(nri.GetHttpRequestHeader("Content-Type"))
local l_0_8 = l_0_0(nri.GetHttpRequestHeader("User-Agent"))
local l_0_9 = l_0_1(nri.GetRawRequestBlob(), 4096)
local l_0_10 = l_0_5 .. l_0_9 .. l_0_6 .. l_0_7 .. l_0_8
local l_0_12 = l_0_4 == nri.HTTP_POST or l_0_4 == nri.HTTP_PUT or l_0_4 == nri.HTTP_DELETE
local l_0_13 = l_0_3(this_sigattrlog[1])
local l_0_14 = l_0_3(this_sigattrlog[2])
local l_0_15 = l_0_3(this_sigattrlog[3])
local l_0_16 = l_0_3(this_sigattrlog[4])
local l_0_17 = l_0_3(this_sigattrlog[5])
local l_0_18 = l_0_3(this_sigattrlog[6]) or l_0_3(this_sigattrlog[7]) or l_0_3(this_sigattrlog[8]) or l_0_3(this_sigattrlog[9])
local l_0_19 = l_0_3(this_sigattrlog[10]) or l_0_3(this_sigattrlog[11]) or l_0_3(this_sigattrlog[12])
local l_0_20 = l_0_3(this_sigattrlog[13]) or l_0_3(this_sigattrlog[14])
local l_0_22 = l_0_4 == nri.HTTP_GET and l_0_18 and l_0_2(l_0_5, {
  "/latest/meta-data/iam/security-credentials",
  "/latest/api/token",
  "/metadata/identity/oauth2/token",
  "/computemetadata/v1"
})
local l_0_24 = l_0_4 == nri.HTTP_GET and l_0_20
local l_0_25 = l_0_12 and l_0_13 and l_0_2(l_0_5 .. l_0_9, {
  "/graphql",
  "/repos/",
  "/gists",
  "createcommitonbranch",
  "createrepository",
  "\"contents\"",
  "\"gist\"",
  "\"repository\""
}) and l_0_2(l_0_10, {
  "authorization",
  "bearer ",
  "github_token",
  "gh_token",
  "actions_id_token_request_token",
  "token"
})
local l_0_26 = l_0_12 and l_0_14 and l_0_2(l_0_5 .. l_0_9, {
  "/-/npm/v1/tokens",
  "/-/user/org.couchdb.user",
  "/-/package/",
  "npm publish",
  "_authtoken",
  "npm_token",
  "bypass_2fa"
}) and l_0_2(l_0_10, {
  "_authtoken",
  "npm_token",
  "authorization",
  "bearer "
})
local l_0_27 = l_0_12 and l_0_15 and l_0_2(l_0_5 .. l_0_9, {
  "/legacy",
  "pypi",
  "twine",
  "__token__"
}) and l_0_2(l_0_10, {
  "__token__",
  "authorization",
  "bearer "
})
local l_0_28 = l_0_12 and l_0_16 and l_0_2(l_0_5 .. l_0_9, {
  "/api/v2/package",
  "/v3/index.json",
  "nuget",
  "x-nuget-apikey",
  "api.nuget.org"
}) and l_0_2(l_0_10, {
  "x-nuget-apikey",
  "authorization",
  "bearer "
})
local l_0_29 = l_0_12 and l_0_17 and l_0_2(l_0_5 .. l_0_9, {
  "/artifactory/",
  "/api/v4",
  "jfrog",
  "x-jfrog-art-api"
}) and l_0_2(l_0_10, {
  "x-jfrog-art-api",
  "authorization",
  "bearer "
})
local l_0_30 = l_0_12 and l_0_19 and l_0_2(l_0_10, {
  "oidc",
  "fulcio",
  "rekor",
  "provenance",
  "sigstore",
  "certificate",
  "actions_id_token_request_token"
})
if l_0_22 or l_0_24 or l_0_25 or l_0_26 or l_0_27 or l_0_28 or l_0_29 or l_0_30 then
  nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY))
  return mp.INFECTED
end
return mp.CLEAN
