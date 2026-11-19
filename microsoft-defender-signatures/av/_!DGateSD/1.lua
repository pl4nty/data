-- Threat: \xac!DGate.SD
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: BM_LNK_FILE

local l_0_0 = mp.GetLnkInfo()
if isnull(l_0_0) then
  return mp.CLEAN
end
if not l_0_0.BasePath or not contains(l_0_0.BasePath, "cmd.exe") then
  return mp.CLEAN
end
local l_0_1 = l_0_0.Arguments or nil
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = l_0_1:lower()
local l_0_2, l_0_3 = l_0_1:gsub("||", "")
local l_0_4, l_0_5 = l_0_1:gsub("&", "")
if 2 < l_0_3 and 2 < l_0_5 then
  if not contains(l_0_1, {
    "p\"?i\"?n\"?g\"?",
    "e\"?c\"?h\"?o\"?"
  }, false) then
    return mp.CLEAN
  end
  if not contains(l_0_1, {
    "c\"?s\"?c\"?r\"?i\"?p\"?t\"?",
    "w\"?s\"?c\"?r\"?i\"?p\"?t\"?",
    "r\"?u\"?n\"?d\"?l\"?l\"?3\"?2\"?"
  }, false) then
    return mp.CLEAN
  end
  if contains(l_0_1, "c\"?u\"?r\"?l\"?%.?e?\"?x?\"?e?\"?%s+.*h\"?t\"?t\"?p\"?s?\"?", false) then
    return mp.INFECTED
  end
end
return mp.CLEAN
