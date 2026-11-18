-- Threat: !InfrastructureShared
-- Name: 7d617e4961b6
-- Type: 21

if peattributes.isdll == true and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  local l_0_0 = mp.getfilesize()
  if l_0_0 < 100000 then
    return mp.CLEAN
  end
  local l_0_1 = string.lower(mp.getfilename(mp.FILEPATH_QUERY_FNAME))
  if l_0_1 == "cryptbase.dll" then
    return mp.INFECTED
  end
end
return mp.CLEAN
