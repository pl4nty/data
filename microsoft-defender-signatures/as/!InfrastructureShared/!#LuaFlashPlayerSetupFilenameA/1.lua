-- Threat: !InfrastructureShared
-- Name: !#Lua:FlashPlayerSetupFilename.A
-- Type: 8
-- MpAttributes: RPF:TopLevelFile

local l_0_0
l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_LOWERCASE, mp.FILEPATH_QUERY_FNAME))
if l_0_0 ~= nil then
  local l_0_1 = {
    ["flashplayer_setup.exe"] = ""
  }
  if l_0_1[l_0_0] ~= nil then
    mp.set_mpattribute("Lua:FlashPlayerSetupFilename.A")
  end
end
return mp.CLEAN
