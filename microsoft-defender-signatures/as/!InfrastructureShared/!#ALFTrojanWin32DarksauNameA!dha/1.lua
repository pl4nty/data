-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Darksau.Name.A!dha
-- Type: 10

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "ewsapplication.exe" then
  return mp.INFECTED
end
if string.match(l_0_0, "o365token%d?%d?%d?%d?%.exe") then
  return mp.INFECTED
end
if string.match(l_0_0, "hpatoken%d?%d?%d?%d?%.exe") then
  return mp.INFECTED
end
if string.match(l_0_0, "hpauser%d?%d?%d?%.exe") then
  return mp.INFECTED
end
return mp.CLEAN
