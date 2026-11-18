-- Threat: !InfrastructureShared
-- Name: !#Lua:IOAVFirstExeInSingleExeZip
-- Type: 9

if not mp.get_mpattribute("//GIOAVFirstExeInSingleExeZip") then
  if mp.get_mpattribute("//RPF:G_IOAV_SINGLE_EXE_IN_ZIP") then
    mp.set_mpattribute("Lua:IOAVFirstExeInSingleExeZip")
    mp.set_mpattribute("//GIOAVFirstExeInSingleExeZip")
    mp.set_mpattribute("MpNonCachedLowfi")
  else
    local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:UfsIOAVSingleEXEZip", true)
    if l_0_0 == 0 and l_0_1 then
      mp.set_mpattribute("Lua:IOAVFirstExeInSingleExeZip")
      mp.set_mpattribute("//GIOAVFirstExeInSingleExeZip")
      mp.set_mpattribute("MpNonCachedLowfi")
    end
  end
end
return mp.CLEAN
