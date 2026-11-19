-- Threat: !InfrastructureShared
-- Name: !#Lua:Adware:Adposhel
-- Type: 9

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:find("programdata", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2 = l_0_0:match("(.+\\)([^\\]+)$")
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_2:len() == 12 and l_0_2:sub(-4) == ".dll" then
  local l_0_3, l_0_4 = l_0_1:match("(.+\\)(.+)\\$")
  if l_0_4:len() == 8 then
    local l_0_5, l_0_6 = string.gsub(l_0_4, "%d", "")
    local l_0_7, l_0_8 = string.gsub(l_0_2, "%d", "")
    if 1 <= l_0_8 and 1 <= l_0_6 and 3 <= l_0_8 + l_0_6 and l_0_2:match("%x%x%x%x%x%x%x%x.dll") and l_0_4:match("%x%x%x%x%x%x%x%x") then
      mp.set_mpattribute("LUA:Adposhell:Name")
    end
  end
end
return mp.CLEAN
