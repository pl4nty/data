-- Threat: !InfrastructureShared
-- Name: 18298f74e0ad
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 then
  if l_0_0:find("[\\/]adobe[\\/]") or l_0_0:find("[\\/]macos%-notification%-state[\\/]") or l_0_0:find("[\\/]discord_spellcheck[\\/]") then
    return mp.CLEAN
  else
    return mp.INFECTED
  end
end
return mp.CLEAN
