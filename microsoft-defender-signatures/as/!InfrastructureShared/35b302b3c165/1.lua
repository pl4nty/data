-- Threat: !InfrastructureShared
-- Name: 35b302b3c165
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
