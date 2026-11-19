-- Threat: !InfrastructureShared
-- Name: !#Lua:IOAVFirstPEInUDFFile
-- Type: 8

if mp.get_mpattribute("//Lua:GIOAVTopLevelUDFFile") and not mp.get_mpattribute("RPF:TopLevelFile") and not mp.get_mpattribute("//GIOAVFirstPEInTopLevelUDFFile") then
  mp.set_mpattribute("Lua:IOAVFirstPEInTopLevelUDFFile")
  mp.set_mpattribute("//GIOAVFirstPEInTopLevelUDFFile")
  mp.set_mpattribute("MpNonCachedLowfi")
end
if mp.get_mpattribute("//Lua:GIOAVFirstUDFFileInContainer") and not mp.get_mpattribute("RPF:TopLevelFile") and not mp.get_mpattribute("//GIOAVFirstPEInUDFFileInContainer") then
  local l_0_0 = string.lower(mp.getfilename())
  if l_0_0:find(".iso->", 1, true) or l_0_0:find(".img->", 1, true) then
    mp.set_mpattribute("Lua:IOAVFirstPEInUDFFileInContainer")
    mp.set_mpattribute("//GIOAVFirstPEInUDFFileInContainer")
    mp.set_mpattribute("MpNonCachedLowfi")
  end
end
return mp.CLEAN
