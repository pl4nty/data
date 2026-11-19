-- Threat: !InfrastructureShared
-- Name: !#Lua:NodeEncodedStage.AM
-- Type: 12
-- Includes: BMLuaLib, ResearchData

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if isnull(l_0_0) or type(l_0_0) ~= "string" then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
if string.sub(l_0_1, -3) ~= ".js" and string.sub(l_0_1, -4) ~= ".mjs" and string.sub(l_0_1, -4) ~= ".cjs" then
  return mp.CLEAN
end
local l_0_2 = mp.getfilesize()
if isnull(l_0_2) or type(l_0_2) ~= "number" or l_0_2 ~= l_0_2 or l_0_2 < 128 or 1048576 < l_0_2 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3, l_0_4 = pcall(mp.readfile, 0, l_0_2)
mp.readprotection(true)
if not l_0_3 or isnull(l_0_4) or type(l_0_4) ~= "string" or #l_0_4 ~= l_0_2 then
  set_research_data("SC_NodeStage_Error", "IncompleteFileRead", false)
  return mp.CLEAN
end
l_0_4 = string.lower(l_0_4)

local function l_0_5(l_1_0, l_1_1)
  for l_1_2, l_1_3 in ipairs(l_1_1) do
    if string.find(l_1_0, l_1_3, 1, true) then
      return true
    end
  end
  return false
end

if not l_0_5(l_0_4, {
  "node:vm",
  "'vm'",
  "\"vm\""
}) or not l_0_5(l_0_4, {
  "node:zlib",
  "'zlib'",
  "\"zlib\""
}) then
  return mp.CLEAN
end
if not l_0_5(l_0_4, {
  "brotlidecompresssync",
  "gunzipsync",
  "inflatesync",
  "inflaterawsync",
  "unzipsync"
}) then
  return mp.CLEAN
end
if not l_0_5(l_0_4, {
  "'base64'",
  "\"base64\"",
  "'base64url'",
  "\"base64url\""
}) or not string.find(l_0_4, "buffer", 1, true) then
  return mp.CLEAN
end
if not l_0_5(l_0_4, {
  "runinnewcontext",
  "runincontext",
  "runinthiscontext"
}) then
  return mp.CLEAN
end
if not (string.find(l_0_4, "require", 1, true) and string.find(l_0_4, "process", 1, true)) or not l_0_5(l_0_4, {
  "fetch",
  "node:https",
  "'https'",
  "\"https\"",
  "node:http",
  "'http'",
  "\"http\""
}) then
  return mp.CLEAN
end
return mp.INFECTED
