-- Threat: !InfrastructureShared
-- Name: !#LUA:7zFileNamewithPassword
-- Type: 13
-- MpAttributes: BM_ZIP_FILE | (Lua:7ZExt & BM_7Z_FILE)

local l_0_0 = mp.getfilename()
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "--\226\156\181\225\180\152\225\180\128$$\225\180\161\195\152\202\128\240\157\146\159", 1, true) ~= nil or string.find(l_0_0, "Pa$$C\197\140\240\157\148\187e--", 1, true) ~= nil or string.find(l_0_0, "\240\157\151\163\240\157\151\174\240\157\152\128\240\157\152\128\240\157\152\132\240\157\151\188\240\157\151\191\240\157\151\1772025", 1, true) ~= nil or string.find(l_0_0, "-\240\157\144\146\240\157\145\146\240\157\147\137\240\157\147\138\240\157\147\133\226\154\153\239\184\1432025", 1, true) ~= nil then
  mp.set_mpattribute("LUA:7zHasFileNamewithPassword")
  return mp.INFECTED
end
return mp.CLEAN
