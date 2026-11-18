-- Threat: !InfrastructureShared
-- Name: 21293c259010
-- Type: 21

if mp.get_mpattribute("SCPT:Win32/WinLNK.HGJ1") and mp.get_mpattribute("SCPT:Win32/WinLNK.HGJ2") then
  local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_0 ~= nil and (string.find(l_0_0, "%.png%.lnk$") or string.find(l_0_0, "%.png%.lnk%-%>%[")) then
    mp.set_mpattribute("LUA:Win32/WinLNK.HGJ4")
  end
end
return mp.INFECTED
