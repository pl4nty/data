-- Threat: !InfrastructureShared
-- Name: !#Lua:ContinueCheckFileNameThrottled
-- Type: 12

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0 == "sihost.exe" then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:ContinueCheckFileNameThrottled")
return mp.CLEAN
