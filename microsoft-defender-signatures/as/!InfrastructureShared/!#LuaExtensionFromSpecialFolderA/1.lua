-- Threat: !InfrastructureShared
-- Name: !#Lua:ExtensionFromSpecialFolder.A
-- Type: 12

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil and 10 < #l_0_0 and l_0_1 ~= nil and 4 < #l_0_1 then
  local l_0_2 = string.sub(l_0_1, -3)
  local l_0_3 = {
    ocx = true,
    cpl = true,
    tmp = true
  }
  if l_0_3[l_0_2] == true then
    local l_0_4 = "LUA:Ext_" .. l_0_2
    mp.set_mpattribute(l_0_4)
    return mp.CLEAN
  end
end
return mp.CLEAN
