-- Threat: !InfrastructureShared
-- Name: c1b33ef326ad
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[4]
if l_0_0 == nil or l_0_0.matched ~= true or l_0_0.utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p2
l_0_1 = l_0_1:match("=(https?://.-);")
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2.SIG_CONTEXT = "BM"
l_0_2.CONTENT_SOURCE = "MaleficAms_NRI"
l_0_2.PROCESS_CONTEXT = "powershell.exe"
l_0_2.FILELESS = "false"
l_0_2.CMDLINE_URL = "false"
local l_0_3, l_0_4 = ExtractUrlGetReputation(l_0_1, l_0_2, true, 2, 60, false, 3000)
if l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
