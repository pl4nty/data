-- Threat: !InfrastructureShared
-- Name: !#Lua:LargeMSBuildTag.A
-- Type: 13
-- MpAttributes: BM_XML_FILE & AGGR:XMLSearchBase64.A

local l_0_0 = tostring(headerpage)
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = {}

local function l_0_4(l_1_0)
  if not l_0_2[l_1_0] then
    l_0_2[l_1_0] = true
    l_0_3[#l_0_3 + 1] = l_1_0
  end
end

local function l_0_5(l_2_0)
  for l_2_1 = #l_0_1, 1, -1 do
    if l_0_1[l_2_1] == l_2_0 then
      return true
    end
  end
  return false
end

l_0_0 = l_0_0:gsub("<!%-%-.-%-%->", ""):gsub("<!%[CDATA%[.-%]%]>", ""):gsub("<%?.-%?>", "")
for l_0_6 in l_0_0:gmatch("<([^>]+)>") do
  local l_0_8 = l_0_6:match("^%s*/") ~= nil
  local l_0_10 = l_0_6:match("^%s*!") ~= nil
  local l_0_11 = l_0_6:match("^%s*/?%s*([%w_-]+)")
  if l_0_8 and l_0_11 then
    while true do
      if not (0 < #l_0_1) or table.remove(l_0_1) == l_0_11 then
        break
      end
    end
  elseif not l_0_10 and l_0_11 then
    local l_0_12 = l_0_1[#l_0_1]
    local l_0_13 = l_0_1[#l_0_1 - 1]
    if l_0_12 == "PropertyGroup" or l_0_12 == "ItemGroup" or l_0_12 == "ItemDefinitionGroup" or l_0_12 == "Target" or l_0_12 == "ParameterGroup" and l_0_13 == "UsingTask" or l_0_5("ProjectExtensions") or l_0_5("CurrentSolutionConfigurationContents") or l_0_12 and l_0_12 ~= "Project" and (l_0_13 == "ItemGroup" or l_0_13 == "ItemDefinitionGroup") then
      l_0_4(l_0_11)
    end
    if not l_0_6:match("/%s*$") and #l_0_1 < 256 then
      l_0_1[#l_0_1 + 1] = l_0_11
    end
  end
end
if #l_0_3 == 0 then
  return mp.CLEAN
end
local l_0_14 = tostring(footerpage)
for l_0_15, l_0_16 in pairs(l_0_3) do
  if l_0_14:find("</" .. l_0_16 .. ">", 1, true) and not l_0_14:find("<" .. l_0_16 .. ">", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
