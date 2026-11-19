-- Threat: !InfrastructureShared
-- Name: 4c292001b010
-- Type: 21

if mp.get_mpattribute("Lua:XMLExt") then
  local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_0:find("abusepreventionengineconfig.xml", 1, true) then
    mp.set_mpattribute("MpNonPIIFileType")
    return mp.INFECTED
  end
end
return mp.CLEAN
