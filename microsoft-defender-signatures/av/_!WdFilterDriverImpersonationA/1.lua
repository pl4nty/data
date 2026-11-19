-- Threat: \xd8!WdFilterDriverImpersonation.A
-- Type: 11
-- MpAttributes: RPF:TopLevelFile & BM_ESRP:Lua:RenamedSignedDriver & (BM_ESRP:Lua:Rwdrv | BM_ESRP:Lua:Vboxdrv | BM_ESRP:Lua:Capcom | BM_ESRP:Lua:Cpuz | BM_ESRP:Lua:powertool | BM_ESRP:Lua:WinRing0x64 | BM_ESRP:Lua:WinRing0 | BM_ESRP:Lua:kprocesshacker | BM_ESRP:Lua:Phymem | BM_ESRP:Lua:VulnerableAsrDriverMatched)

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "wdfilter.sys" then
  return mp.INFECTED
end
return mp.CLEAN
