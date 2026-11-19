-- Threat: !InfrastructureShared
-- Name: !#Lua:IOAVFirstPEInTopLevelISOFile
-- Type: 8

if mp.get_mpattribute("//Lua:GIOAVTopLevelISOFile") and not mp.get_mpattribute("RPF:TopLevelFile") and not mp.get_mpattribute("//GIOAVFirstPEInTopLevelISOFile") then
  mp.set_mpattribute("Lua:IOAVFirstPEInTopLevelISOFile")
  mp.set_mpattribute("//GIOAVFirstPEInTopLevelISOFile")
  mp.set_mpattribute("MpNonCachedLowfi")
end
if mp.get_mpattribute("//Lua:GIOAVFirstISOFileInContainer") and not mp.get_mpattribute("RPF:TopLevelFile") and not mp.get_mpattribute("//GIOAVFirstPEInISOFileInContainer") then
  local l_0_0 = string.lower(mp.getfilename())
  if l_0_0:find(".iso->", 1, true) or l_0_0:find(".img->", 1, true) then
    mp.set_mpattribute("Lua:IOAVFirstPEInISOFileInContainer")
    mp.set_mpattribute("//GIOAVFirstPEInISOFileInContainer")
    mp.set_mpattribute("MpNonCachedLowfi")
  end
end
return mp.CLEAN
