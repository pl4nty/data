-- Threat: !InfrastructureShared
-- Name: 198dde0e5fe6
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("undecimus", 1, true) then
  return mp.CLEAN
end
if l_0_0:find(".deb", 1, true) then
  return mp.CLEAN
end
if l_0_0:find(".app", 1, true) then
  return mp.CLEAN
end
if l_0_0:find(".iso", 1, true) then
  return mp.CLEAN
end
if l_0_0:find(".ipa", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("drfone", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("checkn", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("data.tar.xz", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("program files", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("programdata", 1, true) then
  return mp.CLEAN
end
if l_0_0:find(".exe", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("just4fun", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
