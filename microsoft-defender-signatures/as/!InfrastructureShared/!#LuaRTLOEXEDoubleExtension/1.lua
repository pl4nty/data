-- Threat: !InfrastructureShared
-- Name: !#Lua:RTLOEXEDoubleExtension
-- Type: 12

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:len() < 9 then
  return mp.CLEAN
end
local l_0_1 = string.sub(l_0_0, -4)
local l_0_2 = {
  [".exe"] = "",
  [".scr"] = ""
}
if not l_0_2[l_0_1] then
  return mp.CLEAN
end
local l_0_3 = {
  [".\174cod"] = "",
  [".\174slx"] = "",
  [".\174tpp"] = "",
  [".\174fdp"] = "",
  [".\174gpj"] = "",
  [".\174fig"] = "",
  [".\174gnp"] = "",
  [".\174cip"] = "",
  [".\174txt"] = "",
  [".\1743pm"] = "",
  ["\174xcod"] = "",
  ["\174xlsx"] = "",
  ["\174xslx"] = "",
  ["\174xtpp"] = ""
}
local l_0_4 = string.sub(l_0_0, -9)
if l_0_3[string.sub(l_0_4, 1, 5)] then
  mp.set_mpattribute("Lua:RTLOEXEDoubleExtension")
end
return mp.CLEAN
