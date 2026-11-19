-- Threat: !InfrastructureShared
-- Name: !#Lua:IOAVXLSFile
-- Type: 13
-- MpAttributes: RPF:AnyFileHasIOAVURL & BM_OFFICE_FILE

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if #l_0_0 < 5 then
  return mp.CLEAN
end
local l_0_1
local l_0_2 = string.sub(l_0_0, -5)
if l_0_2 == ".xlsb" then
  l_0_1 = "XLSBFile"
elseif l_0_2 == ".xltm" then
  l_0_1 = "XLTMFile"
else
  return mp.CLEAN
end
if mp.get_mpattribute("RPF:TopLevelFile") then
  mp.set_mpattribute("Lua:IOAVTopLevel" .. l_0_1)
  mp.set_mpattribute("//Lua:GIOAVTopLevel" .. l_0_1)
elseif not mp.get_mpattribute("//Lua:GIOAVFirst" .. l_0_1 .. "InContainer") then
  mp.set_mpattribute("Lua:IOAVFirst" .. l_0_1 .. "InContainer")
  mp.set_mpattribute("//Lua:GIOAVFirst" .. l_0_1 .. "InContainer")
end
return mp.CLEAN
