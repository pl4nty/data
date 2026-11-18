-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:DuckTailsKnownMachines
-- Type: 13
-- MpAttributes: ALF:Trojan:MSIL/Ducktail.A

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if l_0_0:find(":\\working\\sdc", 1, true) ~= nil then
  return mp.INFECTED
end
if l_0_0:find("^%a:\\users\\", 1) then
  local l_0_2 = l_0_0:match("^%a:\\users\\([^\\]+)")
  local l_0_3 = "kassir|quang luu|mr quang|quang luu pc|viet hoang|lenovo|hp|asus"
  if l_0_3:find(l_0_2, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
