-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaTechniqueAttributesProcessingA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if isDefenderPath(l_0_0) == true then
  return mp.CLEAN
end
local l_0_1 = "BM_MT"
local l_0_2 = (mp.enum_mpattributesubstring)(l_0_1)
if l_0_2 == nil or #l_0_2 == 0 or #l_0_2 >= 100 or type(l_0_2) ~= "table" then
  return mp.CLEAN
end
local l_0_3 = {}
local l_0_4 = {}
for l_0_8,l_0_9 in ipairs(l_0_2) do
  local l_0_10, l_0_11 = (string.match)(l_0_9, "^BM_M(([tT][0-9][0-9][0-9][0-9])[%.]?[0-9]?[0-9]?[0-9]?):?(.*)")
  if l_0_10 ~= nil and l_0_11 ~= nil then
    if #l_0_10 > 6 then
      (table.insert)(l_0_4, l_0_10)
      ;
      (mp.set_mpattribute)("BM_M" .. l_0_10)
    end
    ;
    (table.insert)(l_0_3, l_0_11)
    ;
    (mp.set_mpattribute)("BM_M" .. l_0_11)
  end
end
if #l_0_3 <= 1 and #l_0_4 <= 1 then
  return mp.CLEAN
end
do
  if #l_0_4 > 1 then
    local l_0_12 = table_distinct_values(l_0_4)
    if l_0_12 ~= nil then
      if #l_0_12 >= 2 then
        (mp.set_mpattribute)("Lua:SubTechniqueAttributesGTE2")
      end
      if #l_0_12 >= 3 then
        (mp.set_mpattribute)("Lua:SubTechniqueAttributesGTE3")
      end
      if #l_0_12 >= 4 then
        (mp.set_mpattribute)("Lua:SubTechniqueAttributesGTE4")
      end
    end
  end
  do
    if #l_0_3 > 1 then
      local l_0_13 = table_distinct_values(l_0_3)
      if l_0_13 ~= nil then
        if #l_0_13 >= 2 then
          (mp.set_mpattribute)("Lua:TechniqueAttributesGTE2")
        end
        if #l_0_13 >= 3 then
          (mp.set_mpattribute)("Lua:TechniqueAttributesGTE3")
        end
        if #l_0_13 >= 4 then
          (mp.set_mpattribute)("Lua:TechniqueAttributesGTE4")
        end
      end
    end
    return mp.CLEAN
  end
end

