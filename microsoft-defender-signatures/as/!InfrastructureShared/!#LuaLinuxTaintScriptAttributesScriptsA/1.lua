-- Threat: !InfrastructureShared
-- Name: !#Lua:Linux/TaintScriptAttributesScripts.A
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & BM_NewScriptFileCreatedSpecialPath

local l_0_0 = false
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {
  ":Python/",
  ":SH/",
  ":Script/",
  ":Linux/",
  "SCPT"
}
local l_0_3 = "enum_script_attributes"
for l_0_4, l_0_5 in ipairs(l_0_2) do
  local l_0_6 = mp.enum_mpattributesubstring(l_0_5)
  if l_0_6 ~= nil and 1 <= #l_0_6 then
    AppendToRollingQueue(l_0_3, l_0_1, table.concat(l_0_6, "|"))
    l_0_0 = true
  end
end
if l_0_0 == false then
  return mp.CLEAN
end
return mp.INFECTED
