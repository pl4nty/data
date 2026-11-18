-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspExtExeWithMotw
-- Type: 10
-- MpAttributes: pea_isexe & RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true and mp.GetMOTWZone() >= 3 then
  local l_0_0 = mp.getfilesize()
  if l_0_0 <= 4194304 then
    local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
    local l_0_2 = l_0_1:sub(-4)
    local l_0_3 = l_0_1:sub(-11)
    local l_0_4 = {
      [".exe"] = true,
      [".dll"] = true,
      [".msi"] = true,
      [".sys"] = true,
      [".quarantine"] = true
    }
    if l_0_4[l_0_2] == true or l_0_4[l_0_3] == true then
      return mp.CLEAN
    end
    mp.set_mpattribute("LUA:SuspExtExeWithMotw.A")
  end
end
return mp.CLEAN
