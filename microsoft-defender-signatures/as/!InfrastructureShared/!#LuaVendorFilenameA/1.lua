-- Threat: !InfrastructureShared
-- Name: !#Lua:VendorFilename.A
-- Type: 9
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 <= 5 then
  return mp.CLEAN
end
local l_0_1 = {
  ["hiphandlers.dll"] = "mcafee",
  ["hiphandlers64.dll"] = "mcafee",
  ["kevlarsigs.dll"] = "mcafee",
  ["kevlarsigs64.dll"] = "mcafee"
}
if l_0_1[l_0_0] ~= nil and type(l_0_1[l_0_0]) == "string" then
  local l_0_2 = "Lua:VendorFilename.A!" .. l_0_1[l_0_0]
  mp.set_mpattribute(l_0_2)
  return mp.INFECTED
end
return mp.CLEAN
