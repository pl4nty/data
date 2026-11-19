-- Threat: !InfrastructureShared
-- Name: 2540f2d14a66
-- Type: 21

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1 == "new folder.exe" or l_0_1 == "documents.exe" or l_0_1 == "music.exe" or l_0_1 == "pictures.exe" or l_0_1 == "videos.exe" or l_0_1 == "recycler.exe" then
    mp.set_mpattribute("Lowfi:SIGATTR:Worm:Win32/PossibleSillyShareCopy.gen")
  end
end
return mp.CLEAN
