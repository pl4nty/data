-- Threat: !InfrastructureShared
-- Name: !#Lua:TechniqueAttributesProcessing.A
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: Lua:IsNotLegacyOrgMachine

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if isDefenderPath(l_0_0) == true then
  return mp.CLEAN
end
local l_0_1 = "BM_MT"
local l_0_2 = mp.enum_mpattributesubstring(l_0_1)
if l_0_2 == nil or #l_0_2 == 0 or 100 <= #l_0_2 or type(l_0_2) ~= "table" then
  return mp.CLEAN
end
local l_0_3 = {}
local l_0_4 = {}
for l_0_5, l_0_6 in ipairs(l_0_2) do
  local l_0_7, l_0_8 = string.match(l_0_6, "^BM_M(([tT][0-9][0-9][0-9][0-9])[%.]?[0-9]?[0-9]?[0-9]?):?(.*)")
  if l_0_7 ~= nil and l_0_8 ~= nil then
    if 6 < #l_0_7 then
      table.insert(l_0_4, l_0_7)
      mp.set_mpattribute("BM_M" .. l_0_7)
    end
    table.insert(l_0_3, l_0_8)
    mp.set_mpattribute("BM_M" .. l_0_8)
  end
end
if #l_0_3 <= 1 and #l_0_4 <= 1 then
  return mp.CLEAN
end
if 1 < #l_0_4 then
  local l_0_9 = table_distinct_values(l_0_4)
  if l_0_9 ~= nil then
    if 2 <= #l_0_9 then
      mp.set_mpattribute("Lua:SubTechniqueAttributesGTE2")
    end
    if 3 <= #l_0_9 then
      mp.set_mpattribute("Lua:SubTechniqueAttributesGTE3")
    end
    if 4 <= #l_0_9 then
      mp.set_mpattribute("Lua:SubTechniqueAttributesGTE4")
    end
  end
end
if 1 < #l_0_3 then
  local l_0_10 = table_distinct_values(l_0_3)
  if l_0_10 ~= nil then
    if 2 <= #l_0_10 then
      mp.set_mpattribute("Lua:TechniqueAttributesGTE2")
    end
    if 3 <= #l_0_10 then
      mp.set_mpattribute("Lua:TechniqueAttributesGTE3")
    end
    if 4 <= #l_0_10 then
      mp.set_mpattribute("Lua:TechniqueAttributesGTE4")
    end
  end
end
return mp.CLEAN
