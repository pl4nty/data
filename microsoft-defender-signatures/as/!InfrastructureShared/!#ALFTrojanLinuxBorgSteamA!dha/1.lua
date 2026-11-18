-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Linux/BorgSteam.A!dha
-- Type: 12
-- MpAttributes: Lua:FileInTar & (BM_ELF_FILE | BM_SH_FILE)

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil and string.find(l_0_0, "_jffs", 1, true) ~= nil and (string.find(l_0_0, "/usericon/", 1, true) ~= nil or string.find(l_0_0, "/cfgicon/", 1, true) ~= nil) then
  return mp.INFECTED
end
return mp.CLEAN
