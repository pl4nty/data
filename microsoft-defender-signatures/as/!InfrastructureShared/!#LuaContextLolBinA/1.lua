-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/LolBin.A
-- Type: 8

if peattributes.isdll and not peattributes.no_exports then
  local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_0 == "scrobj.dll" then
    mp.set_mpattribute("Lua:Context:Filename_scrobj_dll")
  end
end
return mp.CLEAN
