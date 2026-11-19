-- Threat: !InfrastructureShared
-- Name: 25b3b8faf9d2
-- Type: 21

local l_0_0 = {
  ["omadmclient.exe"] = true,
  ["provtool.exe"] = true
}
local l_0_1 = string.lower(string.match(bm.get_imagepath(), "\\([^\\]+)$"))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if l_0_0[l_0_1] == true then
  return mp.CLEAN
end
return mp.INFECTED
