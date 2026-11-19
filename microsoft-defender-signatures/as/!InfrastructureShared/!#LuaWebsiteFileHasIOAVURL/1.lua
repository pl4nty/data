-- Threat: !InfrastructureShared
-- Name: !#Lua:WebsiteFileHasIOAVURL
-- Type: 13
-- MpAttributes: RPF:AnyFileHasIOAVURL

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:len() > 8 and string.sub(l_0_0, -8) == ".website" then
  if mp.get_mpattribute("RPF:TopLevelFile") then
    mp.set_mpattribute("Lua:WebsiteFileHasIOAVURL")
  else
    mp.set_mpattribute("Lua:WebsiteChildFileHasIOAVURL")
  end
elseif l_0_0:len() > 10 and string.sub(l_0_0, -10) == ".appref-ms" then
  if mp.get_mpattribute("RPF:TopLevelFile") then
    mp.set_mpattribute("Lua:ApprefFileHasIOAVURL")
  else
    mp.set_mpattribute("Lua:ApprefChildFileHasIOAVURL")
  end
end
return mp.CLEAN
