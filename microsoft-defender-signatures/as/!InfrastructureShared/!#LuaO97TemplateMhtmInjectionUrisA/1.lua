-- Threat: !InfrastructureShared
-- Name: !#Lua:O97/TemplateMhtmInjectionUris.A
-- Type: 13
-- MpAttributes: SCPT:O97M/TemplateMhtmlInj.A | SCPT:OleMshtmlHttpUsc.A | SCPT:OleMshtmlTargetExternal.A

local l_0_0 = mp.getfilesize()
if 1536000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("_rels/", 1, true) then
  local l_0_2
  local l_0_3 = 0
  local l_0_4 = ""
  mp.readprotection(false)
  l_0_2 = tostring(mp.readfile(0, l_0_0))
  for l_0_5 in l_0_2:gmatch("<Relationship %/?([%w:]+.-%/?)/>") do
    local l_0_6 = l_0_5:match("Type%S?=%S?\"[%w:/.]+/relationships/([%w/.]+)")
    local l_0_7 = l_0_5:match("Target%S?=%S?\"mhtml%:%s?(http[^\"]+)")
    if l_0_7 ~= nil and l_0_6 ~= nil then
      local l_0_8 = string.lower(l_0_7)
      l_0_4 = l_0_4 .. "\n" .. string.lower(l_0_6) .. "->" .. l_0_8
      l_0_3 = l_0_3 + 1
    end
  end
  if 1 < l_0_3 then
    mp.vfo_add_buffer(l_0_4, "[officedocuri]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    return mp.INFECTED
  end
end
return mp.CLEAN
