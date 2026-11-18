-- Threat: \xd0!OfcLnSrvcDref.BB
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = string.sub(l_0_0, -4)
local l_0_2 = {
  [".eml"] = ""
}
if not l_0_2[l_0_1] then
  return mp.CLEAN
end
local l_0_3 = mp.getfilesize()
if 327680 < l_0_3 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_4 = mp.readfile(0, l_0_3)
mp.readprotection(true)
if string.find(l_0_4, "\127\015\001\031\t\019\025\023\022\005\028\030\t\017\023\f\020\019\005\020\023", 1, true) and string.find(l_0_4, "Content%-Type:%s*text/html") and string.find(l_0_4, "table%s+border%s+cellspacing=\"%d%d%d%d%d%d%d%d*\"") then
  return mp.INFECTED
end
return mp.CLEAN
