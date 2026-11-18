-- Threat: !InfrastructureShared
-- Name: 7a78a02f92ca
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 90000 or 250000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
local l_0_2 = l_0_1 and l_0_1:match("^(.*)%.[^%.]+$")
if sysio.IsFileExists(l_0_2) then
  mp.ReportLowfi(l_0_2, 765448122)
end
return mp.INFECTED
